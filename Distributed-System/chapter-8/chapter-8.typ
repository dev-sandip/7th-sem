#set text(
  font: "Charis SIL",
  size: 12pt,
  lang: "en",
)
#set par(justify: true)

= Transction Control And Concurrency Control
== Concurrency 
Courrency in a distributed system refers to the ability of multiple processes or threads to execute simultaneously, potentially accessing shared resources or data. Concurrency control is the management of concurrent operations to ensure that they do not interfere with each other and that the system maintains consistency and correctness.


== Transction 
A transaction is a sequence of operations performed as a single logical unit of work. In a distributed system, transactions may involve multiple processes or nodes, and they must adhere to the ACID properties (Atomicity, Consistency, Isolation, Durability) to ensure data integrity and reliability.

== Problems in Concurrent Transactions

+ _*Lost Update*_ : When two transactions read the same data and then update it, the second update may overwrite the first one, leading to lost updates.

  Example:

  #table(
    columns: 4,
    [Step], [Transaction T1], [Transaction T2], [Balance],
    [1], [Read balance = Rs. 1000], [], [Rs. 1000],
    [2], [], [Read balance = Rs. 1000], [Rs. 1000],
    [3], [Add Rs. 500 → Rs. 1500], [], [Rs. 1000],
    [4], [], [Subtract Rs. 200 → Rs. 800], [Rs. 1000],
    [5], [Write Rs. 1500], [], [Rs. 1500],
    [6], [], [Write Rs. 800], [Rs. 800],
  )

  Here, T1's update of Rs. 1500 is overwritten by T2's update of
  Rs. 800. Therefore, T1's update is *lost*.

+ _*Inconsistent Retrieval*_ : When a transaction reads data that is being modified by another transaction, it may retrieve inconsistent or incorrect data.

  Example:

  Suppose a bank has two accounts, A and B.

  #table(
    columns: 4,
    [Step], [Transaction T1], [Transaction T2], [Database State],
    [1], [Read A = Rs. 1000], [], [A = 1000, B = 500],
    [2], [], [Transfer Rs. 200 from A to B], [A = 800, B = 700],
    [3], [Read B = Rs. 700], [], [A = 800, B = 700],
    [4], [Calculate A + B = 1700], [], [A = 800, B = 700],
  )

  If T1 reads A before T2's update and B after T2's update, it gets
  values from different points in time. This may cause T1 to retrieve
  an inconsistent result.


== Nested Transactions
Nested transactions are a way to structure transactions in a hierarchical manner, where a parent transaction can have one or more child transactions. Each child transaction can be executed independently, and the parent transaction can commit or abort based on the outcomes of its child transactions. 
=== Rules For Commit 
+ If a parent transaction commits, all its child transactions must also commit.
+ If a parent transaction aborts, all its child transactions must also abort.
+ If a child transaction aborts, the parent transaction may choose to abort or continue based on its logic.
+ If a child transaction commits, the parent transaction can continue executing and may commit or abort later.
+ If a child transaction is nested within another child transaction, the same rules apply recursively.

== Concurrency Control
_Concurrency Control_ is the process of managing simultaneous execution of transaction in a shared system, to ensure the serializability of transactions.\
Purpose:\
- To enforce isolation.
- To preserve consistency.
- To resolve read-write and write-write conflicts.
== Concurrency Control Techniques

=== Locks

*Locks* are used to control access to shared data when many
transactions run at the same time. They prevent conflicts and keep
data consistent.

There are two main types of locks:

+ *Shared Lock (Read Lock)*:
  Allows multiple transactions to read the same resource at the same
  time, but does not allow writing.

+ *Exclusive Lock (Write Lock)*:
  Allows only one transaction to access a resource for writing. Other
  transactions must wait until the lock is released.

*Example:*

Suppose T1 and T2 want to access resource R.

#table(
  columns: 3,
  [Transaction], [Lock], [Action],
  [T1], [Shared], [Reads R],
  [T2], [Shared], [Reads R],
  [T1], [Exclusive], [Writes R],
  [T2], [Waits], [Cannot access R],
)

=== Phases of Locking

+ *Working Phase*: The transaction performs its operations and
  requests the required locks.

+ *Locking Phase*: The transaction gets available locks. If a lock is
  not available, it waits.

+ *Unlocking Phase*: After completing its work, the transaction
  releases its locks.

=== Validation of Transactions

Validation checks whether a transaction can safely complete without
conflicting with other transactions.

+ If all earlier transactions have finished before T starts, T can
  proceed.

+ If an earlier transaction S is still running, T must be checked to
  ensure that their read and write operations do not conflict.

+ The earlier transaction must complete its write phase before T
  enters its validation phase.

=== Benefits of Locks

+ Maintain *data consistency and integrity*.
+ Prevent conflicts between concurrent transactions.
+ Provide *isolation* between transactions.
+ Control access to shared resources.

=== Drawbacks of Locks

+ Can cause *waiting and resource contention*.
+ May lead to *deadlocks*.
+ Increase the complexity of transaction management.
+ Can reduce system performance when many transactions are waiting.

== Timestamp Ordering
_Timestamp Ordering_ is a concurrency control technique that assigns a unique timestamp to each transaction when it starts. The timestamps are used to determine the order of transactions and ensure that they are executed in a serializable manner. The basic idea is to maintain a global order of transactions based on their timestamps, and to enforce this order during the execution of transactions. This helps prevent conflicts and ensures that the final state of the system is consistent with the order of transactions.
=== Basic Rules of Timestamp Ordering
+ Each transaction is assigned a unique timestamp when it starts.
+ Transactions are executed in the order of their timestamps, with earlier transactions being executed before later ones.
+ If a transaction requests to read or write a data item, the system checks the timestamps of the transaction and the data item to determine if the operation can be performed without violating the timestamp order.
+ If a transaction requests to read a data item that has been written by a later transaction, the read operation is rejected, and the transaction may be aborted or rolled back.
+ If a transaction requests to write a data item that has been read or written by an earlier transaction, the write operation is rejected, and the transaction may be aborted or rolled back.
+ The system maintains a log of all transactions and their timestamps to ensure that the order of execution is preserved and that the final state of the system is consistent with the order of transactions.


== Distributed Transaction
A _distributed transaction_ is a transaction that involves multiple nodes or processes in a distributed system.
It requires either all of the nodes  involved to commit the transaction or all of them to abort it, ensuring that the system remains in a consistent state. Distributed transactions are more complex than local transactions due to the challenges of coordinating multiple nodes and handling failures.
=== Flat Distributed Transactions
A _flat distributed transaction_ is a type of distributed transaction that follows a single, linear sequence of operations across multiple nodes. In a flat distributed transaction, all participating nodes must either commit or abort the transaction as a single unit. This ensures that the system remains in a consistent state, even in the presence of failures or concurrent operations. Flat distributed transactions are typically managed using a two-phase commit protocol, which involves a prepare phase and a commit phase to coordinate the actions of all participating nodes.

=== Nested Distributed Transactions
A _nested distributed transaction_ is a type of distributed transaction that allows for a hierarchical structure of transactions, where a parent transaction can have one or more child transactions. Each child transaction can be executed independently, and the parent transaction can commit or abort based on the outcomes of its child transactions. Nested distributed transactions provide greater flexibility and modularity in managing complex operations across multiple nodes, allowing for better error handling and recovery in distributed systems.
== Distribted Commit
_Distributed Commit_ is the process of ensuring that all participating nodes in a distributed transaction either commit or abort the transaction as a single unit. This is crucial for maintaining consistency and integrity in a distributed system, where multiple nodes may be involved in a transaction. Distributed commit protocols, such as the Two-Phase Commit (2PC) and Three-Phase Commit (3PC), are used to coordinate the commit process across all participating nodes, ensuring that they reach a consistent decision regarding the transaction.
=== Two-Phase Commit Protocol
The _two-phase commit protocol_ is a distributed algorithm used to ensure that all participating nodes in a distributed transaction either commit or abort the transaction as a single unit. It consists of two phases:
+ *_Phase 1: Prepare Phase_*: In this phase, the coordinator node sends a prepare request to all participating nodes, asking them to prepare for the transaction. Each node responds with a _VOTE_ indicating whether it is ready to commit or abort the transaction. If all nodes _VOTE_ to commit, the coordinator proceeds to the next phase; otherwise, it aborts the transaction.
+ *_Phase 2: Commit Phase_*: In this phase, if all nodes voted to commit in the prepare phase, the coordinator sends a _COMMIT_ request to all participating nodes, instructing them to _COMMIT_ the transaction. If any node voted to abort in the prepare phase, the coordinator sends an _ABORT_ request to all participating nodes, instructing them to abort the transaction. This ensures that all nodes reach a consistent decision regarding the transaction, maintaining the integrity and consistency of the distributed system.
#figure(
  image("/assets/image-16.png"),
  caption: "Two Phase Commit Protocol"
)
=== Three-Phase Commit Protocol

The *Three-Phase Commit (3PC) protocol* is an improved version of the
Two-Phase Commit protocol. It adds one extra phase to reduce blocking
when a failure occurs in a distributed transaction.

+ *Phase 1: Prepare Phase*:
  The coordinator asks all participating nodes if they are ready to
  commit. Each node sends a _VOTE_. If all vote to commit, it moves to
  the next phase. Otherwise, the transaction is aborted.

+ *Phase 2: Pre-Commit Phase*:
  The coordinator tells all nodes to prepare for commit. Each node
  sends an acknowledgment after getting ready.

+ *Phase 3: Commit Phase*:
  If all nodes acknowledge, the coordinator sends a _COMMIT_ message.
  All nodes then commit the transaction. If a node does not respond,
  the transaction can be aborted.

*Main advantage:* It reduces the chance of the system getting stuck
(blocked) when a node or coordinator fails.
#figure(
  image("/assets/image-17.png"),
  caption: "Three Phase Commit Protocol"
)
== The Lost Update Problem

The *Lost Update Problem* occurs when two transactions read the same
data and both try to update it. The update made by one transaction may
be overwritten by the other, so the first update is lost.

This usually happens when multiple transactions access the same data
at the same time without proper concurrency control.

*Example:*

Suppose the account balance is *Rs. 1000*.

#table(
  columns: 4,
  [Step], [Transaction T1], [Transaction T2], [Balance],
  [1], [Reads Rs. 1000], [], [Rs. 1000],
  [2], [], [Reads Rs. 1000], [Rs. 1000],
  [3], [Adds Rs. 500], [], [Rs. 1000],
  [4], [], [Subtracts Rs. 200], [Rs. 1000],
  [5], [Writes Rs. 1500], [], [Rs. 1500],
  [6], [], [Writes Rs. 800], [Rs. 800],
)

Here, T1's update to *Rs. 1500* is overwritten by T2.
Therefore, T1's update is *lost*.

*Prevention:* Locks, timestamps, or versioning can be used to control concurrent transactions.

== Distributed Deadlock

A *Distributed Deadlock* occurs when two or more transactions wait for
each other to release resources. As a result, none of them can
continue.

*Example:* T1 holds resource A and waits for B, while T2 holds B and
waits for A. Both transactions wait forever.

=== Distributed Deadlock Avoidance

*Distributed Deadlock Avoidance* means using techniques to prevent
transactions from waiting forever for resources.

Common techniques include:
- Resource ordering
- Wait-die and wound-wait schemes
- Timeouts

+ *Wound-Wait Scheme*:
  The system compares the timestamps of two transactions.
  - If the requesting transaction is *older*, it forces the younger
    transaction to abort and releases its resources.
  - If the requesting transaction is *younger*, it waits.

  This gives priority to older transactions and helps prevent
  deadlocks.

+ *Wait-Wait Scheme*:
  A transaction simply waits if the required resource is being used by
  another transaction. A *timeout* can be used to abort a transaction
  that waits for too long.

  This prevents transactions from waiting forever.


== Comparison of Nested Transactions with Distributed Transactions

#table(
  columns: 2,
  [Nested Transactions], [Distributed Transactions],

  [A transaction is divided into smaller sub-transactions.],
    [A transaction is executed across multiple sites or nodes.],

  [Sub-transactions are controlled by a parent transaction.],
    [Different nodes participate in the same transaction.],

  [Child transactions can run independently.],
    [Each site performs its assigned part of the transaction.],

  [Failure of a child transaction can affect the parent.],
    [Failure of one node may affect the entire transaction.],

  [Example: A large transaction divided into smaller tasks.],
    [Example: A bank transaction involving multiple servers.],
)

*Why is it necessary to maintain transaction? What is a deadlock and what are phantom deadlocks.*\
Transactions are necessary to maintain the integrity and consistency of data in a distributed system. They ensure that operations are executed as a single logical unit, adhering to the ACID properties (Atomicity, Consistency, Isolation, Durability). This is crucial for preventing data corruption and ensuring that the system behaves predictably even in the presence of concurrent operations or failures.\

 Deadlock is a situation in a distributed system where two or more transactions are unable to proceed because each is waiting for resources held by the other(s). This results in a cycle of dependencies that prevents any of the involved transactions from completing.\ Phantom deadlocks are a specific type of deadlock that can occur in distributed systems when transactions are waiting for resources that are not actually held by any other transaction, often due to inconsistencies in the system state or communication delays. Phantom deadlocks can be more challenging to detect and resolve because they may not involve direct resource contention, but rather arise from the dynamic nature of distributed systems and the timing of operations.


*How is commitment ensured in distributed transactions?* \

Commitment in distributed transactions is ensured through the use of distributed commit protocols, such as the Two-Phase Commit (2PC) and Three-Phase Commit (3PC) protocols. These protocols coordinate the actions of all participating nodes to ensure that they either all commit or all abort the transaction, maintaining consistency across the distributed system.