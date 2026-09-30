# 第4章：旋转推导与坐标变换工程案例

三维旋转的推导、右手循环助记、主动与被动旋转放在第4.1.1节的“三维图形学中的线性变换”。第4.5节取消内部小节标题，以连续工程叙事讲测量、试验与软件之间的坐标转换，仅保留向量换基、同一作用换基两条核心公式。所有图为原创 TikZ；轨迹、模型姿态及向量均为教学示意，不是实际飞行数据。

## 第4.1.1节的推导依据

- D. M. Henderson, *Euler Angles, Quaternions, and Transformation Matrices: Working Relationships*, NASA-TM-74839 / JSC-12960, 1977。第2.1节提供基本矩阵和反向转换的对照。讲义采用右手系、列向量、固定轴主动旋转，不能忽略约定照搬其他材料的正负号。[NASA NTRS](https://ntrs.nasa.gov/citations/19770024290)
- Renato Zanetti, *Rotations, Transformations, Left Quaternions, Right Quaternions?*, The Journal of the Astronautical Sciences 66(3), 361–381, 2019。用于主动/被动解释与方向余弦矩阵的区分，不引入论文标题中的其他表示工具。[作者稿](https://sites.utexas.edu/near/files/2022/07/Rotations.pdf) · [DOI](https://doi.org/10.1007/s40295-018-00151-2)
- 码农爱学习，《3维旋转矩阵推导与助记》，知乎，2023-04-03更新。用户指定辅助阅读材料；在前次修订中通过浏览器实际阅读。讲义独立绘图，以高中两角和公式重新推导，不复制原图。[文章](https://zhuanlan.zhihu.com/p/183973440)

## 第4.5节的工程背景依据

- 关世义，《基于钱学森弹道的新概念飞航导弹》，《飞航导弹》2003(01)，1–4。期刊页面核对作者、卷期及助推—滑翔背景；不把五条示意曲线当作论文的数值数据，也不据此断言未验证的具体历史日期。[DOI](https://doi.org/10.16338/j.issn.1009-1319.2003.01.001)
- NASA Glenn Research Center, *Force Balance Coordinates*, 2021-05-13。2026-09-30读取原文，核对内部天平按机体轴、外部天平按风轴记录力这一具体工程场景。图4.17c是按这一说明原创的教学图，不是天平结构设计图，不复现气动力公式。[原文](https://www.grc.nasa.gov/www/k-12/airplane/tunbalaxes.html)
- Chen K, Zhou J, Shen F Q, et al., *Hypersonic boost–glide vehicle strapdown inertial navigation system/global positioning system algorithm in a launch-centered earth-fixed frame*, Aerospace Science and Technology 98, 105679, 2020。核对出版元数据与出版商可检索的引言内容；本节只用参考系选择随工作任务变化的背景，不采用算法、性能参数或计算过程。[DOI](https://doi.org/10.1016/j.ast.2020.105679)
- NASA/JPL NAIF, *SPICE Required Reading: Reference Frames*。核对转换的源参考系、目标参考系和时刻，以及参考系、位置与状态的不同含义。用于软件接口与数据记录的工程动机。[原文](https://naif.jpl.nasa.gov/pub/naif/toolkit_docs/C/req/frames.html)
- T. A. Talay, *Introduction to the Aerodynamics of Flight*, NASA SP-367, Appendix C: Coordinate Systems, 1975。核对飞行中不同坐标架的用途。[NASA报告](https://ntrs.nasa.gov/api/citations/19760003955/downloads/19760003955.pdf)
- 陈阳泉，《坐标系转换矩阵与几何关系方程式的推导程序》，《西安工业学院学报》1989，9(3)。仅用于坐标关系可交由程序重复处理这一背景。[作者单位托管原文](https://mechatronics.ucmerced.edu/sites/mechatronics.ucmerced.edu/files/documents/papers-in-chinese/222.zuo_biao_xi_zhuan_huan_ju_zhen_yu_ji_he_guan_xi_fang_cheng_shi_de_tui_dao_cheng_xu_chen_yang_quan_.pdf)

## 图目与检查要点

- 4.6a：平面旋转的三角推导；4.6b：三个有序截面；4.6c：主动与被动旋转。保留原图4.6及后续整数图号。
- 4.17a：五种概念轨迹；4.17b：飞行阶段与三组坐标；4.17c：风洞中的机体轴记录与风轴记录；4.17d：转台试验与软件回放中的同一次转动。
- 三个截面的有序坐标是 `(y,z)`、`(z,x)`、`(x,y)`；绕 y 轴必须先按 `(z,x)` 使用二维公式，再排回 `(x,y,z)`。
- 工程图不添加旋转矩阵的逐项运算。风洞两图使用同一个示意力；回放图的两组观察基分别固定，模型在两行完成相同动作。
- 相似公式用于同一作用的输入、输出同时换基；只改变方向余弦矩阵的参考基，不一律使用相似变换。两套位置记录若原点不同，还须计入原点位移。
- 撤下第4.5节中的固定轴连乘算例、角度表示退化讨论及其未再使用的参考文献；工程案例不再承担这些数学推导。
