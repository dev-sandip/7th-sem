= Introduction To Computer Network

== Networking Model
+ *Client Server Model:*
    In this model, the client requests services and the server provides those services. The server is always on and waits for requests from clients. Examples include web servers, email servers, and database servers.

+ *Peer-to-Peer Model:*
    In this model, each node (peer) can act as both a client and a server. Peers share resources directly with each other without the need for a central server. Examples include file-sharing networks and decentralized applications.
== Active Network
Active nworks are networks that can perform computations on the data packets as they pass through the network. This allows for more dynamic and flexible networking, enabling features such as real-time data processing, adaptive routing, and enhanced security measures.

== Network Topology
Network topology refers to the arrangement of different elements (links, nodes, etc.) in a computer network. It defines how the devices are connected and how data flows between them. Common topologies include bus, star, ring, mesh, and hybrid topologies. Each topology has its own advantages and disadvantages in terms of performance, scalability, and fault tolerance.
+ *Bus Topology:* All devices are connected to a single central cable, called the bus. Data is transmitted in both directions along the bus. It is easy to install but can be slow and prone to collisions.
+ *Star Topology:* All devices are connected to a central hub or switch. Data passes through the hub before reaching its destination. It is easy to manage and troubleshoot, but if the hub fails, the entire network goes down.
+ *Ring Topology:* Devices are connected in a circular fashion, and data travels in one direction around the ring. It can be efficient for small networks but can be disrupted if one device fails.
+ *Mesh Topology:* Every device is connected to every other device in the network. It is highly reliable and provides multiple paths for data, but it can be complex and expensive to implement.

== Protocol and Standard

_Protocols_ are a set of rules and conventions that govern how data is transmitted and received over a network. They ensure that devices can communicate effectively, regardless of their underlying hardware or software. Examples of common protocols include TCP/IP, HTTP, FTP, and SMTP.
Protocol explains:
+ How is the physical network built.
+ How computers connect to the network.
+ How the data is formatted for transmission.
+ How the data is sent over the network.
+ How to deal with errors.

_Standards_ are agreed-upon specifications and guidelines that ensure interoperability between different devices and systems. They define how protocols should be implemented and provide a common framework for network communication. Standards are developed by organizations such as the IEEE, IETF, and ISO.


== Layered Architecture
Layered architecture is a design approach that divides the network communication process into distinct layers, each with specific functions and responsibilities. This modular approach simplifies network design, implementation, and troubleshooting. The most widely used layered architecture is the OSI (Open Systems Interconnection) model, which consists of seven layers:
+ *Physical Layer:* Responsible for the physical connection between devices, including cables, switches, and other hardware. It deals with the transmission of raw bits over a physical medium.
+ *Data Link Layer:* Provides error detection and correction, as well as framing of data packets and flow control. It ensures reliable communication between devices on the same network segment.
+ *Network Layer:* Responsible for routing data packets between devices across different networks. It handles logical addressing (IP addresses) and determines the best path for data to travel.
+ *Transport Layer:* Ensures end-to-end communication between devices, providing reliable data transfer, error recovery, and flow control. Protocols like TCP and UDP operate at this layer.
+ *Session Layer:* Manages sessions between applications, establishing, maintaining, and terminating connections as needed. It provides synchronization and dialog control for communication between applications.
+ *Presentation Layer:* Responsible for data translation, encryption, and compression. It ensures that data is presented in a format that can be understood by the receiving application, regardless of differences in data representation.
+ *Application Layer:* Provides network services directly to end-user applications, such as web browsers, email clients, and file transfer programs. It enables users to interact with the network and access resources and services.
 === TCP/IP Model
The TCP/IP model is a simplified, four-layered architecture that serves as the foundation for the Internet and most modern computer networks. It was developed by the U.S. Department of Defense and is designed to be robust, scalable, and adaptable to various networking environments. The four layers of the TCP /IP model are:
+ *Link Layer:* Corresponds to the physical and data link layers of the OSI model and is responsible for the physical transmission of data over a network medium. It includes protocols such as Ethernet and Wi-Fi, which define how devices connect and communicate on a local network. 
+ *Internet Layer:* Corresponds to the network layer of the OSI model and is responsible for logical addressing and routing of data packets across different networks. The primary protocol at this layer is the Internet Protocol (IP), which assigns unique IP addresses to devices and determines the best path for data to travel.
+ *Transport Layer:* Corresponds to the transport layer of the OSI model and is responsible for end-to-end communication between devices, ensuring reliable data transfer, error recovery, and flow control.
 + *Application Layer:* Corresponds to the session, presentation, and application layers of the OSI model and provides network services directly to end-user applications. It enables users to interact with the network and access resources and services through protocols such as HTTP, FTP, SMTP, and DNS.

 === Comparison between OSI and TCP/IP Model 

#table(
  columns: (1.5fr, 3fr, 3fr),
  fill: (x, y) => if y == 0 { rgb("e0e0e0") } else if calc.even(y) { rgb("f9f9f9") } else { none },
  stroke: 0.5pt + luma(120),
  align: (left, left, left),
  table.header(
    [*Parameter / Feature*],
    [*OSI Model*],
    [*TCP/IP Model*]
  ),
  [*Full Form*],
  [Open Systems Interconnection reference model.],
  [Transmission Control Protocol / Internet Protocol model.],
  
  [*Number of Layers*],
  [7 Layers (Application, Presentation, Session, Transport, Network, Data Link, Physical).],
  [4 or 5 Layers (Application, Transport, Internet, Network Access / Data Link + Physical).],
  
  [*Approach*],
  [Theoretical model developed as a generic, protocol-independent reference frame.],
  [Practical model built around real-world existing protocols (e.g., TCP, IP, UDP).],
  
  [*Development*],
  [Developed by ISO (International Organization for Standardization) in 1984.],
  [Developed by DARPA (Department of Defense) in the 1970s.],
  
  [*Application Layer Structure*],
  [Has distinct Application, Presentation, and Session layers.],
  [Combines Application, Presentation, and Session functions into a single Application layer.],
  
  [*Delivery Guarantee*],
  [Supports both Connection-Oriented and Connectionless services at Network layer.],
  [Supports only Connectionless service at the Internet layer (IP).],
  
  [*Transport Layer*],
  [Supports only Connection-Oriented service.],
  [Supports both Connection-Oriented (TCP) and Connectionless (UDP) services.],
  
  [*Protocol Dependence*],
  [Protocols are hidden and can be easily replaced as technology changes.],
  [Protocols are strictly defined and the model is heavily dependent on them.],
  
  [*Flexibility*],
  [Strict separation between services, interfaces, and protocols.],
  [Does not strictly separate services, interfaces, and protocols.],
  
  [*Usage*],
  [Used primarily as a teaching and reference guide.],
  [Used as the practical architecture of the modern Internet.]
)

=== Data Encapsulation
Data encapsulation is the process of adding layer-specific control headers (and trailers) to data as it moves down the network stack for transmission.

#v(0.5em)

#table(
columns: (1fr, 1.2fr, 2fr, 3fr),
fill: (x, y) => if y == 0 { rgb("e0e0e0") } else if calc.even(y) { rgb("f9f9f9") } else { none },
stroke: 0.5pt + luma(120),
align: (center, left, center, left),
table.header(
  [*Layer*],
  [*Data Unit (PDU)*],
  [*Added Information*],
  [*Primary Function*]
),
[1. Application], [Data], [—], [Generates the initial message/payload.],
[2. Transport], [Segment / Datagram], [Transport Header], [Adds port numbers, sequence numbers, and error control (TCP/UDP).],
[3. Network], [Packet], [Network Header], [Adds source/destination IP addresses for routing.],
[4. Data Link], [Frame], [Header & Trailer], [Adds MAC addresses, frame delimiters, and error detection (FCS).],
[5. Physical], [Bits], [—], [Converts frames into physical signals (electrical, optical, or RF).]
)

== Short Notes (4 Marks Each)

#v(0.5em)

+ *Internet*
  - *Definition:* A global, public network of interconnected computer networks operating on the standardized TCP/IP protocol suite.
  - *Architecture:* Built on a hierarchical model comprising Tier-1 service providers, Internet Exchange Points (IXPs), Regional ISPs, and end-user access networks.
  - *Key Components:* Employs packet switching, IP addressing (IPv4/IPv6), Domain Name System (DNS) for name resolution, and routing protocols like BGP.
  - *Applications:* Enables core digital services including the World Wide Web (HTTP/HTTPS), file transfer (FTP), email (SMTP/IMAP), and real-time communications.

+ *X.25*
  - *Definition:* An early ITU-T standard protocol suite designed for packet-switched Wide Area Networks (WANs) operating over unreliable analog media.
  - *Layer Alignment:* Functions across the lowest three OSI layers: Physical (X.21/RS-232), Link (LAPB), and Packet (PLP) layers.
  - *Core Characteristics:* Connection-oriented service using Virtual Circuits (VCs) with extensive hop-by-hop error checking and flow control.
  - *Limitations & Legacy:* Features heavy processing overhead and low data rates (up to 64 kbps); largely superseded by lighter protocols like Frame Relay and IP.

+ *Frame Relay*
  - *Definition:* A high-performance WAN protocol operating at the Data Link Layer (OSI Layer 2) designed for packet-switched communication over reliable digital lines.
  - *Mechanism:* Multiplexes traffic over permanent or switched virtual circuits (PVCs/SVCs) using Data Link Connection Identifiers (DLCIs).
  - *Key Features:* Strips out hop-by-hop error detection and packet ordering to achieve low latency, high throughput, and efficient bandwidth utilization.
  - *Congestion Management:* Handles network overload via Explicit Congestion Notification bits (FECN/BECN) and Discard Eligibility (DE) flags.

+ *Ethernet*
  - *Definition:* The dominant Local Area Network (LAN) technology defined under the IEEE 802.3 standard family.
  - *Layer Functions:* Defines physical media/signaling standards (OSI Layer 1) and Media Access Control (MAC) framing/addressing protocols (OSI Layer 2).
  - *Media Access:* Traditionally used CSMA/CD (Carrier Sense Multiple Access with Collision Detect); modern Ethernet uses full-duplex links over switches.
  - *Evolution:* Scaled from original 10 Mbps coaxial setups to 10/100/1000 Mbps and 10G/100G/400G over Twisted Pair and Optical Fiber.

+ *VoIP (Voice over Internet Protocol)*
  - *Definition:* A set of technologies for delivering voice communications and multimedia sessions over Internet Protocol (IP) networks.
  - *Operation:* Captures analog audio, digitizes and compresses it via audio codecs (e.g., G.711, G.729), and encapsulates it into IP packets.
  - *Protocols:* Utilizes signaling protocols (SIP, H.323) for session setup/teardown and Real-time Transport Protocol (RTP) for media delivery.
  - *Advantages & Challenges:* Highly cost-effective and flexible compared to traditional PSTN, but requires Quality of Service (QoS) mechanisms to minimize latency and jitter.

+ *NGN (Next Generation Network)*
  - *Definition:* A telecommunication architecture designed to transport all information (voice, data, video) by encapsulating it into IP packets.
  - *Core Concept:* Completely decouples the service/application layer from the underlying transport layer, replacing legacy PSTN/ISDN infrastructure.
  - *Features:* Provides generalized mobility, end-to-end Quality of Service (QoS), unrestricted access for users to competing service providers, and multi-service capability.
  - *Implementation:* Built on IP/MPLS core backbones, leveraging Softswitches and IP Multimedia Subsystem (IMS) for control and session management.

+ *MPLS (Multiprotocol Label Switching)*
  - *Definition:* A routing-independent data-forwarding mechanism operating between OSI Layer 2 and Layer 3 (often called "Layer 2.5").
  - *Working Mechanism:* Assigns short, fixed-length labels to packets at the ingress edge router; core routers forward packets based solely on these labels without inspecting the IP header.
  - *Key Benefits:* Enables high-speed packet forwarding, deterministic Traffic Engineering (TE), and efficient implementation of Layer 2/3 Virtual Private Networks.
  - *Protocol Independence:* Encapsulates packets from various network protocols (IP, Ethernet, Frame Relay, ATM) over a unified backbone.

+ *VPN (Virtual Private Network)*
  - *Definition:* A technology that extends a private network across a public network (like the Internet) by creating a secure, virtual point-to-point connection.
  - *Security Mechanisms:* Uses tunneling protocols (IPsec, OpenVPN, WireGuard, SSL/TLS) combined with strong encryption and authentication.
  - *Types:* Remote-Access VPNs (connecting individual users to a enterprise network) and Site-to-Site VPNs (connecting distinct branch offices).
  - *Core Benefits:* Ensures data confidentiality, integrity, and origin authentication while providing cost-effective secure communication.

+ *xDSL (Digital Subscriber Line)*
  - *Definition:* A family of technologies providing high-speed digital data transmission over existing local loop copper telephone infrastructure.
  - *Mechanism:* Utilizes high-frequency bands above standard voice spectrum (0–4 kHz) using advanced modulation schemes (e.g., DMT) to coexist with voice calls.
  - *Variants:* 
    - *ADSL:* Asymmetric bandwidth (higher download than upload), ideal for residential use.
    - *SDSL:* Symmetric bandwidth, tailored for business applications.
    - *VDSL/VDSL2:* Ultra-high speed over short copper distances (often coupled with fiber-to-the-cabinet).
  - *Significance:* Served as a major broadband transition technology, bridging legacy PSTN copper to IP networks.
