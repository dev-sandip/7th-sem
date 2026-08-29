#set text(font: "Charis SIL", size: 11pt, lang: "en")
#set par(justify: true)

= Fault Tolerance

*Fault* is a defect or problem in the hardware or software of a system.

*Error* is an incorrect internal state caused by a fault.

*Failure* occurs when the system cannot provide its required service.

*Fault tolerance* is the ability of a system to continue working
correctly even when some components fail.

=== K-Fault Tolerant System

A system is called *k-fault tolerant* if it can continue operating
correctly even when at most *k faults* occur.

*Example:* A 3-fault tolerant system can continue working even if
three components fail.

=== Fault, Error and Failure

#table(
  columns: 2,
  [*Term*], [*Simple Meaning*],

  [*Fault*], [A defect or problem in a system component.],
  [*Error*], [An incorrect state caused by a fault.],
  [*Failure*], [The system cannot provide its required service.],
)

=== Dependability Requirements

A fault-tolerant system should provide:

- *Availability*: The system remains accessible when needed.
- *Reliability*: The system performs correctly for a required period.
- *Maintainability*: The system can be repaired or restored easily.
- *Safety*: Failures should not cause unacceptable damage.

== Types of Failures

+ *Crash Failure*: A process stops working completely.

+ *Omission Failure*: A process fails to send or receive a message.

+ *Timing Failure*: A process responds too early or too late.

+ *Response Failure*: A process gives an incorrect response.

+ *Byzantine Failure*: A process behaves unpredictably and may send
  different or incorrect information to different processes.

== Failure Masking by Redundancy

Redundancy means keeping extra resources so that a failure does not
stop the system.

+ *Information Redundancy*: Keep extra copies of data.

+ *Time Redundancy*: Repeat an operation when it fails.

+ *Hardware Redundancy*: Use backup hardware such as extra servers.

== Fault Handling

Faults can be handled mainly using two recovery approaches:

+ *Forward Recovery*: The system moves from the faulty state to a
  new correct state without going back.

+ *Backward Recovery*: The system returns to a previously saved
  correct state and continues execution from there.

*Example:* Checkpointing is a common backward recovery technique.

== Distributed Recovery

*Distributed recovery* is the process of restoring a distributed
system to a consistent state after a failure.

=== Backward Recovery

Backward recovery rolls the system back to a previously saved
consistent state.

Common techniques are:

- Checkpointing
- Message logging
- Coordinated checkpointing
- Independent checkpointing

=== Forward Recovery

Forward recovery tries to correct the faulty state and continue
execution without rolling back.

*Example:* If an incorrect value is detected, the system may replace
it with a correct value and continue.

== Checkpointing

A *checkpoint* is a saved state of a process. If a failure occurs,
the process can restart from the saved state instead of starting
again from the beginning.

=== Independent Checkpointing

Each process takes checkpoints independently without coordinating with
other processes.

*Advantages:*
- Simple to implement.
- Processes can checkpoint at different times.

*Disadvantage:*
- May cause the *domino effect*, where one rollback causes other
  processes to roll back repeatedly.

=== Coordinated Checkpointing

All processes coordinate and take checkpoints together.

*Advantages:*
- Creates a consistent global state.
- Avoids the domino effect.
- Recovery is easier.

*Disadvantage:*
- Requires communication and coordination between processes.

=== Independent vs Coordinated Checkpointing

#table(
  columns: 2,
  [*Independent Checkpointing*], [*Coordinated Checkpointing*],

  [Processes take checkpoints independently.],
  [Processes coordinate before taking checkpoints.],

  [Less coordination is required.],
  [More communication is required.],

  [May cause the domino effect.],
  [Avoids the domino effect.],

  [Recovery is more difficult.],
  [Recovery is easier.],

  [No single consistent global checkpoint is guaranteed.],
  [Provides a consistent global checkpoint.],
)

== Message Logging

In *message logging*, messages sent and received by processes are
stored on stable storage.

If a process fails:

+ It restarts from its latest checkpoint.
+ Logged messages are replayed.
+ The process reaches its previous state.

This reduces the amount of work that must be repeated after failure.

== Chandy-Lamport Snapshot Algorithm

The *Chandy-Lamport Snapshot Algorithm* is used to record a consistent
global state of a distributed system.

A special message called a *MARKER* is used to record the local state
of each process and the state of communication channels.

=== Assumptions

- There are a finite number of processes.
- Processes do not share memory or a common clock.
- Communication channels are unidirectional.
- Channels are FIFO ordered.
- A communication path exists between processes.

=== Marker Sending Rule

When process P starts the snapshot:

+ P records its *local state*.
+ P sends a *MARKER* on every outgoing channel.
+ The marker is sent before any other message.

=== Marker Receiving Rule

When process Q receives a marker:

+ If Q has not recorded its state:
  - Q records its local state.
  - It records the incoming channel as empty.
  - Q sends markers on its outgoing channels.

+ If Q has already recorded its state:
  - Q records messages received on that channel after its state was
    recorded and before the marker arrived.

=== Uses of Snapshot

- *Checkpointing*: Saves a consistent state for recovery.
- *Deadlock Detection*: Helps detect distributed deadlocks.
- *Termination Detection*: Helps determine whether computation has ended.
- *Garbage Collection*: Helps identify unused objects.
- *Debugging*: Helps analyze the state of a distributed system.

== Byzantine Generals Problem

The *Byzantine Generals Problem* describes how distributed processes
can reach an agreement when some processes are faulty or behave
unpredictably.

*Example:* Several generals must agree to attack or retreat, but some
generals may be traitors and send false information.

The main goal is for all correct processes to reach the *same decision*
even when some processes are faulty.

=== Agreement in a Faulty System

To achieve agreement:

+ Processes exchange their proposed values.
+ Each process collects the values received from others.
+ Processes compare or vote on the received values.
+ A common value is selected according to the agreement rule.
+ All correct processes use the same final decision.

The communication channel should reliably deliver messages so that
messages are not lost or changed during transmission.

=== Basic Idea of Byzantine Agreement

A simple multi-round approach is:

+ Every process sends its value to other processes.
+ Processes collect the received values.
+ They exchange the collected information.
+ Each process applies the same decision rule.
+ Correct processes reach the same final decision.

*Important:* Byzantine faults are difficult because a faulty process
may send different information to different processes.

== Detecting and Recovering from Arbitrary Faults

An *arbitrary (Byzantine) fault* may produce unpredictable or
incorrect behavior.

=== Detection

- Compare the results received from multiple replicas.
- Use voting to identify the majority result.
- Use checksums or validation to detect incorrect data.
- Use heartbeat and monitoring mechanisms to detect abnormal behavior.

=== Recovery

- Ignore or isolate the faulty process.
- Use correct replicas to continue the service.
- Restore the process from a checkpoint.
- Replace the faulty component if necessary.
- Use replication and voting to mask the fault.

== Reliable Client-Server Communication

Reliable communication ensures that messages are delivered correctly
without unnecessary loss or duplication.

=== Handling Lost Requests

If the client does not receive a reply within a *timeout*, it
resends the request.

=== Handling Lost Replies

If the server completed the request but the reply was lost, the client
may resend the request.

The server uses a *request ID or sequence number* to detect the
duplicate and can send the previous result instead of executing the
operation again.

=== Acknowledgment

The receiver sends an *ACK (Acknowledgment)* to confirm that a message
was received.

=== Main Techniques

- *Timeouts*: Detect missing responses.
- *Retransmission*: Resend lost messages.
- *Sequence Numbers*: Detect duplicate messages.
- *Acknowledgments*: Confirm message delivery.
- *Duplicate Suppression*: Prevent the same request from being
  executed multiple times.

== Process Resilience

*Process resilience* is the ability of a distributed system to
continue working even when some processes fail.

A common approach is to group several identical processes together
into a *process group*.

If one process fails, another process in the group can continue its
work.

*Example:* A website runs on three servers. If one server fails, the
other servers continue handling client requests.

== High Availability through Replication

Replication improves fault tolerance and availability by maintaining
multiple copies of a service or data.

If one replica fails, another replica can continue providing the
service.

#table(
  columns: 2,
  [*Without Replication*], [*With Replication*],

  [One server failure may stop the service.],
  [Another replica can continue the service.],

  [Single point of failure.],
  [Multiple replicas provide redundancy.],

  [Limited fault tolerance.],
  [Better fault tolerance and availability.],
)
