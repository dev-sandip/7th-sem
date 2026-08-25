#set text(font: "Charis SIL", size: 11pt, lang: "en")
= Transport Layer
The transport layer is the fourth layer of the OSI model and is responsible for providing end-to-end communication services for applications. It ensures that data is delivered error-free, in sequence, and with no losses or duplications. The transport layer provides two main types of services: connection-oriented and connectionless.

== Services of Transport Layer
+ Process to process communication.
+ Addressing
+ Flow control and buffering.


== Services Provided to Upper Layer
The transport layer provides services to the upper layers (application layer) by ensuring that data is delivered reliably and efficiently. It offers the following services:
+ Segmentation and reassembly: The transport layer breaks down large messages into smaller segments for transmission
  and reassembles them at the receiving end.
+ Error detection and correction: It detects errors in the transmitted data and requests retransmission if necessary.
+ Connection management: The transport layer establishes, maintains, and terminates connections between applications.


=== Connection Oriented Services
Connection-oriented services provide a reliable communication channel between two devices. It establishes a connection before data transfer and ensures that data is delivered in the correct order. The most common protocol that provides connection-oriented services is the Transmission Control Protocol (TCP). TCP guarantees that data is delivered without errors, in sequence, and without duplication. It also provides flow control and congestion control mechanisms to manage the rate of data transmission and prevent network congestion.
=== Connectionless Services
Connectionless services, on the other hand, do not establish a connection before data transfer. Each data packet is sent independently, and there is no guarantee of delivery, order, or duplication. The most common protocol that provides connectionless services is the User Datagram Protocol (UDP). UDP is faster than TCP because it has less overhead, but it does not provide the same level of reliability. It is suitable for applications that can tolerate some data loss, such as streaming media or online gaming.

== User Datagram Protocol (UDP)
_UDP_ is a connectionless,unreliable transport level service protocol that provides a simple way to send datagrams over an IP network. It is used for applications that require low latency and can tolerate some data loss. UDP does not provide error checking or flow control, making it faster than TCP but less reliable.

The header of the UDP is given below:\
#pagebreak();

#let udp-header-table = align(center)[
  #table(
    columns: (1fr, 1fr),
    stroke: 0.8pt + luma(100),
    align: center + horizon,
    fill: (col, row) => {
      if row == 0 { rgb("f0f0f0") } // Bit header row
      else if row in (1, 2) { rgb("e3f2fd") } // Header fields
      else { rgb("fafafa") } // Application Data
    },

    // Bit header row
    [0 #h(1fr) 15], [16 #h(1fr) 31],

    // Header Fields
    [*Source Port* \ _(16 bits)_],
    [*Destination Port* \ _(16 bits)_],

    [*Length* \ _(16 bits)_],
    [*Checksum* \ _(16 bits)_],

    // Application Data spanning across both columns
    table.cell(colspan: 2)[
      #v(8pt)
      *Application Data* \
      _(Variable Length)_
      #v(8pt)
    ],
  )
]

#udp-header-table

+ *Source Port*: This field specifies the port number of the sending application. It is a 16-bit field that identifies the source of the datagram.
+ *Destination Port*: This field specifies the port number of the receiving application. It is a 16-bit field that identifies the destination of the datagram.
+ *Length*: This field specifies the total length of the UDP datagram, including the header and data. It is a 16 -bit field that indicates the size of the datagram in bytes.
+ *Checksum*: This field is used for error-checking of the header and data. It is a 16-bit field that helps ensure the integrity of the datagram during transmission. If the checksum value does not match the calculated value at the receiving end, the datagram is considered corrupted and discarded.
+ *Application Data*: This field contains the actual data being transmitted. The length of this field is variable and depends on the size of the data being sent. It can range from 0 to 65,535 bytes, but the total length of the UDP datagram (header + data ) cannot exceed 65,535 bytes.
=== Why is UDP Used Despite Being Unreliable?
UDP is considered an unreliable protocol because it does not guarantee the delivery of packets, their order, or error checking. However, it is still widely used on the Internet for several reasons:
1. *Low Latency*: UDP has lower overhead compared to TCP, making it faster and more suitable for real-time applications such as video streaming, online gaming, and VoIP (Voice over IP), where speed is more critical than reliability.
2. *Simplicity*: UDP is simpler to implement and requires fewer resources, making it ideal for applications that do not need the complexity of TCP's connection management and error recovery features.
3. *Broadcast and Multicast Support*: UDP supports broadcasting and multicasting, allowing a single packet to be sent to multiple recipients simultaneously. This is useful for applications like live video streaming and online multiplayer games.
4. *Application-Level Reliability*: Some applications implement their own reliability mechanisms on top of UDP, allowing them to handle packet loss and retransmissions as needed. This gives developers more control over how reliability is managed based on the specific requirements of their application.


== Transmission Control Protocol (TCP)
_TCP_ is a connection-oriented, reliable transport level service protocol that provides a robust way to send data over an IP network. It is used for applications that require guaranteed delivery of data, such as web browsing, email, and file transfers. TCP ensures that data is delivered in the correct order, without errors, and without duplication. It provides error checking, flow control, and congestion control mechanisms to manage the rate of data transmission and prevent network congestion.\
The header of the TCP is given below:\

#let tcp-header-table = align(center)[
  #block(width: 85%)[ // Controls overall width
    #set text(size: 8.5pt) // Reduces font size
    #table(
      columns: (1fr, 1fr, 1fr, 1fr),
      stroke: 0.6pt + luma(100),
      align: center + horizon,
      inset: 4pt,
      // Reduces internal padding
      fill: (col, row) => {
        if row == 0 { rgb("f0f0f0") } else if row in (1, 2, 3, 4, 5, 6) { rgb("e8f5e9") } else { rgb("fafafa") }
      },

      // Bit header row
      [0 #h(1fr) 7], [8 #h(1fr) 15], [16 #h(1fr) 23], [24 #h(1fr) 31],

      // Header fields
      table.cell(colspan: 2)[*Source Port* \ _(16 bits)_],
      table.cell(colspan: 2)[*Destination Port* \ _(16 bits)_],

      table.cell(colspan: 4)[*Sequence Number* \ _(32 bits)_],
      table.cell(colspan: 4)[*Acknowledgment Number* \ _(32 bits)_],

      [*Data Offset* \ _(4 bits)_],
      [*Reserved* \ _(6 bits)_ \ *Flags* _(6 bits)_],
      table.cell(colspan: 2)[*Window Size* \ _(16 bits)_],

      table.cell(colspan: 2)[*Checksum* \ _(16 bits)_],
      table.cell(colspan: 2)[*Urgent Pointer* \ _(16 bits)_],

      table.cell(colspan: 4)[*Options & Padding* \ _(0 to 320 bits)_],

      table.cell(colspan: 4)[
        #v(3pt)
        *Application Data* \
        _(Variable Length)_
        #v(3pt)
      ],
    )
  ]
]

#tcp-header-table

+ *Source Port*: This field specifies the port number of the sending application. It is a 16-bit field that identifies the source of the segment.
+ *Destination Port*: This field specifies the port number of the receiving application. It is a 16-bit field that identifies the destination of the segment.
+ *Sequence Number*: This field specifies the sequence number of the first byte of data in the segment. It is a 32-bit field that helps ensure that data is delivered in the correct order.
+ *Acknowledgment Number*: This field specifies the sequence number of the next byte of data that the sender expects to receive. It is a 32-bit field that helps ensure reliable delivery of data.
+ *Data Offset*: This field specifies the size of the TCP header in 32-bit words. It is a 4-bit field that indicates where the data begins in the segment.
+ *Reserved*: This field is reserved for future use and is set to zero. It is a 6-bit field that is not currently used.
+ *Flags*: This field contains control flags that indicate the state of the connection and control the flow of data. It is a 6-bit field that includes flags such as SYN, ACK, FIN, RST, PSH, and URG.
+ *Window Size*: This field specifies the size of the sender's receive window, which indicates how much data the sender is willing to accept. It is a 16-bit field that helps manage flow control.
+ *Checksum*: This field is used for error-checking of the header and data. It is a 16-bit field that helps ensure the integrity of the segment during transmission. If the checksum value does not match the calculated value at the receiving end, the segment is considered corrupted and discarded.
+ *Urgent Pointer*: This field specifies the offset from the current sequence number to the last urgent byte in the segment. It is a 16-bit field that indicates that certain data should be prioritized for processing.
+ *Options & Padding*: This field is used for optional parameters and padding to ensure that the header is a multiple of 32 bits. It can vary in length from 0 to 320 bits, depending on the options used.
+ *Application Data*: This field contains the actual data being transmitted. The length of this field is variable and depends on the size of the data being sent. It can range from 0 to 65,535 bytes, but the total length of the TCP segment (header + data) cannot exceed 65,535 bytes.

=== TCP Sliding Window
The TCP sliding window is a flow control mechanism that allows for efficient data transmission between a sender and receiver. It enables the sender to send multiple segments of data before needing an acknowledgment for the first segment. The size of the sliding window is determined by the receiver's advertised window size, which indicates how much data the receiver can accept at a given time. As the sender transmits data, the window "slides" forward, allowing for continuous data flow while ensuring that the receiver is not overwhelmed. This mechanism helps optimize network throughput and reduces the need for frequent acknowledgments, improving overall performance in data transmission.
=== TCP As Reliable Protocol
TCP is considered a reliable protocol because it provides mechanisms to ensure that data is delivered accurately and in the correct order. It uses sequence numbers to keep track of the order of packets, acknowledgments to confirm receipt of data, and retransmission of lost packets to ensure that all data is received. TCP also implements flow control to prevent overwhelming the receiving device and congestion control to manage network traffic. These features make TCP suitable for applications that require reliable data transfer, such as web browsing, email, and file transfers.
=== Difference between TCP and UDP
#align(center)[
  #table(
    columns: (1fr, 1fr),
    stroke: 0.6pt + luma(100),
    fill: (col, row) => {
      if row == 0 { rgb("f0f0f0") } else if calc.even(row) { rgb("fbfbfb") } else { white }
    },
    inset: 8pt,
    align: left + horizon,

    // Header Row
    [*TCP (Transmission Control Protocol)*], [*UDP (User Datagram Protocol)*],

    // Rows
    [Connection-oriented (requires 3-way handshake)], [Connectionless (no handshake required)],
    [Reliable delivery (guarantees packet arrival)], [Unreliable delivery (best-effort, lost packets dropped)],
    [Ordered delivery (packets arrive in exact sequence)], [Unordered delivery (packets may arrive out of order)],
    [Flow control and congestion control included], [No flow or congestion control],
    [Larger header size (20 to 60 bytes)], [Fixed small header size (8 bytes)],
    [Slower speed due to overhead and retransmissions], [Faster speed with minimal latency],
    [Heavyweight protocol (maintains connection state)], [Lightweight protocol (stateless)],
    [Error detection AND error recovery], [Error detection only (no recovery)],
    [Byte-stream oriented], [Datagram / message-oriented],
    [Used for Web (HTTP/HTTPS), File Transfer (FTP), Email (SMTP)],
    [Used for DNS, DHCP, Video Streaming, VoIP, Online Gaming],
  )
]

=== Why do you think that there exist two protocols in transport layer whereas there exists only one protocol in Internet layer in TCP/IP reference model.
The existence of two protocols in the transport layer (TCP and UDP) versus only one protocol in the Internet layer (IP) in the TCP/IP reference model can be attributed to the different requirements and functionalities of these layers. The Internet layer is primarily responsible for addressing and routing packets across networks, which is a fundamental and uniform requirement for all applications. Therefore, a single protocol (IP) suffices to handle these tasks. 
=== For the client-server application over TCP, why must the server program be executed before the client program?
In a client-server application over TCP, the server program must be executed before the client program because the server needs to be in a listening state, ready to accept incoming connection requests from clients. When a client attempts to establish a connection, it sends a SYN (synchronize) packet to the server. If the server is not running or not listening on the specified port, it will not respond to the client's request, resulting in a failed connection attempt. By starting the server first, it ensures that it is prepared to handle incoming connections and can successfully establish communication with clients.



== Addresses
=== Physical Address
The physical address are the unique identifiers assigned to network interfaces for communications on the physical network segment. They are also known as MAC (Media Access Control) addresses and are typically represented as a 48-bit hexadecimal number. Physical addresses are used for communication within a local area network (LAN) and are essential for the proper functioning of network protocols.
=== Logical Address
Logical addresses are used to identify devices on a network and facilitate communication between them. They are typically assigned by network administrators or dynamically assigned by protocols such as DHCP (Dynamic Host Configuration Protocol). Logical addresses are hierarchical and can be divided into network and host portions, allowing for efficient routing of data across different networks. The most common type of logical address is the IP (Internet Protocol) address, which can be either IPv4 (32-bit) or IPv6 (128-bit).

=== Port Address
Port addresses are used to identify specific processes or services running on a device. They are part of the transport layer addressing scheme and allow multiple applications to share a single physical or logical address. Port numbers are 16-bit unsigned integers, ranging from 0 to 65535, and are divided into three categories: well-known ports (0-1023), registered ports (1024-49151), and dynamic/private ports (49152-65535). Well-known ports are assigned to common services such as HTTP (port 80) and FTP (port 21), while registered and dynamic ports can be used by applications for temporary communication.
==== Why is it necessary to standardize the port numbers for well-known servers?
Standardizing port numbers for well-known servers is necessary to ensure interoperability and consistency across different systems and applications. When port numbers are standardized, clients and servers can communicate effectively without confusion or conflicts. For example, if a web server consistently uses port 80 for HTTP traffic, clients know to send requests to that port, allowing for seamless access to web services. Standardization also simplifies network configuration, troubleshooting, and security management, as administrators can easily identify and manage traffic associated with specific services based on their well-known port numbers.


=== Application Specific Addresses
Application-specific addresses are unique identifiers used by applications to facilitate communication and data exchange. These addresses can be in the form of URLs (Uniform Resource Locators), email addresses, or other application-specific identifiers that allow users and devices to access specific resources or services. Application-specific addresses are often used in conjunction with logical and port addresses to ensure that data is delivered to the correct application or service on a device.

== Connection Establishment and Termination
=== Establishment of Connection
Connection is established using a three-way handshake process, which involves the exchange of SYN (synchronize) and ACK (acknowledge) packets between the client and server. The steps are as follows:
+ The client sends a SYN packet to the server, indicating its desire to establish a connection.
+ The server responds with a SYN-ACK packet, acknowledging the client's request and indicating its willingness to establish a connection.
+ The client sends an ACK packet back to the server, confirming the establishment of the connection. Once the three-way handshake is complete, data can be transmitted between the client and server.
#image("/assets/image-11.png",width: 80%)

=== Termination of Connection
Connection termination is a process that involves the exchange of FIN (finish) and ACK (acknowledge) packets between the client and server. The steps are as follows:
+ The client sends a FIN packet to the server, indicating its desire to terminate the connection.
+ The server responds with an ACK packet, acknowledging the client's request to terminate the connection.
+ The server then sends its own FIN packet to the client, indicating its desire to terminate the connection.
+ The client responds with an ACK packet, acknowledging the server's request to terminate the connection. Once the exchange of FIN and ACK packets is complete, the connection is considered terminated, and both parties can release any resources associated with the connection.

#image("/assets/image-12.png",width: 80%)




=== TCP Synchronization
TCP synchronization is a process that ensures that both the sender and receiver are in sync regarding the sequence numbers of the data being transmitted. This is achieved through the use of the three-way handshake during connection establishment, where both parties exchange SYN and ACK packets to establish a common starting point for sequence numbers. 

== Flow Control And Buffering
Flow control is a mechanism used by the transport layer to manage the rate of data transmission between sender and receiver. It ensures that the sender does not overwhelm the receiver with too much data at once, which could lead to buffer overflow and data loss. Flow control is typically implemented using a sliding window protocol, where the sender can only send a certain amount of data before receiving an acknowledgment from the receiver.


=== How does the transport layer ensure that the complete message arrives at the destination and in the proper order?
Transport layer protocols, such as TCP, ensure that the complete message arrives at the destination and in the proper order through several mechanisms:
1. *Segmentation and Reassembly*: The transport layer breaks down large messages into smaller segments for transmission. Each segment is assigned a sequence number, which allows the receiver to reassemble the segments in the correct order, even if they arrive out of sequence.
2. *Acknowledgments*: The receiver sends acknowledgments back to the sender for each segment received. If the sender does not receive an acknowledgment within a certain time frame, it will retransmit the segment, ensuring that all segments are eventually received.
3. *Error Detection and Correction*: The transport layer uses checksums to detect errors in the transmitted data. If an error is detected, the receiver can request retransmission of the corrupted segment, ensuring that the complete message is received accurately.
4. *Flow Control*: The transport layer implements flow control mechanisms, such as the sliding window protocol, to manage the rate of data transmission. This prevents the sender from overwhelming the receiver and ensures that the receiver has enough buffer space to process incoming segments.
5. *Connection Management*: The transport layer establishes and maintains a connection between the sender and receiver  until the complete message has been successfully transmitted and acknowledged. This connection-oriented approach ensures that both parties are aware of the state of the communication and can handle any issues that arise during transmission.

== Congestion Control Algorithms
Congestion control algorithms are techniques used by the transport layer to prevent network congestion and ensure efficient data transmission. These algorithms monitor network conditions and adjust the rate of data transmission to avoid overwhelming the network. _Congestion _ occurs when the number of packtes  sent to the network is greater than the capacity of the network.
Some of the factors causing the congestion are :
+ Packet arrival rate exceeds the outgoing link capacity.
+ Insufficient memory to store arriving packets.
+ Brust Traffic: When a large number of packets arrive at the same time, it can cause congestion in the network.
+ Slow Processor.
=== Open Loop Congestion Control
Open loop congestion control is a proactive approach that aims to prevent congestion before it occurs. It involves implementing policies and mechanisms at the network design stage to minimize the likelihood of congestion. This can include traffic shaping, admission control, and resource allocation strategies that limit the amount of traffic entering the network. Open loop congestion control does not rely on feedback from the network and is typically used in networks where traffic patterns are predictable and can be managed effectively through design and planning.

=== Closed Loop Congestion Control
The closed-loop congestion control uses feedback or loop control is based on the following three steps:
+  After congestion occurs, detect the  congestion and look it by monitoring the system
+ Transfer the congestion information to places where action can be taken 
+ Adjust the system operation to correct the congestion.
== Traffic Shaping
_Traffic Shaping_ is the process of altering a traffic flow to avoid brust. It is a technique used to control the amount and rate of traffic sent into a network. Traffic shaping can be implemented using various methods, such as token bucket or leaky bucket algorithms, which regulate the flow of packets based on predefined parameters. By smoothing out traffic bursts and ensuring a consistent flow of data, traffic shaping helps prevent congestion, improve network performance, and maintain quality of service (QoS) for applications that require low latency and high reliability.

=== Leaky Bucket Algorithm
The leaky bucket algorithm is a traffic shaping mechanism that controls the rate at which packets are sent into a network. It works by maintaining a fixed-size bucket that leaks at a constant rate. When packets arrive, they are added to the bucket. If the bucket overflows (i.e., if the incoming packet rate exceeds the leak rate), excess packets are discarded, effectively controlling the flow of traffic. This algorithm helps to smooth out bursts of traffic and maintain a steady flow, preventing congestion and ensuring that the network can handle the traffic load. The leaky bucket algorithm is particularly useful for applications that require a consistent data rate, such as video streaming or VoIP, where sudden spikes in traffic can lead to packet loss and degraded performance.
#image("/assets/image-13.png")

=== Token Bucket Algorithm
The token bucket algorithm is another traffic shaping mechanism that controls the rate of data transmission in a network. It works by maintaining a bucket that holds tokens, which are generated at a fixed rate. Each token represents permission to send a certain amount of data (e.g., one packet). When a packet arrives, it can only be sent if there are enough tokens in the bucket. If there are not enough tokens, the packet must wait until tokens are available or be discarded if it exceeds the maximum waiting time. This algorithm allows for bursts of traffic up to a certain limit while ensuring that the average transmission rate does not exceed the specified limit. The token bucket algorithm is particularly effective for applications that require flexibility in handling variable traffic patterns while still maintaining overall control over the data flow.
#align(center,[#image("/assets/image-14.png",width: 80%)])
#table(
  columns: (1fr, 1fr),
  stroke: 0.5pt + luma(150),
  fill: (x, y) => if y == 0 { rgb("f0f0f0") } else { none },
  align: top + left,
  
  [*Leaky Bucket*], [*Token Bucket*],
  [Outputs packets at a strictly *constant* rate.], [Outputs packets at a *variable* rate.],
  [Completely eliminates traffic bursts.], [Allows short, controlled bursts of traffic.],
  [Does not store capacity during idle periods.], [Accumulates tokens during idle periods.],
  [Drops packets when the buffer queue overflows.], [Discards excess tokens when the bucket is full.],
  [Ideal for real-time traffic (e.g., VoIP, video streams).], [Ideal for bursty data (e.g., web browsing, APIs).]
)