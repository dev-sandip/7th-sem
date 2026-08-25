= Concurrency Control Techniques
== Locks in Concurrency Control

A lock is a mechanism used to control access to shared data when multiple transactions execute at the same time.
It prevents two transactions from making conflicting operations on the same data.

*Types of Locks*

=== 1. Shared Lock (S-Lock)

- Used when a transaction only wants to read data.
- Multiple transactions can hold a shared lock on the same data simultaneously.
- No transaction can modify the data while an S-lock is held.

*Example:*

- T1 reads `A` → gets S-lock on A.
- T2 can also read `A` → gets S-lock on A.
- But T2 cannot write A.

=== 2. Exclusive Lock (X-Lock)

- Used when a transaction wants to write/update data.
- Only one transaction can hold an exclusive lock.
- Other transactions cannot read or write the locked data.

*Example:*

- T1 wants to update `A` → gets X-lock on A.
- T2 cannot read or update A until T1 releases the lock.

== Two-Phase Locking (2PL) Protocol

Two-Phase Locking (2PL) is a concurrency control technique that ensures serializability of transactions by controlling when locks can be acquired and released.

It has two phases:

=== 1. Growing Phase

- Transaction can acquire new locks.
- It cannot release any lock.

=== 2. Shrinking Phase

- Transaction can release locks.
- It cannot acquire any new lock.

*Example*

Suppose transaction T1 wants to read `A` and update `B`:
`T1:
Lock-S(A) ← Growing phase
Read(A)
Lock-X(B) ← Growing phase
Write(B)
Unlock(A) ← Shrinking phase
Unlock(B)`
Once T1 releases its first lock (`Unlock(A)`), it cannot obtain any new locks.
== Optimistic Concurrency Control (OCC)

Optimistic Concurrency Control (OCC) is a concurrency control technique that does not use locks during transaction execution. It assumes that conflicts between transactions are rare.

*How OCC Works*

OCC generally has 3 phases:

+ *Read Phase*
  - Transaction reads data from the database.
  - It performs calculations and updates a local copy of the data.
  - Changes are not yet written to the database.
+ *Validation Phase*
  - Before committing, the system checks whether the transaction has conflicted with other transactions.
  - If there is no conflict → transaction can commit.
  - If a conflict exists → transaction is aborted/rolled back.
+ *Write Phase*
  - If validation is successful, the transaction's changes are written to the database.

*Example*
Suppose T1 and T2 both read account balance `A`.

`T1 → Read A → Calculate → Validate → Write → Commit
T2 → Read A → Calculate → Validate → Conflict → Abort`

If T1 changes `A` before T2 commits, T2's validation detects the conflict and T2 is restarted.
== Timestamp Ordering

Timestamp Ordering is a concurrency control technique that uses timestamps, instead of locks, to decide the order in which transactions should execute. Each transaction is assigned a unique timestamp when it starts, and this timestamp determines its priority in case of conflicts.

*How it works*

- Every transaction `T` is assigned a timestamp `TS(T)` when it begins.
- Every data item has a *read timestamp* and a *write timestamp*, recording the timestamp of the last transaction that read/wrote it.
- When a transaction tries to read or write a data item, its timestamp is compared with the item's read/write timestamps.
- If the transaction's timestamp is older than what the rule requires, the transaction is aborted and restarted with a new timestamp.

*Example*

`T1 (timestamp = 10) → Write A
T2 (timestamp = 15) → Write A`

If T2 tries to write `A` after T1, but a transaction with a later timestamp has already written `A`, T2's write is rejected and T2 is restarted.

== Flat and Nested Transactions

=== 1. Flat Transaction

A flat transaction is a transaction that is treated as one single unit of work. It does not contain other transactions inside it.

#image("../assets/image-6a.png")
- All operations belong to the same transaction.
- If any critical operation fails, the whole transaction may be rolled back.
- Simple to manage.

Example: Transferring money from Account A to Account B.

=== 2. Nested Transaction

A nested transaction is a transaction that contains one or more sub-transactions inside it.

#image("../assets/image-7a.png")


  - The main transaction is called the parent transaction.
- The smaller transactions are called child/sub-transactions.
- Child transactions can execute independently.
- A child transaction may commit internally, but its final result normally becomes permanent only when the parent transaction commits.
- Useful in distributed systems because different sub-transactions can run at different sites.

== Benefits and Drawbacks of Using Locks in Distributed Transaction Processing
*Benefits*

+ *Maintains consistency*
  - Prevents conflicting transactions from modifying the same data simultaneously.
+ *Ensures isolation*
  - One transaction cannot access data being modified by another transaction until the lock is released.
+ *Prevents lost updates*
  - Ensures that one transaction does not overwrite another transaction's changes.
+ *Supports serializability*
  - Proper locking can make concurrent transactions behave as if they were executed sequentially.
+ *Easy to understand and implement*
  - Locking provides a clear mechanism for controlling access to shared resources.

*Drawbacks*

+ *Deadlock*
  - Transactions at different sites may wait for each other's locks indefinitely.
+ *Blocking and waiting*
  - A transaction may have to wait for a lock, increasing response time.
+ *Communication overhead*
  - In distributed systems, lock requests and releases may require communication between different sites.
+ *Single point of failure*
  - If a centralized lock manager fails, transactions may be unable to obtain locks.
+ *Reduced concurrency*
  - Excessive locking can prevent transactions from executing simultaneously, reducing system performance.

 == 1. Two-Phase Commit (2PC)

2PC has two phases:

*Phase 1: Prepare / Voting*

- Coordinator asks all participants: "Can you commit?"
- Each participant replies:
  - YES → ready to commit
  - NO → cannot commit

*Phase 2: Commit / Abort*

- If all participants vote YES → coordinator sends COMMIT.
- If any participant votes NO → coordinator sends ABORT.
#image("../assets/image-8a.png",width: 30%)

== 2. Three-Phase Commit (3PC)

3PC adds an extra phase to reduce the blocking problem of 2PC.

The three phases are:

+ *CanCommit?*
  - Coordinator asks participants whether they can commit.
+ *PreCommit*
  - If everyone agrees, coordinator tells participants to prepare for commit.
+ *DoCommit*
  - Coordinator sends the final COMMIT command.
  #image("../assets/image-9a.png",width: 30%)
== Nested Transaction vs Distributed Transaction 
  #table(
  columns: 3,
  [*Basis*], [*Nested Transaction*], [*Distributed Transaction*],
  [*Meaning*], [Transaction divided into sub-transactions], [Transaction executed at multiple sites],
  [*Structure*], [Has *parent-child hierarchy*], [Usually coordinated among distributed sites],
  [*Location*], [Can execute within one system or across systems], [*Multiple nodes/sites* are involved],
  [*Main purpose*], [Break a complex transaction into smaller manageable units], [Maintain consistency across multiple sites],
  [*Failure handling*], [Failure can sometimes be handled at the sub-transaction level], [Requires coordination to commit or abort at all sites],
  [*Coordination*], [Parent transaction coordinates child transactions], [Coordinator coordinates participating sites],
  [*Example*], [Online order → payment, inventory, shipping as sub-transactions], [Bank transfer where accounts are stored at different servers],
  [*Protocols*], [Uses parent-child transaction management], [Often uses *2PC or 3PC*],
  [*Complexity*], [Complex due to transaction hierarchy], [Complex due to network and site failures],
)

= Deadlock & Distributed Deadlock 

=== 1. Deadlock

A deadlock is a situation where two or more processes/transactions wait indefinitely for resources held by each other.

*Example:*

`T1 → R2 → T2 → R1 → T1`

T1 holds R1 and waits for R2, while T2 holds R2 and waits for R1.
=== 2. Phantom Deadlock

A phantom deadlock is a false deadlock detected because the deadlock detection system receives old or delayed information.

*Example:*

T1 waits for T2, but before the detector checks, T2 completes and releases its resource. Due to delayed information, the detector still thinks T1 and T2 are deadlocked.

*Cause:* Communication delay and outdated state information.

=== 3. Solutions for Deadlock

+ *Deadlock Prevention* – Prevent at least one necessary condition of deadlock.
+ *Deadlock Avoidance* – Grant resources only when the system remains in a safe state.
+ *Deadlock Detection & Recovery* – Detect deadlocks and recover by aborting/rolling back transactions.
+ *Timeout* – Abort a transaction if it waits for a resource for too long.

=== 4. Distributed Deadlock Avoidance Methods

*A. Resource Ordering*

- Assign a fixed order to all resources.
- A transaction must request resources only according to that order.
- Prevents circular wait.

*Example:* R1 < R2 < R3

A transaction can request R1 → R2 → R3, but not R3 → R1.

*B. Banker's Algorithm*

- Checks whether granting a resource keeps the system in a safe state.
- If safe → resource is granted.
- If unsafe → request is delayed.

*Main idea:* Grant resources only if deadlock will not occur.

*C. Wait-Die Scheme*

Uses transaction timestamps.

- Older transaction waits for younger transaction.
- Younger transaction aborts (dies) when it requests a resource held by an older transaction.

*Remember:* Old waits, Young dies

*D. Wound-Wait Scheme*

Also uses timestamps.

- Older transaction aborts (wounds) the younger transaction holding the resource.
- Younger transaction waits for the older transaction.

*Remember:* Old wounds, Young waits


=== 1. Fault

A fault is the cause or defect that can lead to incorrect system behavior.

*Example:* A network cable is damaged or a server's hardware fails.

=== 2. Error

An error is an incorrect internal state of a system caused by a fault.

*Example:* Due to a faulty network connection, a server has incorrect or missing data.

=== 3. Failure

A failure occurs when the system does not provide the required service correctly to its users.

*Example:* A server crashes and does not respond to a client request.

== Detection and Recovery from Arbitrary Faults

Arbitrary faults (Byzantine faults) are the most difficult type of fault because a faulty process can behave in any way, including sending incorrect, conflicting, or misleading messages to different processes.

*How to detect arbitrary faults?*

Arbitrary faults are detected using agreement and redundancy:

+ *Replicate processes/data* — Keep multiple copies of the same service or data.
+ *Exchange information* — Processes communicate with each other and compare their received values.
+ *Majority voting* — If replicas give different results, the value supported by the majority is accepted.
+ *Detect inconsistent behavior* — If one replica repeatedly gives a different result from the others, it can be identified as faulty.

*How to recover?*

After detecting a faulty process:

+ Ignore the faulty replica and use correct replicas.
+ Restore from a correct replica/checkpoint.
+ Replace or restart the faulty process.
+ Reconfigure the system so that other processes continue working.
+ Use Byzantine Fault Tolerance (BFT) protocols to maintain agreement despite faulty processes.

*Example*

Suppose there are 4 replicas:

- R1 → 100
- R2 → 100
- R3 → 100
- R4 → 500 ❌

Since 3 replicas agree on 100, the system accepts 100 and treats R4 as faulty.

== Agreement in a Faulty System over a Reliable Channel

Agreement means that all non-faulty processes reach the same decision, even when some processes are faulty.

A reliable channel guarantees that a message sent by a correct process is eventually delivered correctly to the receiver. However, the sender itself may be faulty and may send different messages to different processes.

How is agreement achieved?

A common approach is Byzantine Agreement:

A leader/sender proposes a value.
The sender sends the value to all other processes through the reliable channel.
Processes exchange the values they received with one another.
Each process compares the received values.
Using a majority/agreement rule, all correct processes select the same value.
If the sender is faulty and sends different values, the correct processes use the values received from other correct processes to reach a common decision.
Example

Suppose there are 4 processes:

P1 sends "YES" to P2 and P3.
Because P1 is faulty, it sends "NO" to P4.
P2, P3, and P4 exchange their received information.
The correct processes identify the inconsistent value and use the agreed/majority value.

Thus, all correct processes make the same decision, despite the faulty process.