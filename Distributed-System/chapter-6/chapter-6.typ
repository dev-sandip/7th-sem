= Coordination and Agreement 

== Mutual Exclusion in Distributed System

*Mutual exclusion* is a mechanism that ensures that only *one process at a time* can access a shared resource or critical section.

For example, if several processes want to update the same bank account, only one process should modify it at a time.

=== Fundamental Requirements of Mutual Exclusion

The basic requirements are:

* *Mutual Exclusion:* Only one process can execute the critical section at a time.
* *Progress:* If no process is in the critical section, a requesting process should eventually get permission.
* *Bounded Waiting:* Every requesting process should eventually get a chance; no process should wait forever.
* *Fairness:* Requests should be handled fairly and starvation should be avoided.

=== Why Mutual Exclusion is Important

It is needed to:

+ Protect shared resources.
+ Avoid race conditions.
+ Maintain data consistency.
+ Coordinate processes.
+ Prevent multiple processes from modifying the same resource simultaneously.

== Types of Mutual Exclusion Algorithms

Mutual exclusion algorithms are mainly classified into:

+ *Token-based algorithms*
+ *Non-token-based algorithms*

#table(
columns: (1.8fr, 2.7fr, 2.7fr),
stroke: 0.5pt,
[#strong[Feature]], [#strong[Token-based]], [#strong[Non-token-based]],
[Basic idea], [A unique token gives permission], [Processes exchange request/reply messages],
[Permission], [Possession of token], [Permission from other processes],
[Examples], [Token Ring], [Ricart-Agrawala],
[Messages], [Generally fewer messages], [Generally more messages],
[Failure], [Token loss is a major problem], [Process/message failure affects operation],
[Starvation], [Usually avoided if token circulates correctly], [Depends on request ordering],
)

== Token-Based Mutual Exclusion

In a token-based algorithm, there is a unique *token* in the system.

The process that holds the token is allowed to enter the critical section.

Basic operation:

+ A unique token circulates among processes.
+ A process waits for the token when it needs the critical section.
+ The process enters the critical section after receiving the token.
+ After completing its work, it passes the token to another process.
+ Only the token holder can enter the critical section.

The main advantage is that only one token exists, so mutual exclusion is naturally guaranteed.

== Token Ring Algorithm

Token Ring is a token-based mutual exclusion algorithm.

Processes are logically arranged in a ring.

Example:

$P_1 -> P_2 -> P_3 -> P_4 -> P_1$

A unique token circulates around the ring.

=== Algorithmic Steps

+ Initially, one process has the token.
+ A process that wants to enter the critical section waits for the token.
+ When the token reaches that process, it enters the critical section.
+ The process performs its critical-section operation.
+ After completing the operation, it sends the token to the next process.
+ The next process can use the token if it requires the critical section.
+ The token continues circulating around the ring.

=== Example

Suppose:

$P_1 -> P_2 -> P_3 -> P_4 -> P_1$

Initially:

$"Token" -> P_1$

If $P_3$ needs the critical section:

+ $P_1$ passes the token to $P_2$.
+ $P_2$ passes the token to $P_3$.
+ $P_3$ receives the token and enters the critical section.
+ After finishing, $P_3$ passes the token to $P_4$.
+ $P_4$ then passes it to $P_1$.

Therefore, only $P_3$ accesses the critical section during that turn.

=== Advantages

+ Simple concept.
+ Mutual exclusion is guaranteed.
+ No central coordinator is required.
+ No starvation if the ring operates correctly.
+ Provides an orderly access to the critical section.

=== Disadvantages

+ Token may be lost.
+ Failure of a process or communication link can break the ring.
+ A process may have to wait for the token to complete a full cycle.
+ Maintaining the logical ring can be difficult.

+= Non-Token-Based Mutual Exclusion

In a non-token-based algorithm, there is no special token.

A process requests permission from other processes before entering the critical section.

The *Ricart-Agrawala algorithm* is a common example.

Basic idea:

+ A process sends a request to other processes.
+ Other processes decide whether to grant permission.
+ The process enters the critical section after receiving the required replies.
+ After leaving the critical section, deferred requests are replied to.

== Centralized Mutual Exclusion Algorithm

A centralized algorithm uses one process as a *coordinator*.

The coordinator controls access to the critical section.

=== Algorithm

+ A process sends a request to the coordinator.
+ The coordinator places the request in a queue.
+ If the critical section is free, the coordinator sends permission.
+ The process enters the critical section.
+ After completing its work, it sends a release message to the coordinator.
+ The coordinator gives permission to the next waiting process.

=== Example

Suppose $P_1$, $P_2$, and $P_3$ use $P_1$ as coordinator.

If $P_2$ wants the critical section:

+ $P_2$ sends a request to $P_1$.
+ $P_1$ grants permission.
+ $P_2$ enters the critical section.
+ $P_2$ sends release after completing its work.
+ $P_1$ grants permission to the next waiting process.

=== Advantages

+ Simple to implement.
+ Requires fewer messages.
+ Easy to maintain ordering.

=== Disadvantages

+ Coordinator is a single point of failure.
+ Coordinator can become a bottleneck.
+ If the coordinator fails, a new coordinator must be elected.

== Ricart-Agrawala Algorithm

Ricart-Agrawala is a *non-token-based distributed mutual exclusion algorithm*.

It uses timestamps to order requests.

A process needs permission from all other processes before entering the critical section.

=== Basic Idea

When a process wants to enter the critical section:

+ It increments its logical clock.
+ It creates a request containing its timestamp and process ID.
+ It sends the request to all other processes.
+ Each receiving process compares the request with its own request.
+ It either sends a reply immediately or delays the reply.
+ The requesting process enters the critical section after receiving replies from all other processes.
+ After leaving the critical section, it sends replies to all deferred requests.

=== Request Priority

Requests are ordered using:

$("timestamp", "process_id")$

The request with the smaller timestamp has higher priority.

If timestamps are equal, the smaller process ID gets priority.

=== Example

Suppose $P_1$ and $P_2$ both want the critical section.

Requests:

$P_1: (5,1)$

$P_2: (7,2)$

Since:

$(5,1) < (7,2)$

$P_1$ gets priority.

Therefore $P_2$ delays its reply to $P_1$'s request.

After $P_1$ leaves the critical section, it sends the reply to $P_2$.

=== States of Ricart-Agrawala

A process can be considered in three states:

+ * RELEASED*
    
    The process is not interested in entering the critical section.

    It immediately replies to incoming requests.

+ * WANTED*

The process wants to enter the critical section.

It sends requests to all other processes.

It may defer replies to requests having lower priority.

+ * HELD*

  The process is currently executing the critical section.

  It defers all incoming requests until it leaves the critical section.

  After leaving, it sends replies to all deferred requests.

=== Performance Issue of Ricart-Agrawala

For $N$ processes, a process needs:

$2(N-1)$ messages

for one critical-section execution:

+ $N-1$ request messages
+ $N-1$ reply messages

Therefore, communication overhead becomes high as the number of processes increases.

Other problems include:

+ Waiting for replies from every process.
+ Failure of one process can prevent progress.
+ High message traffic in large systems.

=== Alternate Approach

A *token-based algorithm* such as Token Ring can reduce request/reply communication.

Instead of asking every process for permission, a process only waits for the token.

Therefore, token-based approaches can be more efficient in some systems with frequent mutual-exclusion requests.

== Centralized vs Ricart-Agrawala

#table(
columns: (1.8fr, 2.7fr, 2.7fr),
stroke: 0.5pt,
[#strong[Feature]], [#strong[Centralized]], [#strong[Ricart-Agrawala]],
[Coordinator], [Required], [Not required],
[Permission], [Coordinator gives permission], [All other processes give permission],
[Messages], [Usually 3 per access], [$2(N-1)$ messages],
[Failure], [Coordinator is single point of failure], [Process failure can affect progress],
[Complexity], [Simple], [More complex],
[Example], [Central coordinator], [Distributed request/reply],
)

== Election Algorithm

An *election algorithm* is used to select a process as the *coordinator or leader* in a distributed system.

The elected coordinator may perform tasks such as:

+ Managing shared resources.
+ Coordinating processes.
+ Managing critical-section access.
+ Detecting and handling failures.
+ Making system-wide decisions.

=== Why is Election Important in Distributed Systems?

Election is important because:

+ A coordinator may fail.
+ A new coordinator is required after coordinator failure.
+ Distributed systems do not have a permanently reliable central controller.
+ A leader can simplify coordination.
+ It helps maintain system availability after failures.

=== Practical Scenario for Election

Consider a distributed database with several servers.

Suppose one server acts as the coordinator.

If the coordinator crashes, the remaining servers must select another server to become coordinator.

An election algorithm performs this selection automatically.

Two common election algorithms are:

+ Bully algorithm
+ Ring-based election algorithm

== Bully Election Algorithm

The Bully algorithm elects the process with the *highest process ID* as coordinator.

Assume:

$P_1 < P_2 < P_3 < P_4 < P_5$

Therefore $P_5$ has the highest priority.

=== Algorithmic Steps

+ A process detects that the coordinator has failed.
+ It sends an *ELECTION* message to all processes having higher IDs.
+ If no higher process responds, it declares itself coordinator.
+ If a higher process responds with an *OK* message, the lower process stops its election.
+ The higher process starts its own election.
+ Eventually, the process with the highest active ID becomes coordinator.
+ The new coordinator sends a *COORDINATOR* message to all lower processes.

=== Example

Suppose:

$P_1, P_2, P_3, P_4, P_5$

and $P_5$ is the coordinator.

If $P_5$ fails and $P_2$ detects the failure:

+ $P_2$ sends ELECTION to $P_3$, $P_4$, and $P_5$.
+ $P_3$ and $P_4$ respond because they are active.
+ $P_3$ and $P_4$ start their own elections.
+ $P_4$ contacts $P_5$.
+ $P_5$ does not respond because it has failed.
+ $P_4$ becomes the new coordinator.
+ $P_4$ sends COORDINATOR to the other active processes.

Therefore:

$P_4 = "new"\ "coordinator"$

=== Advantages

+ Simple to understand.
+ Quickly selects the highest-priority process.
+ Suitable when process IDs are known.

=== Disadvantages

+ Generates many messages.
+ Higher processes receive repeated election messages.
+ Not efficient for large systems.

== Ring-Based Election Algorithm

In the Ring algorithm, processes are arranged in a logical ring.

Example:

$P_1 -> P_2 -> P_3 -> P_4 -> P_5 -> P_1$

The process with the highest ID becomes the coordinator.

=== Algorithmic Steps

+ A process detects that the coordinator has failed.
+ It creates an ELECTION message containing its own ID.
+ It sends the message to the next process in the ring.
+ Each active process adds its ID to the election message.
+ The message continues around the ring.
+ When the election message returns to the initiator, all participating IDs are known.
+ The highest ID is selected as coordinator.
+ A COORDINATOR message containing the winner's ID is circulated around the ring.
+ Each process records the winner as the new coordinator.

=== Example

Suppose:

$P_1 -> P_2 -> P_3 -> P_4 -> P_5 -> P_1$

and $P_5$ has failed.

If $P_2$ starts an election:

$"ELECTION"[2]$

Then:

$P_2 -> P_3 -> P_4 -> P_1$

IDs are collected:

$[2,3,4,1]$

Highest ID:

$4$

Therefore:

$P_4 = "coordinator"$

Then a COORDINATOR message circulates through the ring.

== Bully vs Ring Election

#table(
columns: (1.8fr, 2.7fr, 2.7fr),
stroke: 0.5pt,
[#strong[Feature]], [#strong[Bully]], [#strong[Ring]],
[Structure], [No fixed ring required], [Logical ring required],
[Winner], [Highest active ID], [Highest active ID],
[Message path], [Directly contacts higher processes], [Message circulates around ring],
[Failure handling], [Higher processes are contacted], [Failed processes are skipped],
[Message overhead], [Can be high], [Generally more controlled],
[Complexity], [Simple], [Requires ring maintenance],
)

== Distributed Coordination

*Distributed coordination* is the process of managing and synchronizing multiple distributed processes so that they can work together correctly.

It is required for:

+ Mutual exclusion.
+ Election.
+ Consensus.
+ Resource sharing.
+ Synchronization.
+ Distributed transactions.

== Consensus in Distributed Systems

*Consensus* means that all correct processes in a distributed system agree on the same decision or value.

For example, suppose three servers must decide whether a transaction should be committed.

If all correct servers agree:

$"Decision" = "COMMIT"$

then consensus is achieved.

=== Requirements of Consensus

A consensus algorithm generally satisfies:

+ *Agreement:* All correct processes decide the same value.
+ *Validity:* The decided value must be an acceptable proposed value.
+ *Termination:* Every correct process eventually makes a decision.

=== How Consensus is Achieved

A simple approach is:

+ Processes propose their values.
+ Processes exchange their proposed values.
+ Each process receives proposals from other processes.
+ A common decision rule is applied.
+ All correct processes use the same rule.
+ Eventually, all correct processes choose the same decision.

=== Example

Suppose three processes propose:

  $P_1: "COMMIT"$

  $P_2: "COMMIT"$

  $P_3: "ABORT"$

If the system uses majority voting:

$"COMMIT" = 2$

$"ABORT" = 1$

Therefore:

$"Decision" = "COMMIT"$

All correct processes agree on COMMIT.

=== Importance of Consensus

Consensus is required for:

+ Replicated databases.
+ Leader election.
+ Distributed transactions.
+ Fault-tolerant services.
+ Maintaining consistent replicated state.

== Making Distributed Services Highly Available

A distributed service can be made highly available by:

+ Replicating services across multiple machines.
+ Using leader election when the current leader fails.
+ Detecting failures using heartbeats or timeouts.
+ Automatically replacing failed nodes.
+ Replicating important data.
+ Using consensus to maintain consistent decisions.
+ Avoiding a single point of failure.

Therefore, if one server fails, another server can continue providing the service.

== Reliable Multicast

*Reliable multicast* is a communication mechanism in which a message sent by one process to a group of processes is delivered reliably to all intended group members.

=== Properties of Reliable Multicast

+ *Validity:* If a correct sender multicasts a message, the message is eventually delivered.
+ *Agreement:* If one correct process delivers a message, other correct group members eventually deliver it.
+ *Integrity:* A message is delivered at most once and only if it was actually sent.
+ *Ordering:* Messages can be delivered in a specified order when required.

=== Simple Reliable Multicast Algorithm

+ Sender assigns a unique sequence number to every message.
+ Sender multicasts the message to all group members.
+ Each receiver checks the sequence number.
+ If the message is received correctly, it sends an acknowledgment.
+ If a receiver detects a missing message, it requests retransmission.
+ The sender or another replica retransmits the missing message.
+ The receiver delivers the message only after satisfying the reliability condition.

== Checkpointing for Distributed Recovery

*Checkpointing* is the process of periodically saving the state of a process so that the system can recover after a failure.

=== Basic Steps

* Each process periodically saves its current state as a checkpoint.
* Checkpoints are stored in stable storage.
* During normal execution, new checkpoints are created periodically.
* If a process fails, it rolls back to its latest valid checkpoint.
* Related processes may also roll back to maintain a consistent global state.
* System execution resumes from the recovered state.

=== Advantages

* Reduces recovery time.
* Avoids restarting the entire computation.
* Helps recover from process failures.
* Provides a recovery point for distributed applications.

