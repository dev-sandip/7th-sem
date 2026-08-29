#set text(font: "Charis SIL", size: 11pt, lang: "en")
#set par(justify: true)

= Replication in Distributed Systems

== Replication

Replication in a Distributed System is the technique of creating and
maintaining multiple copies (replicas) of data, services, or objects on
different machines.

It is mainly used to improve *availability, reliability, performance,
fault tolerance,* and *scalability*.

=== Requirements of Replication

- *Consistency*: All replicas should have correct and compatible data.
- *Availability*: The service should remain available when a replica fails.
- *Fault Tolerance*: The system should continue working even when some
  replicas fail.
- *Reliability*: Multiple copies reduce the chance of data or service loss.
- *Performance*: Requests can be distributed among replicas.
- *Synchronization*: Updates should be properly propagated to replicas.
- *Transparency*: Users should not need to know which replica serves
  their request.

=== Reasons / Benefits of Replication

- *High Availability*: Service remains available even if a replica fails.
- *Reliability*: Multiple copies reduce the chance of data loss.
- *Fault Tolerance*: The system can continue after a server failure.
- *Better Performance*: Requests can be handled by different replicas.
- *Lower Response Time*: Users can access a nearby replica.
- *Load Balancing*: Workload can be distributed among replicas.
- *Scalability*: More replicas can handle more users and requests.
- *Disaster Recovery*: A backup replica can be used after a failure.

=== Drawbacks of Replication

- Requires extra *storage* for multiple copies.
- Requires extra *network communication* to propagate updates.
- Maintaining *consistency* between replicas is difficult.
- Concurrent updates may cause *conflicts*.
- Replica failures must be detected and recovered.
- More replicas increase the *management complexity*.
- Strong consistency may reduce performance and availability.

=== Challenges of Replication

- *Consistency*: Keeping all replicas synchronized.
- *Update Propagation*: Sending updates correctly to all replicas.
- *Network Failure*: Handling communication failures between replicas.
- *Replica Failure*: Detecting and recovering failed replicas.
- *Concurrency*: Managing simultaneous updates.
- *Conflict Resolution*: Resolving conflicting updates.
- *Scalability*: Managing a large number of replicas.
- *Overhead*: Extra storage, bandwidth, and processing are required.
- *Consistency vs Availability*: Maintaining both at the same time is difficult.
- *Replica Placement*: Deciding where replicas should be located.

=== Replication as a Scaling Technique

Replication helps to scale a distributed system by:

- Distributing requests among multiple servers.
- Increasing the number of requests the system can handle.
- Reducing the load on a single server.
- Reducing response time by using nearby replicas.
- Preventing a single server from becoming a bottleneck.
- Allowing more replicas to be added as users increase.

== Consistency Models

A *consistency model* defines how and when updates made to one replica
are visible to other replicas.

=== Data-Centric Consistency Models

The main data-centric consistency models are:

- *Strict Consistency*
- *Sequential Consistency*
- *Causal Consistency*
- *FIFO Consistency*
- *Weak Consistency*
- *Eventual Consistency*

=== Strict Consistency

In strict consistency, every read operation returns the value of the
most recent write.

*Example:* If a value changes from 10 to 20, every later read must
immediately return 20.

It provides very strong consistency but is difficult to achieve in
distributed systems because of network delays and failures.

=== Sequential Consistency

In sequential consistency, all operations appear to occur in some
single sequential order.

The order of operations of each individual process is preserved.

=== Causal Consistency

In causal consistency, causally related operations must be seen in the
same order by all replicas.

*Example:* If operation A causes operation B, all replicas must see A
before B.

=== FIFO Consistency

FIFO consistency ensures that updates from the same process are seen
by all replicas in the order in which that process issued them.

=== Weak Consistency

In weak consistency, updates do not need to become visible immediately.
The system provides consistency only at certain synchronization points.

=== Eventual Consistency

In eventual consistency, if no new updates occur, all replicas will
eventually contain the same value.

It provides high availability and is commonly used in large distributed
systems.

== Fault and Fault Tolerance

=== Fault

A *fault* is a defect or failure in a component of a distributed system
that may cause incorrect behavior or service failure.

=== Fault Tolerance

*Fault tolerance* is the ability of a distributed system to continue
providing its service correctly even when some components fail.

Replication is an important technique for achieving fault tolerance.

== Fault-Tolerant Replication Models

=== Active Replication

In *active replication*, all replicas process every request
independently.

==== Working

+ Client sends a request.
+ The request is delivered to all replicas.
+ Every replica executes the same request.
+ All replicas produce the same result and state.

#image("../../assets/image-5a.png")

*Advantage:* Fast recovery because all replicas are already active.

*Disadvantage:* Requires more processing and communication.

=== Passive Replication

In *passive replication*, only one replica, called the *primary*,
processes requests. Other replicas are called *backups*.

==== Working

+ Client sends a request to the primary.
+ Primary processes the request.
+ Primary sends the updated state to the backups.
+ Backups store the updated state.
+ If the primary fails, a backup becomes the new primary.

*Advantage:* Less processing overhead because only the primary executes
the request.

*Disadvantage:* Failure detection and switching to a backup can cause
some delay.

== Primary-Backup Replication

In *primary-backup replication*, one replica acts as the *primary* and
the remaining replicas act as *backups*.

The primary handles client requests and sends state updates to the
backups.

=== Working of Primary-Backup Model

+ Client sends a request to the *primary*.
+ Primary executes the request.
+ Primary updates its state.
+ Primary sends the updated state or operation to the backups.
+ Backups update their copies.
+ Primary sends the result to the client.
+ If the primary fails, a backup is selected as the new primary.

=== Election of Replica Manager

If the primary fails, a new primary must be selected.

==== Election Process

+ *Detect Failure*: Backup replicas detect that the primary is not
  responding.
+ *Start Election*: Backups communicate with each other.
+ *Choose Replica*: A replica is selected using a rule such as
  highest ID or most up-to-date state.
+ *New Primary*: The selected replica becomes the new primary.
+ *Inform Others*: Other replicas are informed about the new primary.

*Example:* If R1 is the primary and R2 and R3 are backups, and R1
fails, R2 and R3 hold an election. If R3 has the highest ID and is
up-to-date, R3 becomes the new primary.

== Comparison of Active and Passive Replication

#table(
  columns: 2,
  [*Active Replication*], [*Passive Replication*],

  [All replicas process every request.],
  [Only the primary processes requests.],

  [Every replica executes the operation and maintains its state.],
  [Backups maintain the state received from the primary.],

  [All replicas are active at the same time.],
  [Backups are mainly used for recovery.],

  [Recovery is fast because replicas are already processing requests.],
  [Recovery may take time because a backup must become primary.],

  [Requires more processing and communication.],
  [Requires less processing overhead.],

  [Also called *state-machine replication*.],
  [Also called *primary-backup replication*.],
)

== Handling Concurrent Invocations with Object Replication

When many clients access a replicated object at the same time, the
system must make sure that all replicas process operations in a
consistent order.

=== In Active Replication

- The same request is delivered to all replicas.
- All replicas execute the request in the *same order*.
- A total-order or ordered multicast mechanism can be used.
- Therefore, all replicas maintain the same state.

*Example:* If two requests A and B arrive, all replicas must execute
A then B, or all must execute B then A.

=== In Passive Replication

- The primary receives and orders client requests.
- The primary executes the requests.
- The primary sends the results or updated state to backups.
- Therefore, the primary controls the order of concurrent requests.

== Gossip Architecture

Gossip architecture uses a *decentralized, peer-to-peer* approach for
replication.

There is no permanent primary. Each replica periodically communicates
with other replicas and exchanges updates.

=== Working

+ A replica receives or creates an update.
+ It selects another replica, usually randomly.
+ It sends the update to that replica.
+ The receiving replica stores the update.
+ It later spreads the update to other replicas.
+ Eventually, the update reaches most or all replicas.

It works like *gossip spreading among people*.

=== Gossip vs Active and Passive Replication

#table(
  columns: 2,
  [*Problem*], [*How Gossip Helps*],

  [*Passive:* Primary failure],
  [No permanent primary, so there is no single primary to fail.],

  [*Active:* Every replica executes every request],
  [Replicas mainly exchange updates instead of all executing every request.],

  [*Single point of failure*],
  [Decentralized communication avoids dependence on one node.],

  [*High coordination overhead*],
  [Replicas communicate with selected peers periodically.],

  [*Network failure*],
  [Updates can spread again when communication is restored.],

  [*Scalability*],
  [New replicas can participate in the gossip process.],
)

== High Availability using Replication

Replication can make a distributed service highly available by keeping
multiple copies of the service.

*Example:* In primary-backup replication, if the primary server fails,
a backup server can become the new primary. Therefore, clients can
continue using the service.

#table(
  columns: 2,
  [*Without Replication*], [*With Replication*],

  [One server failure can stop the service.],
  [Another replica can continue the service.],

  [Single point of failure.],
  [Multiple copies provide redundancy.],

  [Limited scalability.],
  [Requests can be distributed among replicas.],
)