# 第3章介绍性实例：正文与图示记录

- 正文以用户提供的《AI时代的线性骨架——ChatGPT 如何用矩阵“读懂”人类语言》为基础。按后续要求，在输入矩阵之前加入简短的 Token 说明，并统一后文与配图的相关称呼。`THREE ORIGINAL` 标记保留的原文段落，`THREE TOKEN INTRO` 与 `THREE TOKEN REVISED` 标记本次补充及相应修订。
- 五幅图：全部为 `main.tex` 内的原创、可编辑 TikZ 教学插图，不使用外部截图或 AI 生图。
- 核对依据：[Vaswani 等，Attention Is All You Need（2017）](https://papers.neurips.cc/paper_files/paper/2017/file/3f5ee243547dee91fbd053c1c4a845aa-Paper.pdf)，第3.2节（注意力、投影维度、掩码）及第5.3节（优化器）。
- Token 说明依据：[OpenAI，Understanding and counting tokens](https://help.openai.com/en/articles/4936856-understanding-and-counting-tokens) 与 [Hugging Face，Tokenizer summary](https://github.com/huggingface/transformers/blob/main/docs/source/en/tokenizer_summary.md)。Token 不必对应完整的字或词，也不是语言学上不可再拆的单位；这里只引入初始向量表示，不声称每个 Token 都对应互不相同、始终不变的向量。

## 与原文分开的读图说明

1. Token 向量先竖排，再转置后逐行放入输入矩阵，保证矩阵大小为 N×d。“AI／改变／世界”是假定的示意切分，不声称是实际分词器的输出；注意力计算会进一步融入上下文。
2. 图2采用单头、等维的教学简化，实际多头投影可为长方形权重矩阵。
3. 注意力机制早于 Transformer；分数先除以维度平方根再作 softmax；自回归语言模型使用因果掩码。
4. AV 的第 i 行是 V 各行的线性组合；逐列看为 A 左乘 V 的每一列。完整注意力因输入相关权重与 softmax 而非整体线性映射。
5. 训练与 Ax=b 的联系是反求参数的类比。实际训练是包含损失函数、反向传播和优化器的迭代优化，不等同于线性方程组求解。

Token 引入按用户后续要求安排在正文中；其余关于教学简化与类比边界的补充仍置于图注中的“读图说明”。
