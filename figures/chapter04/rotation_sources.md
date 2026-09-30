# 第4.5节：旋转、换基与相似矩阵

本次修订采用原创 LaTeX/TikZ 推导与插图，图号为 4.17a—4.17k。所有轨迹、角度及坐标数值均为教学示意，不是实际飞行数据；不包含飞行性能计算或控制方法。

## 资料及用途

- 关世义，《基于钱学森弹道的新概念飞航导弹》，《飞航导弹》2003(01)，1—4。期刊页面核对作者、卷期及“助推—滑翔”背景；仅用于引入，不作为图中五条曲线的数值来源。[DOI](https://doi.org/10.16338/j.issn.1009-1319.2003.01.001)
- D. M. Henderson, *Euler Angles, Quaternions, and Transformation Matrices: Working Relationships*, NASA-TM-74839 / JSC-12960, 1977。核对第2.1节的基本矩阵、轴序、逆向变换与转置。讲义独立规定固定轴主动旋转，不能不检查约定便照搬报告中的复合顺序。[NASA NTRS](https://ntrs.nasa.gov/citations/19770024290)
- Renato Zanetti, *Rotations, Transformations, Left Quaternions, Right Quaternions?*, The Journal of the Astronautical Sciences 66(3), 361—381, 2019。核对主动/被动解释、方向余弦矩阵及固定轴/随动轴复合；不讲论文标题中的其他表示工具。[作者稿](https://sites.utexas.edu/near/files/2022/07/Rotations.pdf) · [DOI](https://doi.org/10.1007/s40295-018-00151-2)
- Malcolm D. Shuster, F. Landis Markley, *General Formula for Extracting the Euler Angles*, Journal of Guidance, Control, and Dynamics 29(1), 215—217, 2006。核对角度表示的特殊情形与非唯一性；讲义用自拟的固定轴 YZX 例子说明，不引入提取算法。[作者稿](https://malcolmdshuster.com/Pub_2006a_J_eulerx_AIAA.pdf) · [DOI](https://doi.org/10.2514/1.16622)
- 陈阳泉，《坐标系转换矩阵与几何关系方程式的推导程序》，《西安工业学院学报》1989，9(3)。用于说明坐标公式的程序化推导这一计算机应用背景，不将不同坐标约定下的乘积冒充为同一公式。[作者单位托管原文](https://mechatronics.ucmerced.edu/sites/mechatronics.ucmerced.edu/files/documents/papers-in-chinese/222.zuo_biao_xi_zhuan_huan_ju_zhen_yu_ji_he_guan_xi_fang_cheng_shi_de_tui_dao_cheng_xu_chen_yang_quan_.pdf)
- NASA/JPL NAIF，*SPICE Required Reading: Reference Frames*。区分坐标分量转换、运动参考系以及状态变换。[原文](https://naif.jpl.nasa.gov/pub/naif/toolkit_docs/C/req/frames.html)
- 码农爱学习，《3维旋转矩阵推导与助记》，知乎，2023-04-03 更新。本次通过浏览器实际阅读；采用“二维到三维，再区分向量旋转与坐标轴旋转”的讲解启发，未复制原图。公式以讲义约定重新推导并数值校验。[用户指定文章](https://zhuanlan.zhihu.com/p/183973440)

## 数学与图示约定

- 列向量，右手坐标系；三个基本矩阵先表示固定坐标中的主动旋转。正方向按右手法则。
- 三个二维截面的有序坐标分别为 `(y,z)`、`(z,x)`、`(x,y)`。绕 y 轴时必须先按 `(z,x)` 写二维公式，再排回 `(x,y,z)`。
- `P` 的列为新基在旧基下的坐标，因此从新坐标到旧坐标左乘 `P`，反向使用其逆矩阵。
- 方向余弦矩阵要求单位且两两垂直的基。正交性不单独保证是旋转；反射也可能保持长度与夹角。
- 相似关系用于同一作用的输入、输出同时换基；只改变方向余弦矩阵的参考基时，按转换链左乘。
- 位置坐标若使用不同原点，须加入原点位移。速度“分量换算”不等于改变所取相对速度的参考物。
- 删除原稿中缺少作者、题名及年份的硕士论文占位引用；撤下本节未据原文验证的旧引用，不以它们支撑新推导。

## 图目

4.17a 五种轨迹形态；4.17b 三种坐标架；4.17c 平面旋转推导；4.17d 三个有序截面；4.17e 主动与被动旋转；4.17f 方向余弦矩阵的列；4.17g 固定轴旋转链；4.17h 不交换的两条路线；4.17i 三角参数非唯一；4.17j 相似变换环；4.17k 不同原点的位置向量。
