

= Network Layer
The Network Layer is the third layer of the OSI model. Its main job is to deliver packets from the source network to the destination network.

== Functions of Network Layer
- *Logical Addressing:* Provides IP addresses to devices.
- *Routing:* Finds a suitable path from source to destination.
- *Packet Forwarding:* Forwards packets to the next router.
- *Internetworking:* Connects different networks together.
- *Fragmentation and Reassembly:* Divides large packets when necessary and reassembles them at the destination.
- *Congestion Control:* Helps manage excessive traffic in the network.
- *Error Reporting:* ICMP provides error and diagnostic information.

== Routing
Routing is the process of finding a path for packets from a source network to a destination network. A router examines the destination IP address and selects the best next hop.

Example:
$"PC_A" -> "Router_1" -> "Router_2" -> "PC_B"$

Here, routers determine the path between $"PC_A"$ and $"PC_B"$.

== Routing Protocol
A routing protocol is a set of rules used by routers to exchange routing information and select paths.
Examples:
- RIP
- OSPF
- EIGRP
- BGP
- IGRP

=== Routed vs Routing Protocol
#table(
  columns: (1.8fr, 2.7fr, 2.7fr),
  stroke: 0.5pt,
  [*Point*], [*Routed Protocol*], [*Routing Protocol*],
  [Purpose], [Carries user data], [Finds routes],
  [Example], [IP], [RIP, OSPF, BGP],
  [Main function], [Provides packet delivery], [Exchanges routing information],
)

== Characteristics of a Good Routing Algorithm
A good routing algorithm should have:
- *Correctness:* It should find a correct path.
- *Simplicity:* It should be easy to implement and manage.
- *Robustness:* It should continue working when network conditions change.
- *Stability:* Routing decisions should not change unnecessarily.
- *Fairness:* Network resources should be shared fairly.
- *Optimality:* It should select an efficient path.
- *Efficiency:* It should use reasonable processing and bandwidth.
- *Fast convergence:* Routers should quickly update their routing information after a change.

== Static and Dynamic Routing

=== Static Routing
In static routing, routes are manually configured by the network administrator.

*Advantages:*
- Simple for small networks.
- No routing-update traffic.
- More predictable.

*Disadvantages:*
- Difficult to maintain in large networks.
- Does not automatically react to failures.
- Administrator must manually change routes.

=== Dynamic Routing
In dynamic routing, routers automatically exchange information and update their routing tables.
Examples: RIP, OSPF, EIGRP, BGP

*Advantages:*
- Automatically adapts to network changes.
- Suitable for large networks.
- Reduces manual configuration.

== Adaptive and Non-Adaptive Routing

=== Adaptive Routing
In adaptive routing, routing decisions change according to current network conditions. It can consider:
- Traffic
- Link failure
- Delay
- Network topology
- Available paths

Examples: RIP, OSPF, EIGRP

=== Non-Adaptive Routing
In non-adaptive routing, routes are fixed and do not change according to current network conditions. Static routing is an example.

#table(
  columns: (1.8fr, 2.7fr, 2.7fr),
  stroke: 0.5pt,
  [*Point*], [*Adaptive*], [*Non-Adaptive*],
  [Route], [Changes dynamically], [Usually fixed],
  [Network information], [Uses current information], [Does not normally use changing information],
  [Failure handling], [Can adapt], [Requires manual change],
  [Example], [OSPF, RIP], [Static routing],
)

== Distance Vector Routing
Distance Vector is a routing algorithm in which each router maintains information about the distance and direction to destinations. Each router periodically shares its routing information with neighboring routers.

The basic idea is:
$"Router" -> "Neighbor" -> "Destination"$

=== Working of Distance Vector
+ Each router creates an initial routing table.
+ The router knows the cost to its directly connected neighbors.
+ It sends its routing table to neighboring routers.
+ A neighbor receives the information and compares available routes.
+ If a better route is found, the routing table is updated.
+ This information is repeatedly exchanged until the network reaches a stable state.

=== Bellman-Ford Idea
The new distance can be calculated as:
$D_x(y) = min_v { c(x,v) + D_v(y) }$

where:
- $D_x(y)$ = distance from router $x$ to destination $y$.
- $c(x,v)$ = cost from $x$ to neighbor $v$.
- $D_v(y)$ = neighbor's distance to destination $y$.

=== Advantages
- Simple and easy to implement.
- Requires less information about the complete network.

=== Disadvantages
- Slow convergence.
- Routing loops can occur (Count-to-infinity problem).
- Routers do not know the complete network topology.

== Link State Routing
In Link State Routing (LSR), every router builds a map of the network topology. Each router learns:
- Its neighbors.
- Cost of links.
- Network topology.

The router then calculates the shortest path to every destination. OSPF is a major example of link-state routing.

=== Working of Link State Routing
+ Discover neighboring routers.
+ Measure the cost of each link.
+ Create a link-state packet.
+ Flood the link-state information to other routers.
+ Every router builds the same network topology database.
+ Each router runs the shortest path algorithm.
+ The routing table is created from the calculated shortest paths.

== Shortest Path Algorithm in Link State Routing
Link-state routing commonly uses Dijkstra's shortest path algorithm.

Suppose:
$A --1-- B --2-- C$ \
and: \
$A --4-- C$

Possible paths from $A$ to $C$ are:
- $A -> C = 4$
- $A -> B -> C = 1 + 2 = 3$

Therefore, the shortest path is $A -> B -> C$ with cost $3$.

=== Basic Dijkstra Steps
+ Select the source router.
+ Set source distance to $0$.
+ Set all other distances to infinity.
+ Select the unvisited node with the smallest distance.
+ Calculate distances to its neighboring nodes.
+ Update the distances if a shorter path is found.
+ Mark the selected node as visited.
+ Repeat until all required nodes are visited.
+ Use the resulting shortest paths to create the routing table.

== Distance Vector vs Link State
#table(
  columns: (1.7fr, 2.7fr, 2.7fr),
  stroke: 0.5pt,
  [*Point*], [*Distance Vector*], [*Link State*],
  [Information], [Distance and direction], [Complete topology information],
  [Knowledge], [Mostly neighbor information], [Network topology],
  [Algorithm], [Bellman-Ford], [Dijkstra],
  [Updates], [Periodic/triggered updates], [Link-state advertisements],
  [Convergence], [Slower], [Faster],
  [Loop possibility], [Higher], [Lower],
  [Example], [RIP], [OSPF],
  [Complexity], [Simpler], [More complex],
)

== Routing Information Protocol (RIP)
RIP is a distance-vector routing protocol. It uses hop count as its routing metric. The maximum usable hop count is 15. A hop count of 16 means the destination is unreachable.

=== RIP Working
+ A router creates a routing table.
+ It sends its routing table to neighboring routers.
+ The neighbor adds the cost of reaching the sending router.
+ It compares the new route with its existing route.
+ If the new route is better, the routing table is updated.
+ Routers continue exchanging information until the routes converge.

Example:
$R_1 -> R_2 -> R_3$ (The route from $R_1$ to $R_3$ has $2\ "hops"$)

=== RIP Timers
- *Update Timer:* About 30 seconds. Routers normally send routing updates periodically.
- *Invalid Timer:* About 180 seconds. A route is considered invalid if no update is received.
- *Holddown Timer:* About 180 seconds. Prevents unstable route changes for a period.
- *Flush Timer:* About 240 seconds. An invalid route is removed from the routing table.

=== RIP Advantages & Disadvantages
*Advantages:* Simple, easy to configure, suitable for small networks.
*Disadvantages:* Maximum 15 hops, slow convergence, count-to-infinity problem, not suitable for large networks.

== Routing Loops in Distance Vector
Routing loops occur when routers incorrectly believe that a destination can be reached through each other, causing the metric to continuously increase.

=== Methods to Prevent Routing Loops
- *Split Horizon:* A router does not advertise a route back through the interface from which it learned that route.
- *Route Poisoning:* A failed route is advertised with an infinite metric.
- *Poison Reverse:* The route is advertised back to the original router with an infinite metric.
- *Hold-Down Timer:* Prevents immediate acceptance of unstable route information.
- *Triggered Update:* Sends an update immediately after a route change instead of waiting.

== OSPF
OSPF stands for Open Shortest Path First. It is a link-state routing protocol used inside an autonomous system. It uses cost as its routing metric and uses Dijkstra's shortest path algorithm.

=== OSPF Working Process
+ OSPF routers discover their neighbors.
+ Routers establish neighbor relationships.
+ They exchange link-state information.
+ Link-state information is flooded within the OSPF area.
+ Each router creates a link-state database.
+ Each router runs Dijkstra's algorithm.
+ The shortest paths are selected and routing table is populated.

== OSPF Neighbor States
- *Down:* No Hello packet has been received.
- *Init:* A Hello packet has been received.
- *2-Way:* Two routers have successfully seen each other.
- *ExStart:* Routers decide which one will be master.
- *Exchange:* Database information is exchanged.
- *Loading:* Missing link-state information is requested.
- *Full:* Link-state databases are synchronized (full adjacency).

== DR and BDR in OSPF
*DR* means Designated Router. *BDR* means Backup Designated Router.
Used mainly on multi-access networks to reduce unnecessary OSPF adjacency relationships.

=== DR Election
+ OSPF routers exchange Hello messages.
+ Routers compare their OSPF priority (Highest is preferred).
+ If priority is equal, the router with the highest Router ID is selected.
+ The second-highest suitable router becomes BDR.
+ If priority is 0, the router is not eligible.

== OSPF Full Adjacency
Process for routers to become fully adjacent:
+ Routers send Hello messages and discover each other.
+ They reach 2-Way state.
+ They decide the master/slave relationship.
+ Database Description packets are exchanged.
+ Missing link-state information is requested and updates are exchanged.
+ Link-state databases become synchronized (Full state).

== Autonomous System (AS)
An AS is a group of networks and routers managed by a single organization under a common routing policy.
Examples: ISP network, University network, Large company network.

- *IGP (Interior Gateway Protocol):* Used inside an AS (e.g., RIP, OSPF, EIGRP).
- *EGP (Exterior Gateway Protocol):* Used between AS (e.g., BGP).

== Common Routing Protocols
- *RIP:* Distance vector, hop count metric, max 15 hops.
- *OSPF:* Link state, cost metric, Dijkstra algorithm, supports areas.
- *EIGRP:* Advanced distance-vector/hybrid, multiple metrics, fast convergence.
- *IGRP:* Older Cisco distance-vector (largely replaced).
- *BGP:* Inter-domain routing protocol, used between AS, path-vector routing.

== Unicast and Multicast
#table(
  columns: (1.8fr, 2.7fr, 2.7fr),
  stroke: 0.5pt,
  [*Point*], [*Unicast*], [*Multicast*],
  [Communication], [One-to-one], [One-to-many group],
  [Receivers], [Single receiver], [Selected group],
  [Example], [Web request], [Live video distribution],
)

== Network Addressing
An IPv4 address is a 32-bit logical address (four decimal octets).
Example: $192.168.10.20$ (8 + 8 + 8 + 8 = 32 bits).

== Classful IPv4 Addressing
#table(
  columns: (1.3fr, 2fr, 2fr, 2fr),
  stroke: 0.5pt,
  [*Class*], [*First Octet*], [*Default Mask*], [*Use*],
  [A], [1--126], [/8], [Very large networks],
  [B], [128--191], [/16], [Medium networks],
  [C], [192--223], [/24], [Small networks],
  [D], [224--239], [Multicast], [Multicast],
  [E], [240--255], [Experimental], [Experimental],
)

Special values: `127.x.x.x` (Loopback), `0.x.x.x` (Special/reserved).

== CIDR & VLSM
*CIDR (Classless Inter-Domain Routing):* 
CIDR stands for Classless Inter-Domain Routing. It's a way of specifying IP address ranges more efficiently than the older "classful" system.

*VLSM (Variable Length Subnet Mask):* Allows different subnets to have different sizes. Used to minimize IP wastage when departments require different numbers of hosts.

== Subnetting
Subnetting divides one large network into smaller networks called subnets.
*Basic Formula:* For an IPv4 subnet with $h$ host bits:
- $"Total"\ "addresses" = 2^h$
- $"Usable"\ "hosts" = 2^h - 2$

== Network Devices
#table(
  columns: (1.5fr, 2fr, 2fr),
  stroke: 0.5pt,
  [*Device*], [*Main Layer*], [*Main Function*],
  [Repeater], [Physical], [Regenerates signals],
  [Hub], [Physical], [Broadcasts to all ports],
  [Bridge], [Data Link], [Connects LAN segments],
  [Switch], [Data Link], [Forwards using MAC address],
  [Router], [Network], [Forwards using IP address],
  [Gateway], [Application/All], [Connects different protocols],
)

== ARP & NDP
- *ARP (Address Resolution Protocol):* Used in IPv4 to find the MAC address associated with an IP address on the local network. (Broadcasts: *"Who has this IP?"*).
- *NDP (Neighbor Discovery Protocol):* Used in IPv6 (based on ICMPv6) for neighbor/router discovery and address resolution.

== ICMP (Internet Control Message Protocol)
Used by network devices to send error messages and diagnostic information.
- *Error Messages:* Destination Unreachable, Time Exceeded, Redirect.
- *Informational Messages:* Echo Request, Echo Reply (used by `ping`).

== TTL (Time To Live)
A field in the IPv4 header used to prevent packets from circulating forever in routing loops. Each router decreases TTL by one. If TTL = 0, the packet is discarded and an ICMP Time Exceeded message is sent.

== Network Congestion
Occurs when too much traffic enters the network and it cannot be processed efficiently, leading to longer queues, increased delay, and dropped packets.
