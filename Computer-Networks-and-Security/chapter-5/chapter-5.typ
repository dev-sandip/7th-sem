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

== Addresses
=== Physical Address
The physical address are the unique identifiers assigned to network interfaces for communications on the physical network segment. They are also known as MAC (Media Access Control) addresses and are typically represented as a 48-bit hexadecimal number. Physical addresses are used for communication within a local area network (LAN) and are essential for the proper functioning of network protocols.
=== Logical Address
Logical addresses are used to identify devices on a network and facilitate communication between them. They are typically assigned by network administrators or dynamically assigned by protocols such as DHCP (Dynamic Host Configuration Protocol). Logical addresses are hierarchical and can be divided into network and host portions, allowing for efficient routing of data across different networks. The most common type of logical address is the IP (Internet Protocol) address, which can be either IPv4 (32-bit) or IPv6 (128-bit).

=== Port Address
Port addresses are used to identify specific processes or services running on a device. They are part of the transport layer addressing scheme and allow multiple applications to share a single physical or logical address. Port numbers are 16-bit unsigned integers, ranging from 0 to 65535, and are divided into three categories: well-known ports (0-1023), registered ports (1024-49151), and dynamic/private ports (49152-65535). Well-known ports are assigned to common services such as HTTP (port 80) and FTP (port 21), while registered and dynamic ports can be used by applications for temporary communication.


=== Application Specific Addresses
Application-specific addresses are unique identifiers used by applications to facilitate communication and data exchange. These addresses can be in the form of URLs (Uniform Resource Locators), email addresses, or other application-specific identifiers that allow users and devices to access specific resources or services. Application-specific addresses are often used in conjunction with logical and port addresses to ensure that data is delivered to the correct application or service on a device.

== Connection Establishment and Termination

