= Time and State in DIstributed Systems
== Physical Clock

A *physical clock* represents the actual time of the real world.

In a distributed system, every computer has its own physical clock. Due to differences in hardware, temperature, and clock speed, the clocks of different computers may run at slightly different rates.

For example:

* Process $P_1$: 10:00:05
* Process $P_2$: 10:00:07

Although both events occur at nearly the same time, their clocks show different times.

== Logical Clock

A *logical clock* does not represent actual time. It assigns numbers to events to determine their *ordering*.

It is mainly used to determine whether one event happened before another event.

The most common logical clock is *Lamport's logical clock*.

=== Difference Between Physical and Logical Clock

#table(
columns: (1.5fr, 2.5fr, 2.5fr),
stroke: 0.5pt,
[#strong[Point]], [#strong[Physical Clock]], [#strong[Logical Clock]],
[Meaning], [Actual real-world time], [Ordering of events],
[Purpose], [Synchronize actual time], [Determine event ordering],
[Value], [Date/time such as 10:30:15], [Logical number such as 5, 6, 7],
[Synchronization], [Requires clock synchronization], [Does not require actual-time synchronization],
[Example], [NTP, Berkeley algorithm], [Lamport clock, Vector clock],
)

=== Why is Physical Clock Synchronization Difficult?

Physical clocks are difficult to synchronize because:

+ Every computer has a separate hardware clock.
+ Clocks run at slightly different speeds.
+ Clock drift causes clocks to gradually become different.
+ Network communication introduces variable message delay.
+ A clock may gain or lose time due to hardware and environmental conditions.
+ There is no perfectly instantaneous way to update all clocks simultaneously.

Therefore, distributed systems use synchronization algorithms such as:

+ Cristian's algorithm
+ Berkeley algorithm
+ Network Time Protocol (NTP)

== Physical Clock Synchronization

=== Cristian's Algorithm

Cristian's algorithm synchronizes a client clock using a time server.

#enum(
[The client sends a request to the time server.],
[The server returns its current time.],
[The client measures the round-trip time (RTT).],
[The client estimates the current time by adding approximately half of the RTT to the server's returned time.],
[The client adjusts its clock accordingly.]
)

Approximate formula:

$ T_"client" = T_"server" + "RTT" / 2 $

==== Limitation

The main problem is that the *single time server can fail*, causing the synchronization service to become unavailable.

=== Berkeley Algorithm

Berkeley algorithm uses a coordinator to synchronize the clocks of multiple machines.

#enum(
[A coordinator asks all participating computers for their clock times.],
[Each computer sends its current clock time to the coordinator.],
[The coordinator calculates an average time.],
[The coordinator calculates how much each clock should be adjusted.],
[The coordinator sends the adjustment value to each computer.],
[All computers adjust their clocks.]
)

==== How Berkeley handles server failure

Unlike Cristian's algorithm, Berkeley does not depend on a permanent external time server.

The *coordinator* collects clock values and computes an average. If one clock or computer fails, it can be excluded from the calculation.

However, if the coordinator itself fails, another coordinator can be selected.+
== Network Time Protocol (NTP)

*NTP* is a protocol used to synchronize computer clocks over a network.

It uses a hierarchy of time servers called *strata*.

Main points:

+ Synchronizes physical clocks over a network.
+ Uses multiple time servers.
+ Reduces the effect of network delay.
+ Uses hierarchical time sources.
+ Provides accurate time synchronization for distributed systems.

== Logical Clock

A logical clock assigns a number to every event in a distributed system.

It does not tell the exact physical time.

Its main purpose is to establish a *happened-before relationship* between events.

The happened-before relation is represented by:

$ a -> b $

which means event $a$ happened before event $b$.

=== Basic Principles of Lamport's Clock

The basic principles are:

+ Every process maintains its own logical clock.
+ The clock is increased before every event.
+ If a process sends a message, its timestamp is attached to the message.
+ When a process receives a message, it updates its clock so that the received event occurs after the sending event.

The main property is:

$ a -> b => C(a) < C(b) $

That means if event $a$ causally happened before event $b$, then the timestamp of $a$ is smaller than the timestamp of $b$.

=== Implementation Rules of Lamport Clock

Suppose process $P_i$ maintains logical clock $C_i$.

+ Rule 1: Local Event

Before executing a local event:

$ C_i = C_i + 1 $

+ Rule 2: Sending a Message

Before sending a message:

$ C_i = C_i + 1 $

The message contains the timestamp:

$ m."timestamp" = C_i $

+ Rule 3: Receiving a Message

If process $P_i$ receives a message with timestamp $T_m$:

$ C_i = max(C_i, T_m) + 1 $

These three rules are the main implementation rules of Lamport's logical clock.

=== Lamport Clock Example

Consider two processes $P_1$ and $P_2$.

#table(
columns: (1fr, 1fr, 2fr),
stroke: 0.5pt,
[#strong[Process]], [#strong[Event]], [#strong[Clock]],

[$P_1$], [Local event $a$], [$C_1 = 1$],
[$P_1$], [Send message $m$], [$C_1 = 2$],
[$P_2$], [Receive $m$], [$C_2 = max(0,2)+1 = 3$],
[$P_2$], [Local event $b$], [$C_2 = 4$],
)

Therefore:

$ a -> m -> b $

and:

$ C(a) < C(m) < C(b) $

=== Advantages of Lamport's Logical Clock

+ Simple and easy to implement.
+ Does not require synchronized physical clocks.
+ Provides a total ordering of events.
+ Useful for distributed mutual exclusion.
+ Helps determine causal ordering of events.
+ Requires only a single integer counter at each process.

=== Limitations / Problems of Lamport's Clock

The major limitation is:

*Lamport timestamps cannot determine whether two events are causally related or concurrent.*

Lamport clock guarantees:

$ a -> b => C(a) < C(b) $

But the reverse is not always true:

$ C(a) < C(b) !=> a -> b $

In other words, a smaller timestamp does not necessarily mean that the first event caused the second event.

=== Example of the Problem

Suppose there are two independent processes.

#table(
columns: (1.5fr, 1.5fr, 2fr),
stroke: 0.5pt,
[Process], [Event], [Timestamp],
[$P_1$], [Event $a$], [1],
[$P_2$], [Event $b$], [2],
)

There is no message between $P_1$ and $P_2$.

Therefore, $a$ and $b$ are *concurrent*:

$ a || b $

But Lamport clock only shows:

$ C(a) < C(b) $

So it cannot tell whether $a$ caused $b$ or they are independent.

=== Proposed Approach to Avoid Lamport Clock Issues

The limitation of Lamport's clock can be reduced by using a *Vector Clock*.

A vector clock maintains a vector of counters instead of one counter.

For $n$ processes:

$ V_i = [v_1, v_2, ..., v_n] $

Each process maintains a vector containing information about all processes.

Vector clocks can determine:

+ Causal relationship
+ Concurrent events
+ Happened-before relationship

Therefore, vector clocks provide more information than Lamport clocks.

== Vector Clock

A *vector clock* is a logical clock mechanism that represents the causal relationship among events in a distributed system.

For $n$ processes, every process maintains an $n$-element vector.

For three processes:

$ V_i = [V_i[1], V_i[2], V_i[3]] $

Each element represents the knowledge of events at a particular process.

=== Importance of Vector Clock

Vector clocks are important because:

+ They identify causal relationships.
+ They can identify concurrent events.
+ They provide more information than Lamport timestamps.
+ They are useful for detecting causality violations.
+ They are used in distributed databases, replicated systems, and distributed debugging.
+ They help maintain consistency among distributed processes.

=== Implementation Rules of Vector Clock

Suppose there are $n$ processes:

$ P_1, P_2, ..., P_n $

Each process $P_i$ maintains:

$ V_i[1...n] $

Initially:

$ V_i[j] = 0 $

for all $i,j$.

+ Rule 1: Initialization
  Initially, every vector contains zero:

  $ V_1 = [0,0,0] $

  $ V_2 = [0,0,0] $

  $ V_3 = [0,0,0] $

+ Rule 2: Local Event
  When a process performs a local event, it increments its own component.

  For $P_i$:

  $ V_i[i] = V_i[i] + 1 $

  Example:

  $ P_1: [0,0,0] -> [1,0,0] $

+ Rule 3: Sending a Message:\
  Before sending a message, the sender increments its own component.

  The vector is attached to the message.

  Example:

  $ P_1: [1,0,0] -> [2,0,0] $

  Message contains:

  $ m = [2,0,0] $

+ Rule 4: Receiving a Message

  When process $P_j$ receives a message with vector $V_m$, it performs component-wise maximum:

  $ V_j[k] = max(V_j[k], V_m[k]) $

  for every component $k$.

  Then it increments its own component:

  $ V_j[j] = V_j[j] + 1 $

  Therefore:

  $ V_j = max(V_j,V_m) $

  followed by incrementing its own component.


=== Causality Using Vector Clock

Vector timestamps can be used to determine causal ordering.

For two vector timestamps $V_a$ and $V_b$:

$ V_a < V_b $

if:

* $V_a[k] <= V_b[k]$ for every $k$, and
* $V_a[k] < V_b[k]$ for at least one $k$.

Then:

$ a -> b $

Therefore, event $a$ happened before event $b$.

=== Concurrent Events

If neither:

$ V_a < V_b $

nor:

$ V_b < V_a $

then the events are concurrent.

We write:

$ a || b $

=== Example

Suppose:

$ V_a = [2,1,0] $

$ V_b = [2,0,1] $

Here:

* $V_a[2] > V_b[2]$
* $V_a[3] < V_b[3]$

Therefore neither vector is smaller than the other.

Hence:

$ a || b $

The events are concurrent.

== Lamport Clock vs Vector Clock

#table(
columns: (1.6fr, 2.5fr, 2.5fr),
stroke: 0.5pt,

[#strong[Feature]], [#strong[Lamport Clock]], [#strong[Vector Clock]],

[Structure],
[Single integer],
[Vector of integers],

[Causality],
[Can represent causal ordering],
[Can determine causal ordering more accurately],

[Concurrent events],
[Cannot reliably detect them],
[Can detect them],

[Storage],
[Low],
[Higher],

[Complexity],
[Simple],
[More complex],

[Example],
[5],
[[2,1,3]],
)

== Cuts in Distributed Computation

A *cut* is a boundary that divides the events of a distributed computation into two parts:

* Events before the cut
* Events after the cut

A cut represents a possible global state of the distributed system.


=== Consistent Cut

A cut is *consistent* if whenever it contains a receive event, it also contains the corresponding send event.

In simple terms:
 If a message has been received before the cut, its sending event must also be before the cut.

Example:

$ "send"(m) -> "receive"(m) $

If the cut contains $"receive"(m)$, it must also contain $"send"(m)$.

=== Inconsistent Cut

A cut is *inconsistent* if it contains the receive event but does not contain the corresponding send event.

Example:

$ "send"(m) | "CUT" | "receive"(m) $

This represents an impossible global state because the message appears to have been received before it was sent.

== Chandy-Lamport Distributed Snapshot Algorithm

The *Chandy-Lamport algorithm* records the global state of a distributed system without stopping the system.

It records:

+ State of each process
+ State of communication channels

== Algorithm

+ *Step 1:  Initiator Records Its State*

  The initiating process:

  - Records its own local state.
  - Sends a special *marker message* through all outgoing channels.

+ *Step 2: Receiving the First Marker*

  When a process receives a marker for the first time:

  #enum(
  [It records its local state.],
  [It records the channel from which the marker was received as empty.],
  [It sends a marker through all of its outgoing channels.],
  [It starts recording messages arriving on other incoming channels.]
  )

+ *Step 3: Receiving Subsequent Markers*

  When the process receives a marker on another incoming channel:

  - It stops recording that channel.
  - The messages recorded on that channel are the channel state.

+ *Step 4: Snapshot Completion*

  When all processes have recorded their local states and all channels have been recorded, the global snapshot is complete.

=== Uses

+ Deadlock detection
+ Distributed debugging
+ Checkpointing
+ Recovery from failures
+ Detecting stable properties

== State Recording and Distributed Debugging

=-= Applications of State Recording

State recording is used for:

+ Failure recovery
+ Deadlock detection
+ Termination detection
+ Detecting stable properties
+ Distributed debugging
+ Checkpointing

== Distributed Debugging

Distributed debugging is the process of finding errors in a distributed system by recording and analyzing the states of different processes.

It helps detect:

+ Deadlocks
+ Race conditions
+ Message-ordering problems
+ Synchronization errors
+ Inconsistent states



== Cristian vs Berkeley

#table(
columns: (1.8fr, 2.7fr, 2.7fr),
stroke: 0.5pt,
[Feature], [Cristian], [Berkeley],
[Main idea], [Client obtains time from server], [Coordinator calculates common time],
[Time source], [External time server], [Average of participating clocks],
[Main issue], [Single server failure], [Coordinator failure],
[Adjustment], [Client adjusts using server time], [All processes adjust according to coordinator],
)

== Important Formulas to Remember

$ a -> b => C(a) < C(b) $

$ V_a < V_b => a -> b $

$ V_a || V_b => a || b $

For receiving a Lamport message:

$ C_i = max(C_i,T_m)+1 $

For vector clock receiving:

$ V_i[k] = max(V_i[k],V_m[k]) $

then:

$ V_i[i] = V_i[i]+1 $

