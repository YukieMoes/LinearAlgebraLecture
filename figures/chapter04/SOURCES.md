# 第4章介绍性实例与图示

- `original.txt` 保存用户正文原文；`main.tex` 中的 `FOUR ORIGINAL` 标记保留全部19段，仅将 A、x、Ax 转为数学排版。
- 按用户后续反馈，将大型太空合成图改成三幅分开的教学图：复古航行插画、三维旋转、二维基变换。原先的深蓝彩色方案未用于讲义。
- `apollo_vintage.png`：使用内置 image_gen 工具实际生成的原创叙事插画。米黄纸底、黑灰线描；非历史照片，非航天器工程结构图，轨迹与比例为示意。
- 图4.2、图4.3：在 `main.tex` 中使用 TikZ 绘制的精确数学图。三维旋转取 v=(2,0,2)，绕 z 轴旋转90度后为 (0,2,2)；二维换基固定 r=(3,1)，新正交单位基旋转45度，新坐标为 (2√2,-√2)。两幅换基小图的箭头起点、终点和比例相同。
- 原文中的史实数字和数学概括完整保留，以独立说明区分时钟与指令速度、固定与可擦写存储器、方向向量与完整姿态、纯换基与原点平移；不以图示把不同原点的位置换算误写成纯线性换基。

## 核对来源

- Raytheon Company, *Apollo Guidance Computer Program, Block I (100) and Block II: Final Report*, NASA-CR-108361 / SR-70-4053, 1969, section 2.3.1.1. [NASA NTRS](https://ntrs.nasa.gov/citations/19700015154)。核对 Block II 内部时钟约1 MHz、2048字可擦写存储器与36864字固定存储器，已收入书末参考文献。
- 线性变换与基变换公式：直接按矩阵乘法和坐标定义核验；P 的列为新基在旧基下的坐标。

## 最终生图提示词（内置工具）

Use case: historical-scene, educational book illustration. Create ONE wide horizontal illustration (about 2.7:1, high resolution) for a Chinese linear algebra textbook introduction about Apollo 11. Art direction MUST be unmistakably vintage PRINTED INK ON OLD PAPER, like a carefully hand-drawn 1960s popular-science textbook engraving. ONLY TWO INKS: faded charcoal black and very subtle warm gray-brown on light ivory uncoated paper. Absolutely NO blue, NO full color, NO black space background, NO glossy silver, NO cinematic lighting, NO photorealism, NO 3D rendering. The paper dominates the page, with irregular delicate pen cross-hatching, restrained halftone dots and small imperfections, elegant uncluttered archival illustration. Draw a small simplified but historically recognizable Apollo command/service module travelling between a partly visible Earth globe at lower left and a partly visible cratered Moon at upper right, connected by one faint ink dashed trajectory. Space is represented by mostly empty ivory paper and just a few tiny ink stars, not a dark star field. The spacecraft should look drawn by an illustrator with pen and brush: flat ink contours, cross-hatched cylindrical service module, conical command module, modest engraved details, no polished highlights. At far lower left, a subtle little engraved inset of hands assembling core-rope memory next to a small unlabelled AGC/DSKY box can connect human craft to the spaceflight; do not show screens with made-up numbers. Keep this inset small and subordinate to the voyage. This image is ONLY narrative background; rotation and basis-change diagrams will be printed separately. Therefore no coordinate axes, no vectors, no mathematical symbols, no arrow diagrams, NO text or letters of any kind, no typography, no captions, no decorative border. Do not depict a book mockup or photo of a page, output the flat artwork. Limited ink, generous blank paper, modest human-centered archival textbook atmosphere.
