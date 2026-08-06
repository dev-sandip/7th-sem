#import "@preview/gentle-clues:1.2.0": *
= Data Link Layer

The Data Link Layer is the second layer in the OSI model and is responsible for node-to-node data transfer.

== Functions of the Data Link Layer
+ It provides a well-defined interface to the Network Layer above it.
+ It synchronizes frames for recognizing the start and end of the frame.
+ It deals with transmission errors.
+ It regulates the flow of data.
+ It provides a flow control mechanism to prevent a faster transmitter from overflowing a slower receiver.

== Framing

A frame is created by breaking down a stream of bits into smaller, digestible chunks.

*Why is Framing Needed?*
+ Separates the bit stream into identifiable units.
+ Adds addressing information (e.g., MAC addresses).
+ Enables error detection.
+ Helps synchronize the sender and receiver.
+ Supports flow control.

A frame consists of the following parts:
+ *Header:* Contains the source and destination addresses of the frame.
+ *Payload:* Contains the actual data to be transmitted.
+ *Trailer:* Contains the error detection and correction bits.

=== Framing Methods

==== Character Count
The character count framing method uses a field in the frame header to specify the number of characters (or bytes) in the entire frame, including the count field itself. When the data link layer at the destination reads this count, it knows exactly how many characters follow and can determine where the frame ends.

#figure(
  image("../../assets/image-1.png", width: 80%),
  caption: [Character Count Framing Method],
)

*Example: Error in Count Field* \
If the count field in Frame 2 gets corrupted from 5 to 7:
- *Frame 1:* Correctly received with `count = 5`, data = `[1, 2, 3, 4]`.
- *Frame 2:* Incorrectly interpreted with `count = 7`, reading `[5, 6, 7, 8, 6, 9]` (taking data from the next frame).
- *Frame 3:* Starts with remaining data, causing complete desynchronization.

==== Flag Bytes with Byte Stuffing
In this method, frames begin and end with special bytes called *flags*. Flags used at the start and end of a frame are often identical. During transmission, if the receiver gets lost, it simply looks for a pair of flags to determine the frame boundaries.

#figure(
  table(
    columns: (1fr, 1fr),
    align: (horizon + left, horizon + left),
    fill: (col, row) => if row == 0 { rgb("eef2f7") } else { none },
    [*Original Data*], [*After Byte Stuffing*],
    [`A, Flag, B`], [`A, ESC, Flag, B`],
    [`A, ESC, B`], [`A, ESC, ESC, B`],
    [`A, ESC, Flag, B`], [`A, ESC, ESC, ESC, Flag, B`],
    [`A, ESC, ESC, B`], [`A, ESC, ESC, ESC, ESC, B`],
  ),
  caption: [Byte Stuffing Transformations],
)

==== Starting and Ending Flags with Bit Stuffing
In this method, frames begin and end with special bit patterns called *flags*. The most common flag pattern used is `01111110`.

To ensure that the flag pattern does not appear inside the payload data, the sender uses a technique called *bit stuffing*:
- *Sender:* Whenever five consecutive `1`s are encountered in the data stream, a `0` bit is automatically inserted immediately after them.
- *Receiver:* Upon detecting five consecutive `1`s followed by a `0`, the receiver strips the stuffed `0` bit to restore the original data stream.

This mechanism guarantees that the sequence `01111110` can only occur at genuine frame boundaries.

#figure(
  table(
    columns: (auto, 1fr),
    align: (horizon + left, horizon + left),
    fill: (col, row) => if row == 0 { rgb("eef2f7") } else { none },
    [*Stage*], [*Bit Sequence*],
    [Original Data], [`01001111110111110`],
    [After Bit Stuffing], [`010011111` *`0`* `1011111` *`0`* `0`],
  ),
  caption: [Bit Stuffing Frame Example],
)

== Error Control

Error control is the process of detecting and correcting errors that may occur during data transmission. Error control in the data link layer is based upon the principle of Automatic Repeat reQuest (ARQ) for missing, lost, or damaged frames.

=== ARQ Protocols

+ *Stop-and-Wait ARQ:*
  In this method, the sender transmits one frame, stops until it receives confirmation from the receiver, and then sends the next frame.

  *Key Mechanisms:*
  - *Frame Retention:* For retransmission, the sender maintains a copy of the transmitted frame until a valid acknowledgment (`ACK`) is received.
  - *Sequence Numbers:* Sequence numbers alternate strictly between `0` and `1` so the receiver can distinguish between a newly arrived frame and a retransmitted frame:
    1. The sender transmits the frame with sequence number `0` and waits for an `ACK`.
    2. If `ACK` is received, the sender transmits the next frame with sequence number `1`.
    3. If `ACK` is not received within a specified timeout period, the sender retransmits frame `0`.
    4. The `ACK` number sent is the next expected sequence number. For example, if frame `0` is received successfully, the receiver responds with `ACK 1`, indicating it expects frame `1` next.
  - *Window Sizes:* The window size for both sender ($W_s$) and receiver ($W_r$) is $1$:
    $ W_s = 1, quad W_r = 1 $
  - *Synchronization:* The sender sends only one frame at a time, and the receiver receives only one frame at a time. Both entities must wait for each other to process and acknowledge transmission.

  #figure(
    image("/assets/image-2.png", width: 45%),
    caption: [Stop-and-Wait ARQ Protocol Operation],
  )

  #warning(title: "Efficiency")[
    While simple to implement, Stop-and-Wait ARQ is inefficient because the channel sits idle during the round-trip propagation delay ($T_p$) while waiting for acknowledgments.
  ]

+ *Go-Back-N ARQ:*
  Go-Back-N ARQ is an error control protocol based on *sliding window flow control*.

  *Key Mechanisms:*
  - *Pipelined Transmission:* The sender can transmit multiple frames sequentially up to a maximum window size ($W_s$) without waiting for an immediate acknowledgment.
  - *Explicit Frame Numbering:* Both acknowledgments (`ACK`) and negative acknowledgments (`NAK`) are explicitly numbered:
    - *`ACK` (Cumulative):* Carries the sequence number of the *next* frame expected by the receiver, implicitly acknowledging all previous frames.
    - *`NAK`:* Identifies a specific lost or damaged frame requiring immediate retransmission.
  - *Go-Back-N Retransmission:* If a frame is lost, damaged, or its timer expires, the sender retransmits *that frame and all subsequent frames* sent after the last acknowledged frame (i.e., it "goes back $N$" frames).

  #figure(
    table(
      columns: (1fr, 1fr),
      align: (horizon + left, horizon + left),
      fill: (col, row) => if row == 0 { rgb("eef2f7") } else { none },
      [*Parameter*], [*Value / Condition*],
      [Sender Window Size ($W_s$)], [$W_s = N = 2^m - 1$ ($m$ sequence bits)],
      [Receiver Window Size ($W_r$)], [$W_r = 1$ (No buffering for out-of-order frames)],
      [Out-of-Order Frames], [Discarded by receiver],
    ),
    caption: [Go-Back-N ARQ Window Parameters],
  )

  #info(title: "Receiver Behavior")[
    Because the receiver window size is $1$, it only accepts frames in strict sequential order. If frame $k$ is missing, all subsequent valid frames ($k+1, k+2, \....$) are discarded, forcing the sender to retransmit the entire batch starting from frame $k$.
  ]
+ *Selective Repeat ARQ:*
  Unlike Go-Back-N ARQ where an entire batch of frames is retransmitted upon error, *Selective Repeat ARQ* retransmits *only* the specific damaged or lost frames. This minimizes unnecessary retransmissions and optimizes channel bandwidth usage.

* Key Mechanisms & Operational Differences:*

Selective Repeat ARQ differs fundamentally from Go-Back-N in four major ways:

1. *Receiver Sorting & Out-of-Order Processing:* The receiver contains sorting logic to reorder frames. Valid frames received out of order (after a frame is lost) are accepted and held in the receiver's buffer.
2. *Buffering Requirements:* The receiver must maintain a buffer large enough to store all out-of-order valid frames until the missing/damaged frame is successfully retransmitted and received.
3. *Sender Selective Subsystem:* The sender must have a search and retrieval subsystem mechanism to identify and retransmit *only* the specific frame requested via a `NAK` or timed-out frame, without resetting the entire window.
4. *Explicit ACKs & NAKs:* Uses individual acknowledgments (`ACK`s) and negative acknowledgments (`NAK`s) for specific frame sequence numbers.

#v(0.5em)

#figure(
  table(
    columns: (1.2fr, 1fr, 1.2fr),
    align: (horizon + left, horizon + left, horizon + left),
    fill: (col, row) => if row == 0 { rgb("eef2f7") } else { none },
    [*Parameter*], [*Go-Back-N ARQ*], [*Selective Repeat ARQ*],
    [Sender Window ($W_s$)], [$W_s = 2^m - 1$], [$W_s = 2^(m-1)$],
    [Receiver Window ($W_r$)], [$W_r = 1$], [$W_r = 2^(m-1)$],
    [Out-of-Order Frames], [Discarded], [Buffered & Sorted],
    [Retransmission Scope], [Entire batch from lost frame], [Only the lost/damaged frame],
  ),
  caption: [Comparison between Go-Back-N and Selective Repeat ARQ],
)

#warning(title: "Window Size Constraint")[
  To avoid sequence number ambiguity between original and retransmitted frames, the sum of the sender and receiver windows must not exceed the sequence number space ($2^m$):
  $ W_s + W_r <= 2^m $
  Typically, the window sizes are set equal:
  $ W_s = W_r = 2^(m-1) $
]

#tip(title: "Efficiency Trade-off")[
  While Selective Repeat ARQ is significantly more efficient than Go-Back-N over high-error or long-delay links, it requires more complex hardware and memory logic at both the sender and receiver ends to manage out-of-order buffering and selective retransmission lists.
]

== Error Detection

Error detection mechanisms allow the receiver to determine whether transmitted data has been corrupted during transit.

=== Types of Errors

+ *Content Error:* An error affecting the payload or bit values within the message.
+ *Flow Integrity Error:* Occurs when a frame or packet is delivered to an unintended destination address.
+ *Single-Bit Error:* Exactly one bit of the given data unit is changed from `0` to `1` or `1` to `0`.
+ *Burst Error:* Two or more non-consecutive or consecutive bits in the data unit are changed.
+ *Multiple-Bit Error:* Multiple independent bits across the message frame are corrupted.

=== Error Detection Techniques

+ *Parity Check:*
  A simple error detection scheme that appends a single extra bit (parity bit) to the data block to make the total count of `1`s either even (even parity) or odd (odd parity).
  - *Even Parity Example:* If the data contains an even number of `1`s, a parity bit of `0` is appended. If the count of `1`s is odd, a parity bit of `1` is appended to force the total count of `1`s to remain even.

+ *Checksum:*
  A method in which the binary data is divided into equal-sized blocks (e.g., 16-bit units). The sender computes the 1's complement sum of these blocks and appends the result as a checksum field. The receiver performs the same summation over the received data including the checksum; a result of all `1`s indicates valid data.

+ *Cyclic Redundancy Check (CRC):*
  A robust polynomial-based error detection mechanism. The binary message is treated as a polynomial $M(x)$ and divided by a predefined generator polynomial $G(x)$ using modulo-2 arithmetic. The remainder of this division forms the CRC frame check sequence (`FCS`), which is appended to the message. The receiver divides the entire incoming frame by $G(x)$; a non-zero remainder indicates corrupted data.

== Error Correction

Error correction is the process of detecting and restoring corrupted bits back to their original state without requiring explicit retransmission. In computer networks, error correction is performed using two fundamental approaches:

+ *Forward Error Correction (FEC):*
  The sender adds redundant error-correcting code bits to the data prior to transmission. The receiver uses these extra bits to identify and correct bit flips locally without contacting the sender. Common FEC techniques include Hamming codes, Reed-Solomon codes, and convolutional codes.

+ *Backward Error Correction (ARQ):*
  The receiver detects transmission errors and relies on retransmission requests (Automatic Repeat reQuest) to obtain a clean copy of the frame. Examples include Stop-and-Wait ARQ, Go-Back-N ARQ, and Selective Repeat ARQ.


- *Hamming Codes*: Hamming code is a method of error detection and correction that can detect up to two-bit errors and correct one-bit errors. It uses parity bits placed at specific positions in the data to create a code word. The receiver can use these parity bits to identify and correct single-bit errors in the received data. 

== Flow Control

*Flow control* is a set of procedures that tells the sender how much data it can transmit before waiting for an acknowledgment from the receiver. It prevents a fast sender from overwhelming a slow receiver with data, which would otherwise result in buffer overflow and frame loss.

=== Primary Flow Control Protocols

Flow control mechanisms are generally categorized into two main protocols:

==== 1. Stop-and-Wait Flow Control
In *Stop-and-Wait*, the sender transmits a single frame and waits for an acknowledgment (`ACK`) from the receiver before sending the next frame.

- *Sender Action:* Sends one frame, stops, and waits for `ACK`.
- *Receiver Action:* Receives the frame and returns an `ACK` to signal readiness for the next frame.
- *Window Sizes:* Both sender ($W_s$) and receiver ($W_r$) window sizes are equal to $1$:
  $ W_s = 1, quad W_r = 1 $

#figure(
  image("/assets/image-2.png", width: 45%),
  caption: [Stop-and-Wait Flow Control Sequence],
)

#warning(title: "Efficiency Limitation")[
  Stop-and-Wait is very inefficient over high bandwidth-delay product (`BDP`) links. Because the sender must wait a full Round-Trip Time ($R T T$) for every single frame, the channel bandwidth remains largely underutilized.
]

==== 2. Sliding Window Flow Control
In *Sliding Window*, the sender can transmit multiple frames up to a pre-agreed window size ($W$) before needing an acknowledgment. As acknowledgments arrive, the sender's window "slides" forward, allowing additional frames to be sent continuously.

- *Sender Window ($W_s$):* Holds frames that have been sent but not yet acknowledged, plus frames ready to be sent.
- *Receiver Window ($W_r$):* Holds valid frames that the receiver is eligible to accept.
- *Pipelining:* Allows continuous frame transmission, significantly increasing channel utilization ($eta$).
#figure(
  image("/assets/image-3.png", width: 45%),
  caption: [Sliding Window Flow Control Sequence],
)
#figure(
  table(
    columns: (1fr, 1.2fr, 1.2fr),
    align: (horizon + left, horizon + left, horizon + left),
    fill: (col, row) => if row == 0 { rgb("eef2f7") } else { none },
    [*Property*], [*Stop-and-Wait*], [*Sliding Window*],
    [Sender Window ($W_s$)], [$1$], [$N > 1$],
    [Receiver Window ($W_r$)], [$1$], [$1$ (Go-Back-N) or $N$ (Selective Repeat)],
    [Transmission], [Sequential (One by one)], [Pipelined (Multiple in flight)],
    [Channel Utilization], [Very Low], [High],
  ),
  caption: [Comparison of Flow Control Methods],
)


#warning(title:"Study From Book")[
Examples of Data Link Layer protocols include:
+ HDLC (High-Level Data Link Control)
+ PPP (Point-to-Point Protocol)
]

== Medium Access Sub Layer 
Network Link can be divided into two sublayers: the Logical Link Control (LLC) sublayer and the Media Access Control (MAC) sublayer. The MAC sublayer is responsible for controlling how devices in a network gain access to the medium and permission to transmit data.

== Channel Allocation Problem
In a shared medium, multiple devices compete for access to the communication channel. The *channel allocation problem* arises when multiple devices attempt to transmit simultaneously, leading to collisions and degraded network performance.\ 
*Types*:
+ *Static Channel Allocation:* Each device is assigned a fixed portion of the channel's bandwidth, which can lead to inefficiencies if some devices are idle while others are overloaded.
+ *Dynamic Channel Allocation:* Devices dynamically request access to the channel based on demand, allowing for more efficient use of the available bandwidth but requiring more complex coordination mechanisms to avoid collisions.

== Multiple Access Protocol
It is used to control/coordinate access to the link or link in a shared connection . Nodes can regulate their transmission within the shared broadcast channel by using multiple access protocols. The main goal of these protocols is to avoid collisions and ensure fair access to the medium for all devices.


== Random Access Protocols

In *Random Access Protocols* (also known as contention-based protocols), no single station is designated to control transmission, nor is there a scheduled order. Any node can transmit whenever it has data ready to send.

- *Collision:* If two or more stations transmit simultaneously, their signals collide on the shared medium, rendering the data garbled and unusable.
- *Backoff:* When a collision occurs, each involved station waits for a random period (backoff time) before attempting to retransmit to avoid colliding again.

#info(title: "Traffic Sensitivity")[
  Random access protocols are simple to implement and highly efficient under *low traffic* conditions. However, as network traffic increases, collision rates rise dramatically, reducing overall throughput.
]



=== ALOHA Protocol

It is the earliest random access method. It was designed for radio LAN but is also applicable for shared medium.In this method multiple station can transmit data at the same time and can hence lead to collision and data being garbled.

ALOHA exists in two main variants: *Pure ALOHA* and *Slotted ALOHA*.

==== 1. Pure ALOHA

Pure ALOHA is a continuous-time MAC protocol. Stations are completely uncoordinated and transmit frames whenever data becomes available.

*Working Principle:*
1.*Immediate Transmission:* A station transmits a frame immediately as soon as it is generated, without checking if the channel is clear.
2. *Acknowledgment (ACK):* After sending, the sender waits for an ACK from the receiver.
3. *Collision Detection:* If no ACK arrives within a designated timeout period, the sender assumes a collision occurred.
4. *Random Backoff:* The sender waits for a random time interval and retransmits the frame.

#warning(title: "Vulnerable Period")[
  In Pure ALOHA, a frame is vulnerable to collisions during a time interval equal to twice the frame transmission time ($2 times T_f$). A collision occurs if any other station starts transmitting during or just before the frame's transmission window.
]

==== 2. Slotted ALOHA

Slotted ALOHA was introduced to overcome the high collision probability of Pure ALOHA by introducing *time synchronization*.

*Working Principle:*
1. *Time Slots:* The shared channel's timeline is divided into discrete, equal-sized time intervals called *slots*, where each slot equals the frame transmission time ($T_f$).
2. *Synchronized Transmission:* Stations cannot transmit at any arbitrary time. A station can only begin transmitting a frame at the *beginning of a time slot*.
3. *Collision Handling:* If two stations attempt to transmit at the start of the same time slot, a collision occurs. Both stations detect the failure and wait a random number of time slots before trying again.

#tip(title: "Key Improvement")[
  By forcing transmissions to align with slot boundaries, the vulnerable period is halved to a single frame time ($T_f$). This reduces the collision window significantly and effectively doubles the maximum achievable network throughput compared to Pure ALOHA.
]


=== CSMA(Carrier Sense Multiple Access)
