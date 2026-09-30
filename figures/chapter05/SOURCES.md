# 第5章章首介绍性实例：电网、方程与状态

本组插图服务于“从工程网络的节点方程引出四个基本子空间”，不复原或预测2003年事故。

## 图5.0a：历史时间线与实际停电影响范围

- 资产：`fig5_0a_blackout_area.jpg`。
- 原始来源：U.S.–Canada Power System Outage Task Force, *Final Report on the August 14, 2003 Blackout in the United States and Canada: Causes and Recommendations*, April 2004。
- 官方文件：<https://www.energy.gov/sites/default/files/oeprod/DocumentsandMedia/BlackoutFinal-Web.pdf>。
- 位置：报告印刷第100页、PDF第108页，Figure 6.29, “Area Affected by the Blackout”。
- 处理：直接提取原PDF第108页内嵌的JPEG图像`Im1156.jpg`（247×184像素），原始字节不变；LaTeX中补回原PDF的纵向翻转显示变换，使方向与报告页面一致。保留原始地图、灰色区域与全部图内文字，未重画、改色或生成新的地理边界。原报告图件分辨率有限，未用AI修补或伪造细节。
- 用途与署名：引用联合政府公开调查报告中的单张小图，以说明历史事件的影响范围；正文图注与书末文献均注明报告和原图号。原图本身未另署商业图库作者或许可；不据此宣称讲义拥有原图版权，后续使用应保留来源。
- 解释：灰色为事故影响区域，原图明确说明部分地区仍保持供电；不能当作逐条线路的事故传播图。
- 1882年时间线：Rutgers University, Thomas A. Edison Papers, “1882”，<https://edison.rutgers.edu/edit-chronology/chronology-details/1881---1890/1882>。

## 图5.0b：四节点五线路的节点平衡

原创TikZ，代码位于`main.tex`的`CHAPTER 5 INTRODUCTION`标记内。

- 节点1→2为线路1，1→3为线路2，2→3为线路3，2→4为线路4，3→4为线路5。
- 关联矩阵按节点为行、线路为列；离开节点为+1，进入节点为−1。
- 因而节点2满足−f1+f3+f4=b2，即b2+f1=f3+f4。
- 各线路方向仅为符号约定，电流允许正负；净注入b为正表示外部流入该节点。
- 这是理想直流电路中节点电流守恒的教学图，不是交流电网运行模型，也不是事故数据。

## 图5.0c：同一网络的四个结构问题

原创TikZ。图中零空间的回路增量沿1→2→3→1，按上述线路方向其向量为(t,−t,t,0,0)^T，关联矩阵作用后等于零。

- 列空间对应可由内部线路实现的节点净注入。
- 行空间对应节点电势产生的线路电势差，写作A^T v；这与线路电流不是同一物理量。
- 左零空间包含全1向量，产生各节点净注入之和为零的约束；网络连通时左零空间为该向量张成的一维空间。
- 回路增量只保持节点守恒；真实电路还要满足元件关系，不能理解为无源电阻回路会自发产生循环电流。
- 数学背景：Gilbert Strang, MIT 18.06SC, *Graphs, Networks, Incidence Matrices*, <https://ocw.mit.edu/courses/18-06sc-linear-algebra-fall-2011/pages/ax-b-and-the-four-subspaces/graphs-networks-incidence-matrices/>。该课程采用的关联矩阵排列方向与本讲义互为转置。

## 图5.0d：状态记录的时间序列

原创TikZ，仅画时刻k、k+1、k+2的状态记录，不给真实设备参数，不声称复现故障动态。

- 关联矩阵A描述连接，状态转移矩阵F描述更新，二者不能混用。
- x_(k+1)=F x_k仅作为固定线性、无外部输入的教学模型预告，不代表电网全动态方程。
- 储能背景：U.S. Department of Energy, Electricity Advisory Committee, *National Distributed Energy Storage in the Electric Grid*, 2016，第2部分；<https://www.energy.gov/oe/articles/eac-recommendations-national-distributed-energy-storage-electric-grid>。

## 史实范围

事故规模以联合调查终报为准（约5000万人、61800 MW）；调查原因概括参考加拿大自然资源部2004年4月5日的终报发布说明：<https://www.canada.ca/en/news/archive/2004/04/canada-task-force-presents-final-report-blackout-august-2003.html>。

没有采用NASA Earth Observatory的2003年停电前后夜光图，因为原发布页2018年补充说明其拍摄日期无法重新确认。

核对日期：2026-09-30。
