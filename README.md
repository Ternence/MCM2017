# MCM2017

##Problem B: Merge After Toll
2017 MCM : [Linked from github.com](https://github.com/Ternence/MCM2017/blob/master/MCM-2017-B.md)
[微博：分享技术，分享生活，欢迎交流](http://weibo.com/zhangtengyuan23)
[Github：Baidu.Inc Mobile Security](https://github.com/Ternence)
[CSDN ：技术分享](http://blog.csdn.net/zhangtengyuan23)
<br>
Multi-lane divided limited-access toll highways use “ramp tolls” and “barrier tolls” to collect tolls from motorists. A ramp toll is a collection mechanism at an entrance or exit ramp to the highway and these do not concern us here. A barrier toll is a row of tollbooths placed across the highway, perpendicular to the direction of traffic flow. There are usually (always) more tollbooths than there are incoming lanes of traffic (see former 2005 MCM Problem B). So when exiting the tollbooths in a barrier toll, vehicles must “fan in” from the larger number of tollbooth egress lanes to the smaller number of regular travel lanes. A toll plaza is the area of the highway needed to facilitate the barrier toll, consisting of the fan-out area before the barrier toll, the toll barrier itself, and the fan-in area after the toll barrier. For example, a three-lane highway (one direction) may use 8 tollbooths in a barrier toll. After paying toll, the vehicles continue on their journey on a highway having the same number of lanes as had entered the toll plaza (three, in this example).
<br>
Consider a toll highway having L lanes of travel in each direction and a barrier toll containing B tollbooths (B > L) in each direction. Determine the shape, size, and merging pattern of the area following the toll barrier in which vehicles fan in from B tollbooth egress lanes down to L lanes of traffic. Important considerations to incorporate in your model include accident prevention, throughput (number of vehicles per hour passing the point where the end of the plaza joins the L outgoing traffic lanes), and cost (land and road construction are expensive). In particular, this problem does not ask for merely a performance analysis of any particular toll plaza design that may already be implemented. The point is to determine if there are better solutions (shape, size, and merging pattern) than any in common use.
<br>
Determine the performance of your solution in light and heavy traffic. How does your solution change as more autonomous (self-driving) vehicles are added to the traffic mix? How is your solution affected by the proportions of conventional (human-staffed) tollbooths, exact-change (automated) tollbooths, and electronic toll collection booths (such as electronic toll collection via a transponder in the vehicle)?

<br>  
#### Link  2005 MCM Problem B  （Not Problem-B 2017）

#### PROBLEM B: Tollbooths
<br>
Heavily-traveled toll roads such as the Garden State Parkway , Interstate 95, and so forth, are multi-lane divided highways that are interrupted at intervals by toll plazas. Because collecting tolls is usually unpopular, it is desirable to minimize motorist annoyance by limiting the amount of traffic disruption caused by the toll plazas. Commonly, a much larger number of tollbooths is provided than the number of travel lanes entering the toll plaza. Upon entering the toll plaza, the flow of vehicles fans out to the larger number of tollbooths, and when leaving the toll plaza, the flow of vehicles is required to squeeze back down to a number of travel lanes equal to the number of travel lanes before the toll plaza. Consequently, when traffic is heavy, congestion increases upon departure from the toll plaza. When traffic is very heavy, congestion also builds at the entry to the toll plaza because of the time required for each vehicle to pay the toll.

 
Make a model to help you determine the optimal number of tollbooths to deploy in a barrier-toll plaza. Explicitly consider the scenario where there is exactly one tollbooth per incoming travel lane.  Under what conditions is this more or less effective than the current practice? Note that the definition of  "optimal" is up to you to determine.

#### 问题B：收费后合并
收取过路费（多车道划分限制访问的收费公路）使用“坡道收费”和“障碍收费”来收取驾驶员费用。斜坡收费是在高速公路的入口或出口匝道处的收费，并且这些不关心我们在这里。障碍收费是一排跨过高速公路的收费站，垂直于交通流的方向。通常会有（总是）比交通车道更多的收费站（见前2005年MCM-B）。因此，当驶出收费站时，车辆必须从较大数量的收费站出口车道“散开进入”到较少数量的常规行驶车道。收费广场是高速公路需要用于便于障碍收费的区域，包括在障碍收费之前的未散开插口区域，收费路径本身以及收费路径之后的分离子路段区域。例如，三车道高速公路（一个方向）可以在障碍通行费中使用8个收费站。在支付了费用之后，车辆在具有与进入收费广场相同数量的车道（在该示例中为三个）的高速公路上继续行驶。

<br>
考虑在每个方向上具有L个行驶车道的收费高速公路和在每个方向上包含B个收费站（B> L）的障碍通行费。确定跟随收费障碍的区域的形状，尺寸和合并模式，其中车辆从B过街出口车道下行到L个车道。在您的模型中纳入的重要注意事项包括事故预防，吞吐量（每小时通过广场末端加入L外出车道的车辆数量）和成本（土地和道路建设昂贵）。特别地，该问题不仅仅要求可能已经实现的任何特定收费广场设计的性能分析。重点是确定是否有比任何常用的更好的解决方案（形状，大小和合并模式）。
<br>
确定您的解决方案在轻和重的流量的性能。随着更多无人驾驶（辅助驾驶）车辆添加到交通组合中，您的解决方案如何改变？您的解决方案如何影响常规（人员配备）收费站，精确更换（自动）收费站和电子收费站（例如通过车辆中的应答器收集电子费用）的比例？

<br>
###个人思路 仅供参考：
<br>
对于此题，首先需要从侧面了解美国高速公路具体收费模式，不能完全使用中国收费站模式套用。
<br>对于纵横交错，非常发达的美国高速公路网来说，收费的便捷性与效率应显得尤为重要，而且，据我所知，90%的美国高速公路不收费。因为美国人交的税里h和汽油费里就有一部分是专门用于高速公路的新建与维护。

####**目的**

 - 确定跟随收费障碍的区域的形状，尺寸和合并模式（事故预防，吞吐量和成本）
 - 构建更好的形状，大小和合并模式模型
 - 无人车或者辅助驾驶（谷歌无人车L4，特斯拉L3）对模型的影响
 - 构建的模型对『常规（人员配备）收费站，精确更换（自动）收费站和电子收费站（例如ETC）的比例？』带来怎样的影响？

####**思路1**
 1. 考虑车流量情况[metrocosm.com-data] (http://metrocosm.com/get-the-data/#interstatetraffic) 构建机器学习模型，通过数据的训练，学习到最优的 features' weight.  （其实，题目中已告诉我们features）
 2. Time-Cost: 根据模型车流量的输入，最优化（损失时间Time-Cost，包括车辆通过后回合的时间cost），得出整体最优的形状，尺寸和合并模式模型参数。
 3. Price-Cost : 同时，模型还有一个Price-Cost，成本，同时达到成本的低于某一阈值或收敛值
 4. 对于合并模式 feature，过多的并道会增加 Cost-time，过少甚至一条收费通道，在车流量过大的情况下，导致通过车速过慢，也会增加Cost-time.  对于 combine-feature ，可以根据模型训练量化出 feature 的 weight. 
![模型](http://img.blog.csdn.net/20170121015358290?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvemhhbmd0ZW5neXVhbjIz/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)

####**思路2**

 1. 进一步看问题，可以转化为网络流量问题
 2. 参看Frank-Wolfe算法，通过目标函数近似线性化，迭代，可行下降方向进行一维搜索。求解最优点。

####**思路3**

 1. 排队论，或者有人叫做"服务系统设计"，整体思路和#1类似
 2. 粗略介绍下：一个排队系统的好坏要以顾客与服务机构两方面的利益为标准。就顾客来说总希望等待时间或逗留时间越短越好，从而希望服务台个数尽可能多些但是，就服务机构来说，增加服务台数，就意味着增加投资，增加多了会造成浪费，增加少了要引起顾客的抱怨甚至失去顾客。
 3. 根据到达间隔时间与服务时间的分布，泊松分布;负指数分布;爱尔兰分布; 计算最优服务台数量！ 参考下图
![这里写图片描述](http://img.blog.csdn.net/20170121020723203?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvemhhbmd0ZW5neXVhbjIz/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)

####**思路4**
交通流的特点在于动态、随机、反馈、自适应、多变为主导，以非线性复杂性。可以使用元胞自动机模拟交通流.
![](http://img.blog.csdn.net/20170121122334318?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvemhhbmd0ZW5neXVhbjIz/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)

<br>
####**模型对人员配备，自动收费站和电子收费站（例如ETC）的影响**
1、分散式
该方式通常在互通立交的各个匝道设置收费系统，或者多个匝道设置一套收费系统。分散式的优势在于避开了车流的交叉通行，缩短车辆运行时间，同时缓解了收费站附近的交通阻塞，提高了收费站设计和选址的可行性；缺陷在于收费系统设施和人员不集中，建设费用较高，收费可控性较差，因此分散式在实际中较少使用。
2、集中式
集中式收费系统把每个立交的匝道进出口设置在同一位置，然后在该处设置双向收费系统，连接了收费路段和普通道路。与分散式相比，该方式的优势在于对收费系统的
设备和人员进行集中控制和管理，提高了系统工作效率；缺陷依然明显，由于匝道出入口必须设置在同一位置，对立交的规划设计产生了干扰，而且出入口车流集中，道路车流量较大时，极易产生交通拥堵，影响了道路的通行能力。

####**收费效率**：
(1)**人工收费**
人工收费是比较传统的收费方式，收费的整个流程全部由收费人员人工完成。收费人员在收费站内对缴费车辆的不同类型进行收费，手续完成即可抬杆放行。人工收费最显著的特点是收费系统的建设投资较少，收费流程简便易行，缺点是可能会出现逃费和漏费现象，另外系统的工作效率也大打折扣。
(2)**半自动收费**
半自动收费是在传统人工收费的基础上引进计算机辅助设施，二者一同完成车辆缴费流程。通常收费人员负责收费工作，计算机用于车辆识别、费用结算、收据的输出打印等工作。由于有了计算机的介入，收费系统可以对各个收费通道进行集中控制，也能对相关路段进行联网计费。因此，半自动收费可以在一定程度上消除车辆逃费漏费现象的发生，也可以对收费车辆进行信息反馈，缺点是收费人员的存在也会导致系统的收费
效率下降。
(3)**自动收费**
自动收费方式也就是ETC电子不停车收费系统，该系统采用了计算机和网络通信技术，车辆的整个缴费过程不需要减速停车即可完成，因为ETC系统能够自动实现车辆的识别、费用汇总结算和监控过程，这种方式特别适合封闭式和开放式收费系统使用。




####**关于自动驾驶**
_How does your solution change as more autonomous (self-driving) _
关于自动驾驶，我还是蛮感兴趣的，我厂L4,L3部门正好是做Auto-Car 上半年我也了解了些技术点。
#####**简单介绍自动驾驶**
我指 L4, 可以做到感知周边的环境（道路线，车辆，并线，行人等等） 通过已有的训练模型得出最准确的行使方案决策，通过最优化算法，计算并线，转弯等行车最佳方案，控制系统执行。

**_added to the traffic mix?_**
出题人还是想知道关于自动驾驶和人驾驶 mix 的情况，在我看来，需要分析 mix 后的影响 features 是哪些，能影响的范围程度需要分析.
**我认为：**
1、影响直线行驶的效率通行效率，准确的说是提升通行效率，根据研究自动驾驶在流比较密的时候，会保留一定的车距，减少突然刹车次数。比正常人驾驶习惯更好（关于）。如图
![堵塞现象](http://img.blog.csdn.net/20170121022408633?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvemhhbmd0ZW5neXVhbjIz/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)
关于这一点，注意，参赛同学需要多找新文献，引用【】 说明下。
2、还有，应该考虑带来的安全性 feature 的变化，根据现有的研究，自动驾驶能够提升整体的驾驶安全性（主要根据，驾驶员驾驶员生理及心理品质，闪光融合临界值测定，检测驾驶员注意程度及疲劳等主要指标）

####**模型评价**
Determine the performance of your solution in light and heavy traffic.  机器学习的好办了，收敛速度，re-call 召回率，准确率等。


#### **Accident 预防**
Important considerations to incorporate in your model include accident prevention
需在模型中考虑这个 feature，邻近开放应急收费通道，邻近路段交通流疏导、车速控制等方式可以考虑。

<br>

###**参考示意图**
 
![ 通过模型-TimeLost](http://img.blog.:.net/20170121012524116?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvemhhbmd0ZW5neXVhbjIz/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)


###barrier tolls

![barrier tolls](http://img.blog.csdn.net/20170121000007109?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvemhhbmd0ZW5neXVhbjIz/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)

<br>
###ramp tolls

![ramp tolls](http://img.blog.csdn.net/20170121000154127?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvemhhbmd0ZW5neXVhbjIz/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)
<br>


####相关论文

[A Research on the Intra-Regional Accessibility and Eco-
nomic Development in the Cardi  City Region](https://share.weiyun.com/580f30a71647c313dd5b13a0e609754d)
[Toll Plaza Merging Traffic Control for Throughput Maximization](https://share.weiyun.com/13d4df99164bb4cecae13b8b3fd95cb4)
[基于节能减排的高速公路瓶颈处拥挤车流控制技术研究.pdf](https://share.weiyun.com/6b15a718e81d2a08a546719233846748)
[区域交通导向发展_TOD_模式研究_陈磊磊.pdf](https://share.weiyun.com/0f8f505d31a84dc44875a98f7cbf03ee)
[数据：新泽西每日汽车流量.pdf](https://share.weiyun.com/afd0e81bb76cf3cb56732b5bc316949d)



高速公路收费站模型优化设计的研究
排队论在公路收费站服务台设计及管理中的应用  基于排队论的高速公路服务区停车位合理规模的计算_王殊
排队论在高速公路收费系统中的应用 
基于MultiGen的高速公路交通流仿真技术研究
基于缓堵的主线收费站设计关键参数研究
基于元胞自动机的高等级公路复式收费站能耗仿真与应用
基于M_G_K排队模型的北京地区高速公路收费站通行能力研究
北京地区高速公路收费站通行能力研究


<br>参考如下基础信息
```
在19世纪中后期，西部的许多州，比如加利福尼亚、内华达等，修建了许多私人的收费道路。进入二十世纪后，由于汽车的普及以及州际、州内高速公路的兴起，绝大部分收费道路均由州政府接手管理，在州的范围内，收费有了统一的标准。 

根据运输部高速公路政策资讯办公室（Office of Highway Policy Information）的统计，如果将公路、桥梁、隧道、摆渡收费点全部统计在内的话，截至2011年1月1日，全国38个州有收费站，12个州没有任何收费站。全国的收费里程为8633公里。 

根据联邦高速公路管理署的不完全统计，美国现有州际高速公路近7.6万公里，州内、郡县高速公路19.5万公里。以此来看，在27.1万公里的高速公路上，8633公里的路段需要收费，所占比例为3.18%，可见还是比较少的。难怪许多到美国旅游的外国人，特别到是西部、中部、南部旅游的人，会错以为美国的高速公路是完全免费的。 

我们住在首都华盛顿附近的人，都知道最近环城495高速公路弗吉尼亚境内段又新增了一个快速道路，双向四车道，便于通勤的人上下班使用。不过，使用这个快车道是需要付费的（车上如果有三个人的话则免费），费率是动态的，根据在这个快车道上行驶车辆的多少随时调整：车辆多，费用就往上调整；车辆少，费用就下降。这个浮动收费方式与绝大部分采用固定费率的高速公路不同，是个新生事物，尚未得到大多数驾驶者的认可，目前使用该快速道路的车辆还比较少。 

为了鼓励更多的人使用这条耗资14亿美元、花了四年多的功夫才建成的快车道，上个周末道路管理部门免费让民众使用，希望吸引更多的人。这个快车道的特点是不但没有人工收费站，连收费点也没有，全部使用高空电子收费器，从经过的汽车电子付费卡上自动收取费用，这样就避免了汽车接近收费点时车速减慢或大排长龙的不便。
```

![收费站](http://img.blog.csdn.net/20170121002322000?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvemhhbmd0ZW5neXVhbjIz/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)

<br>

```
美国高速交费方式

美国高速公路，收费有两种方式：一种是电子收费卡（E-PASS），经过收费站时自动感应，费用直接从卡上扣除；一种是现金支付，有投币式或专人收费。
```
<br>
[Barrier toll system](https://en.wikipedia.org/wiki/Barrier_toll_system)
<br>
[Ramp toll](https://en.wikipedia.org/wiki/Ramp_meter)



<br>
<br>
<br>
<br>
