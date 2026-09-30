[CmdletBinding()]
param(
    [switch]$CheckOnly
)

$ErrorActionPreference = 'Stop'
$projectRoot = $PSScriptRoot
$sourcePath = Join-Path $projectRoot 'main.tex'
$pdfName = '线性代数及其应用'
$publishedPdf = Join-Path $projectRoot "$pdfName.pdf"
$buildDirectory = Join-Path $projectRoot 'tmp/build-publish'
$builtPdf = Join-Path $buildDirectory "$pdfName.pdf"
$compiler = (Get-Command xelatex -ErrorAction Stop).Source

if (-not (Test-Path -LiteralPath $sourcePath -PathType Leaf)) {
    throw "Source file not found: $sourcePath"
}
if (-not (Test-Path -LiteralPath $publishedPdf -PathType Leaf)) {
    throw "Existing synced PDF not found: $publishedPdf. Restore or sync the original file before building."
}

$compilerArguments = @(
    '-interaction=nonstopmode'
    '-halt-on-error'
    "-jobname=$pdfName"
    "-output-directory=$buildDirectory"
    'main.tex'
)

if ($CheckOnly) {
    Write-Output "Source: $sourcePath"
    Write-Output "Published PDF: $publishedPdf"
    Write-Output "Compiler: $compiler"
    Write-Output ('Arguments (two passes): ' + ($compilerArguments -join ' '))
    Write-Output 'Check complete. No files were changed.'
    return
}

New-Item -ItemType Directory -Path $buildDirectory -Force | Out-Null
Push-Location -LiteralPath $projectRoot
try {
    for ($pass = 1; $pass -le 2; $pass++) {
        & $compiler @compilerArguments
        if ($LASTEXITCODE -ne 0) {
            throw "XeLaTeX pass $pass failed. The published PDF has not been changed."
        }
    }
    if (-not (Test-Path -LiteralPath $builtPdf -PathType Leaf)) {
        throw "Compiled PDF not found: $builtPdf"
    }
    # Read the complete successful build before opening the synced file for writing.
    $pdfBytes = [System.IO.File]::ReadAllBytes($builtPdf)
    if ($pdfBytes.Length -lt 5 -or [System.Text.Encoding]::ASCII.GetString($pdfBytes, 0, 5) -ne '%PDF-') {
        throw 'The build did not produce a valid PDF header. The published PDF has not been changed.'
    }

    # Open the existing file, preserving its local identity; never delete and recreate it.
    # Modification time changes normally so WPS can detect a later content update.
    $outputStream = [System.IO.File]::Open(
        $publishedPdf,
        [System.IO.FileMode]::Open,
        [System.IO.FileAccess]::Write,
        [System.IO.FileShare]::None
    )
    try {
        $outputStream.Position = 0
        $outputStream.Write($pdfBytes, 0, $pdfBytes.Length)
        $outputStream.SetLength($pdfBytes.Length)
        $outputStream.Flush($true)
    }
    finally {
        $outputStream.Dispose()
    }

    if ((Get-FileHash -LiteralPath $builtPdf).Hash -ne (Get-FileHash -LiteralPath $publishedPdf).Hash) {
        throw 'Published PDF verification failed.'
    }
    $generatedGlossary = Join-Path $buildDirectory '术语表.tex'
    if (Test-Path -LiteralPath $generatedGlossary -PathType Leaf) {
        Copy-Item -LiteralPath $generatedGlossary -Destination (Join-Path $projectRoot '术语表.tex') -Force
    }
    Write-Output "Updated existing PDF: $publishedPdf"
}
finally {
    Pop-Location
}
