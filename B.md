#Problem B: Merge After Toll
2017 MCM
<br>
Multi-lane divided limited-access toll highways use “ramp tolls” and “barrier tolls” to collect tolls from motorists. A ramp toll is a collection mechanism at an entrance or exit ramp to the highway and these do not concern us here. A barrier toll is a row of tollbooths placed across the highway, perpendicular to the direction of traffic flow. There are usually (always) more tollbooths than there are incoming lanes of traffic (see former 2005 MCM Problem B). So when exiting the tollbooths in a barrier toll, vehicles must “fan in” from the larger number of tollbooth egress lanes to the smaller number of regular travel lanes. A toll plaza is the area of the highway needed to facilitate the barrier toll, consisting of the fan-out area before the barrier toll, the toll barrier itself, and the fan-in area after the toll barrier. For example, a three-lane highway (one direction) may use 8 tollbooths in a barrier toll. After paying toll, the vehicles continue on their journey on a highway having the same number of lanes as had entered the toll plaza (three, in this example).
<br>
Consider a toll highway having L lanes of travel in each direction and a barrier toll containing B tollbooths (B > L) in each direction. Determine the shape, size, and merging pattern of the area following the toll barrier in which vehicles fan in from B tollbooth egress lanes down to L lanes of traffic. Important considerations to incorporate in your model include accident prevention, throughput (number of vehicles per hour passing the point where the end of the plaza joins the L outgoing traffic lanes), and cost (land and road construction are expensive). In particular, this problem does not ask for merely a performance analysis of any particular toll plaza design that may already be implemented. The point is to determine if there are better solutions (shape, size, and merging pattern) than any in common use.
<br>
Determine the performance of your solution in light and heavy traffic. How does your solution change as more autonomous (self-driving) vehicles are added to the traffic mix? How is your solution affected by the proportions of conventional (human-staffed) tollbooths, exact-change (automated) tollbooths, and electronic toll collection booths (such as electronic toll collection via a transponder in the vehicle)?

<br>  
# Link  2005 MCM Problem B
<br>
### PROBLEM B: Tollbooths
<br>
Heavily-traveled toll roads such as the Garden State Parkway , Interstate 95, and so forth, are multi-lane divided highways that are interrupted at intervals by toll plazas. Because collecting tolls is usually unpopular, it is desirable to minimize motorist annoyance by limiting the amount of traffic disruption caused by the toll plazas. Commonly, a much larger number of tollbooths is provided than the number of travel lanes entering the toll plaza. Upon entering the toll plaza, the flow of vehicles fans out to the larger number of tollbooths, and when leaving the toll plaza, the flow of vehicles is required to squeeze back down to a number of travel lanes equal to the number of travel lanes before the toll plaza. Consequently, when traffic is heavy, congestion increases upon departure from the toll plaza. When traffic is very heavy, congestion also builds at the entry to the toll plaza because of the time required for each vehicle to pay the toll.

 
Make a model to help you determine the optimal number of tollbooths to deploy in a barrier-toll plaza. Explicitly consider the scenario where there is exactly one tollbooth per incoming travel lane.  Under what conditions is this more or less effective than the current practice? Note that the definition of  "optimal" is up to you to determine.

## 问题B：收费后合并
<br>
收取过路费（多车道划分限制访问的收费公路）使用“坡道收费”和“障碍收费”来收取驾驶员的收费。斜坡收费是在高速公路的入口或出口匝道处的收费，并且这些不关心我们在这里。障碍收费是一排跨过高速公路的收费站，垂直于交通流的方向。通常会有（总是）比交通车道更多的收费站（见前2005年MCM-B）。因此，当驶出收费站时，车辆必须从较大数量的收费站出口车道“散开进入”到较少数量的常规行驶车道。收费广场是高速公路需要用于便于障碍收费的区域，包括在障碍收费之前的未散开插口区域，收费路径本身以及收费路径之后的分离子路段区域。例如，三车道高速公路（一个方向）可以在障碍通行费中使用8个收费站。在支付了费用之后，车辆在具有与进入收费广场相同数量的车道（在该示例中为三个）的高速公路上继续行驶。

<br>
考虑在每个方向上具有L个行驶车道的收费高速公路和在每个方向上包含B个收费站（B> L）的障碍通行费。确定跟随收费障碍的区域的形状，尺寸和合并模式，其中车辆从B过街出口车道下行到L个车道。在您的模型中纳入的重要注意事项包括事故预防，吞吐量（每小时通过广场末端加入L外出车道的车辆数量）和成本（土地和道路建设昂贵）。特别地，该问题不仅仅要求可能已经实现的任何特定收费广场设计的性能分析。重点是确定是否有比任何常用的更好的解决方案（形状，大小和合并模式）。
<br>
确定您的解决方案在轻和重的流量的性能。随着更多自主（自驾）车辆添加到交通组合中，您的解决方案如何改变？您的解决方案如何影响常规（人员配备）收费站，精确更换（自动）收费站和电子收费站（例如通过车辆中的应答器收集电子费用）的比例？


