#set text(font: "Charis SIL", size: 11pt, lang: "en")
#set par(justify: true)
= Replication in Distributed Systems
== Replication 
Replication in a Distributed System is the technique of creating and maintaining multiple copies (replicas) of data, services, or objects on different machines to improve availability, performance, and reliability.

=== Requirements

- *Consistency* : All replicas should maintain correct and compatible data.
- *Availability* : Data/service should remain accessible even if one replica fails.
- *Fault Tolerance* : The system should continue working when some replicas or servers fail.
- *Reliability* : Replicas should reduce the chance of data/service loss.
- *Performance* : Requests can be distributed among replicas to reduce response time and load.
- *Synchronization* : Changes made to one replica should be properly propagated to other replicas.
- *Transparency* : Users should not need to know which replica is actually serving their request.
=== Reasons for Replication in Distributed Systems

+ *Improve availability* : Service remains available even if one replica fails.
+ *Increase reliability* : Multiple copies reduce the chance of data loss.
+ *Fault tolerance* : System can continue operating when a server fails.
+ *Improve performance* : Requests can be served by the nearest or less-loaded replica.
+ *Reduce response time* : Users can access a nearby replica.
+ *Load balancing* : Workload can be distributed among multiple replicas.
+ *Scalability* : More replicas can handle increasing numbers of users.
+ *Disaster recovery* : A backup replica can be used when the primary system is damaged.
=== Challenges of Replication in Distributed Systems

- *Consistency* : Keeping all replicas synchronized and consistent.
- *Update propagation* : Ensuring changes reach all replicas correctly.
- *Network failures* : Handling communication failures between replicas.
- *Replica failures* : Detecting and recovering from failed replicas.
- *Concurrency* : Managing simultaneous updates to the same data.
- *Conflict resolution* : Resolving conflicting updates made at different replicas.
- *Scalability* : Managing a large number of replicas efficiently.
- *Overhead* : Replication requires extra storage, bandwidth, and processing.
- *Availability vs. consistency* : Maintaining high availability while ensuring strong consistency can be difficult.
- *Replica placement* : Deciding where replicas should be located for better performance and reliability.

=== *How it helps scaling?*

- Distributes load among multiple servers.
- Increases capacity to handle more users/requests.
- Reduces response time by serving users from nearby replicas.
- Prevents a single server from becoming a bottleneck.
- Improves availability if one server fails.
== Consistency Models

- *Strict Consistency* : Every read returns the most recent write immediately.
- *Sequential Consistency* : All operations appear to occur in one sequential order, while preserving each process's order.
- *Causal Consistency* : Causally related writes are seen in the same order by all processes.

== Fault Tolerance Services
=== Active Replication

In active replication, all replicas process every request independently.

*Working:*

+ Client sends a request.
+ Request is delivered to all replicas.
+ Every replica executes the request.
+ All replicas produce the same result/state.

*Advantage:* Fast recovery because replicas are already active. \
*Disadvantage:* More processing and communication overhead.
#image("../../assets/image-5a.png")
=== Passive Replication

In passive replication, only one replica (the primary) actively processes requests. Other replicas (backups) maintain copies of the primary's state.

*Working:*

+ Client sends request to the primary.
+ Primary processes the request.
+ Primary sends the updated state/result to backup replicas.
+ If primary fails, one backup becomes the new primary.

*Advantage:* Less processing overhead because only the primary executes requests. \
*Disadvantage:* Failure detection and switching to a backup may cause some delay.
#table(
  columns: 2,
  [*Active Replication*], [*Passive Replication*],
  [All replicas *process every request*.], [Only the *primary replica processes requests*.],
  [Each replica maintains its own state by executing operations.], [Backup replicas maintain the state received from the primary.],
  [No need to transfer the complete state after every operation.], [Primary usually sends updated state/checkpoints to backups.],
  [Failure recovery is *fast* because other replicas are already active.], [Recovery can be *slower* because a backup must become the new primary.],
  [Requires *more processing and communication*.], [Requires *less processing overhead*.],
  [Also called *state-machine replication*.], [Also called *primary-backup replication*.],
  [Example: A, B, and C all execute the same transaction.], [Example: A executes the transaction; B and C keep backup copies.],
)
=== Fault
A fault is a defect or failure in a component of a distributed system that may cause the system to behave incorrectly or stop providing its service.

=== Fault Tolerance
Fault tolerance is the ability of a Distributed System to continue providing its services correctly even when one or more components fail.

=== Gossip Architecture
Gossip architecture avoids some of the main problems of both active and passive replication by using a decentralized, peer-to-peer approach.

In gossip replication, there is no permanent primary replica. Each replica can communicate with other replicas and periodically exchanges updates.

*How it works*

Suppose we have three replicas:

`       Replica A
       ↙       ↘
  Replica B ←→ Replica C`
+ A replica receives or creates an update.
+ It periodically selects another replica (often randomly).
+ It sends the update to that replica.
+ The receiving replica stores the update and later spreads it to other replicas.
+ Eventually, the update propagates throughout the system.

This is similar to how gossip spreads among people.
#table(
  columns: 2,
  [*Problem*], [*Gossip approach*],
  [*Passive replication:* Primary failure], [No permanent primary → no single primary to fail],
  [*Active replication:* Every replica executes every request], [Replicas don't all need to execute every update simultaneously],
  [*Single point of failure*], [Decentralized communication],
  [*High coordination overhead*], [Replicas communicate with selected peers periodically],
  [*Network partition/failure*], [Updates can continue spreading when communication is restored],
  [*Scalability problem*], [Adding more replicas can increase the spreading paths],
)