= Introduction to IPV6
IPV6 is the latest version of the Internet Protocol (IP) that is designed to replace the current version, IPv4. It was developed to address the limitations of IPv4, such as the exhaustion of available IP addresses and the need for improved security and performance.

IPV6 uses a _128-bit address space_, which allows for a significantly larger number of unique IP addresses compared to the 32-bit address space used by IPv4. This expansion provides ample room for the growing number of devices connected to the internet, including smartphones, tablets, and IoT devices.
== Advantages of IPV6
+ *Larger Address Space*: IPV6 provides a vastly larger address space, allowing for more unique IP addresses and accommodating the increasing number of devices connected to the internet.
+ *Better Header Format*: IPV6 has a simplified header format compared to IPv4, which improves routing efficiency and reduces the processing overhead for routers.
+ *Possibility of Extension*: IPV6 allows for the possibility of extension headers, which can be used to add additional information to packets without affecting the core header structure. This flexibility enables future protocol enhancements and new features.
+ *Reduction in Routing Table Size*: IPV6's hierarchical addressing structure allows for more efficient routing, reducing the size of routing tables and improving overall network performance.
+ *Support for More Security*: IPV6 includes built-in support for IPsec, a suite of protocols that provides secure communication over IP networks. This enhances the security of data transmission and protects against various types of attacks.
+ *Support for Resource Allocation*: IPV6 provides better support for resource allocation, allowing for more efficient utilization of network resources and improved Quality of Service (QoS).
+ *Support for Multicast*: IPV6 includes native support for multicast, which allows for efficient delivery of data to multiple recipients simultaneously. This is particularly useful for applications such as video streaming and online gaming.

In conclusion, IPV6 is a significant advancement over IPv4, addressing the limitations of the previous version and providing a more robust and scalable solution for the growing demands of the internet. Its larger address space, improved header format, and support for security and resource allocation make it a crucial technology for the future of networking. As the adoption of IPV6 continues to grow, it will play a vital role in enabling the continued expansion and evolution of the internet, ensuring that it can accommodate the increasing number of connected devices and the ever-growing demand for data and services.

== IPV6 Header Format
#table(
  columns: (1fr, 2fr, 5fr),
  stroke: 0.5pt + luma(120),
  fill: (x, y) => if y == 0 { rgb("e0e0e0") } else { none },
  align: center + horizon,
  
  [*Bits 0-3*], [*Bits 4-11*], [*Bits 12-31*],
  
  [Version], [Traffic Class], [Flow Label],
  

  [Payload Length], [Next Header], [Hop Limit],
  
  [#table.cell(colspan: 3)[Source IP Address (128 bits)]],
  [#table.cell(colspan: 3)[Destination IP Address (128 bits)]],
    [#table.cell(colspan: 3)[Payload (Variable Length)]]
)
#table(
  columns: (1.5fr, 3.5fr),
  stroke: 0.5pt + luma(180),
  fill: (x, y) => if y == 0 { rgb("eef2f7") } else { none },
  align: top + left,

  [*Field*], [*Description*],

  [*Version*], [Identifies the IP version (always set to `6`).],
  [*Traffic Class*], [Sets packet priority for QoS (e.g., prioritizing voice/video over basic data).],
  [*Flow Label*], [Groups related packets into a single flow for identical handling by routers.],
  [*Payload Length*], [Indicates the total size of the data/payload (in bytes) following the header.],
  [*Next Header*], [Specifies the next header type (e.g., extension header or TCP/UDP).],
  [*Hop Limit*], [Decrements by 1 at each router; drops the packet at `0` to prevent infinite loops.],
  [*Source IP*], [The 128-bit address of the sending device.],
  [*Destination IP*], [The 128-bit address of the receiving device.],
  [*Payload*], [The actual application or layer data being transmitted.]
)
== Comparision of IPV4 and IPV6 Header Formats
IPV6 Header Format:
#table(
  columns: (1fr, 2fr, 5fr),
  stroke: 0.5pt + luma(120),
  fill: (x, y) => if y == 0 { rgb("e0e0e0") } else { none },
  align: center + horizon,
  
  [*Bits 0-3*], [*Bits 4-11*], [*Bits 12-31*],
  
  [Version], [Traffic Class], [Flow Label],
  

  [Payload Length], [Next Header], [Hop Limit],
  
  [#table.cell(colspan: 3)[Source IP Address (128 bits)]],
  [#table.cell(colspan: 3)[Destination IP Address (128 bits)]],
    [#table.cell(colspan: 3)[Payload (Variable Length)]]
)
IPV4 Header Format:
#table(
  columns: (1fr, 1fr, 2fr, 4fr),
  stroke: 0.5pt + luma(120),
  fill: (x, y) => if y == 0 { rgb("e0e0e0") } else { none },
  align: center + horizon,
  
  // Row 0: Bit Ruler (4 columns total: 1 + 1 + 2 + 4 = 8 relative ratio units)
  [*Bits 0-3*], [*Bits 4-7*], [*Bits 8-15*], [*Bits 16-31*],
  
  // Row 1
  [Version], [IHL], [Type of Service], [Total Length],
  
  // Row 2: Fix applied (Flags = 1 col, Fragment Offset = 1 col with colspan: 2)
  [Identification], [Flags], [#table.cell(colspan: 2)[Fragment Offset]],
  
  // Row 3
  [TTL], [Protocol], [#table.cell(colspan: 2)[Header Checksum]],
  
  // Rows 4-6: Spanning across all 4 columns
  [#table.cell(colspan: 4)[Source IP Address (32 bits)]],
  [#table.cell(colspan: 4)[Destination IP Address (32 bits)]],
  [#table.cell(colspan: 4)[Options + Padding (Optional)]]
)
#table(
  columns: (2fr, 2.5fr, 2.5fr, 3fr),
  stroke: 0.5pt + luma(180),
  fill: (x, y) => if y == 0 { rgb("eef2f7") } else { none },
  align: top + left,

  [*Feature*], [*IPv4 Header*], [*IPv6 Header*], [*Key Difference*],

  [*Header Size*],
  [Variable: 20 to 60 bytes (depends on Options)],
  [Fixed: 40 bytes],
  [IPv6 has a predictable header size, speeding up router processing.],

  [*Address Size*],
  [32 bits (4 bytes)],
  [128 bits (16 bytes)],
  [IPv6 addresses are 4x larger in bit-width.],

  [*Traffic Priority*],
  [Type of Service (ToS) / DSCP],
  [Traffic Class],
  [Renamed function for Quality of Service (QoS).],

  [*Flow Control*],
  [None (handled higher in stack)],
  [Flow Label (20 bits)],
  [IPv6 natively tags packet streams for specialized routing.],

  [*Packet Lifetime*],
  [Time to Live (TTL)],
  [Hop Limit],
  [Renamed; both decrement by 1 per hop to prevent loops.],

  [*Protocol Identification*],
  [Protocol field],
  [Next Header field],
  [IPv6 uses Next Header to chain extension headers or TCP/UDP.],

  [*Checksum*],
  [Header Checksum (recomputed at every hop)],
  [None (removed)],
  [IPv6 relies on Layer 2 and Layer 4 checksums to increase routing speed.],

  [*Fragmentation*],
  [Handled by routers and hosts (Identification, Flags, Offset)],
  [Handled *only* by the sending host (via Extension Headers)],
  [Routers no longer fragment IPv6 packets, reducing router load.],

  [*Options*],
  [Included directly in the base header],
  [Moved to optional Extension Headers],
  [Keeps the base IPv6 header streamlined.]
)

== Differences Between IPV4 and IPV6
#table(
  columns: (1fr, 1fr),
  stroke: 0.5pt + luma(180),
  fill: (x, y) => if y == 0 { rgb("eef2f7") } else { none },
  align: top + left,

  [*IPv4*], [*IPv6*],

  [32-bit address length], [128-bit address length],
  
  [Dotted decimal format \ _(e.g., 192.168.1.1)_], [Hexadecimal format \ _(e.g., 2001:db8::1)_],
  
  [~4.3 billion total addresses], [~$3.4 times 10^(38)$ total addresses],
  
  [Variable header size (20–60 bytes)], [Fixed header size (40 bytes)],
  
  [Requires manual or DHCP setup], [Supports auto-config (SLAAC)],
  
  [IPsec security is optional], [IPsec security is built-in],
  
  [Header checksum recalculated per hop], [No header checksum (faster routing)],
  
  [Routers can fragment packets], [Only sending host fragments packets],
  [Checksum field is available],[No checksum field]

)

== Extension Headers in IPV6
IPV6 introduces the concept of extension headers, which allow for additional information to be included in packets without affecting the core header structure. Extension headers are optional and can be used to provide additional functionality, such as routing, fragmentation, and security. Each extension header has a specific purpose and can be chained together to create a flexible and extensible packet structure. The use of extension headers allows for future protocol enhancements and new features to be added without requiring changes to the core header format, ensuring that IPV6 remains adaptable to evolving networking requirements.
It's types are:
+ _*Hop-by-Hop Options Header*_: This header is used for options that need to be processed by every router along the packet's path. It can include information such as routing instructions or special handling requirements.
+ _*Destination Options Header*_: This header is used for options that are only relevant to the destination node. It can include information such as security parameters or application-specific data.
+ _*Routing Header*_: This header is used to specify a list of intermediate nodes that the packet should traverse before reaching its final destination. It allows for more complex routing scenarios and can be used for traffic engineering or load balancing.
+ _*Fragmentation Header*_: This header is used to handle packet fragmentation and reassembly. It allows large packets to be broken into smaller fragments for transmission and then reassembled at the destination.
+ _*Authentication Header (AH)*_: This header is used to provide authentication and integrity for the packet. It ensures that the packet has not been tampered with during transit and verifies the identity of the sender.
+ _*Encapsulating Security Payload (ESP)*_: This header is used to provide confidentiality, integrity, and authentication for the packet. It encrypts the payload and provides secure communication between the sender and receiver, protecting against eavesdropping and tampering.

== Transitioning from IPv4 to IPv6

Moving the entire internet from IPv4 to IPv6 cannot happen overnight. Because the two protocols cannot talk to each other directly, network engineers use three main strategies to bridge the gap during the transition period:

=== 1. Dual Stack (Run Both Side-by-Side)
Dual stack is the simplest and most reliable approach. Devices, routers, and servers are configured to run *both IPv4 and IPv6 at the same time*.
* *How it works:* If a website supports IPv6, the device connects using IPv6. If the website only supports IPv4, it automatically falls back to IPv4.
* *Best for:* Modern networks upgrading hardware while keeping legacy compatibility.

#align(center)[
  #image("/assets/image-15.png", width: 80%)
]

=== 2. Tunneling (Wrap IPv6 inside IPv4)
Tunneling allows two IPv6 networks to communicate with each other across an older, IPv4-only network.
* *How it works:* An IPv6 packet is encapsulated ("wrapped") inside a standard IPv4 packet at the entry router, sent across the IPv4 internet, and then unpacked at the destination router.
* *Common Techniques:*
  - *6to4:* Automatically connects IPv6 sites over an IPv4 network.
  - *Teredo:* Allows IPv6 devices behind an IPv4 NAT router to connect to the IPv6 internet.
  - *GRE / Manual Tunnels:* Direct point-to-point tunnels configured between specific network routers.

#align(center)[
  #image("/assets/IPV6Network1.png", width: 100%)
]

=== 3. Translation (Translate Between Protocols)
Translation converts IPv6 traffic into IPv4 traffic (and vice versa) so that IPv6-only devices can talk directly to IPv4-only servers.
* *How it works:* A middle device changes the packet headers on the fly similar to a language interpreter.
* *Key Tools:*
  - *NAT64:* Translates IPv6 packet headers into IPv4 headers so IPv6-only clients can reach IPv4 servers.
  - *DNS64:* Works alongside NAT64 by creating fake IPv6 addresses for websites that only have IPv4 addresses.

#v(0.5em)

#block(
  fill: rgb("f9f9f9"),
  inset: 10pt,
  radius: 4pt,
  stroke: 0.5pt + luma(200)
)[
  #text(weight: "bold")[Summary of Strategies:]
  - *Dual Stack:* Use both protocols simultaneously (Preferred method).
  - *Tunneling:* Hide IPv6 inside IPv4 to carry it across legacy networks.
  - *Translation:* Convert IPv6 packets to IPv4 when an IPv6-only device must talk to an IPv4-only device.
]

== IPv6 Addressing Types Explained Simply

Unlike IPv4, which sends messages to everyone on a network whether they want it or not (broadcasting), IPv6 uses three smart communication methods to deliver data efficiently:

+ *Unicast (One-to-One Delivery)*:
Unicast is the most common form of network communication. It represents a direct, private line between one sender and one specific receiver.

  + *Real-World Analogy:* Sending a personal letter or text message to a friend's exact home address.
    - *How it works:* Every device on an IPv6 network gets a unique unicast address. When you send data to that address, only that specific device processes it.
    - *Common Uses:* 
      - Opening a website on your browser.
      - Sending a private email.
      - Downloading a file from a server.

+ *Multicast (One-to-Many Delivery)*:
Multicast delivers a single message to a specific group of devices that have agreed to receive it, without wasting network bandwidth on devices that didn't ask for it.

  -  *Real-World Analogy:* A television or radio broadcast station. Only people who tune their receivers to that specific station get the signal, while everyone else's radio ignores it.
  -  *How it works:* Instead of sending 100 separate copies of a video to 100 different users, the sender transmits *one* copy to a group multicast address. Network routers duplicate the data only where necessary to reach all group members.
  - *Common Uses:* 
    - Live video streaming (like watching a sports event live online).
    - Video conferencing with multiple participants.
    - Router software updates sent to all routers on a network at once.

+ *Anycast (One-to-Nearest Delivery)*:
Anycast assigns the exact same IP address to multiple servers spread across different global locations. The network automatically routes your request to whichever server is closest to you.

  - *Real-World Analogy:* Dialing an emergency services number like 911 or 112. Everyone dials the same number, but your call is automatically routed to the call center physically closest to your location.
  - *How it works:* When you send a request to an Anycast address, internet routers analyze the network path and deliver your packet to the "nearest" server (measured by lowest latency or shortest hop distance). If that server goes offline, traffic automatically redirects to the next closest server.
  - *Common Uses:* 
    - Content Delivery Networks (CDNs) to load web pages instantly from a local edge server.
    - Domain Name System (DNS) servers like Google DNS (`8.8.8.8`) or Cloudflare (`1.1.1.1`).

#v(0.5em)

#block(
  fill: rgb("f9f9f9"),
  inset: 10pt,
  radius: 4pt,
  stroke: 0.5pt + luma(200)
)[
  #text(weight: "bold")[Why IPv6 completely removed Broadcast:]
  In IPv4, "Broadcast" forced every single computer on a network to open and inspect every packet, even if it wasn't meant for them. IPv6 replaces Broadcast with specialized *Multicast* groups, saving processor power and network bandwidth.
]

== IPV6 Multicasting
In IPV6, multicasting is a method of sending a single packet to multiple destinations simultaneously. It is more efficient than broadcasting because it only delivers the packet to devices that have explicitly joined a multicast group, rather than sending it to all devices on the network.

Multicast addresses in IPV6 are identified by a specific prefix (FF00::/8), which indicates that the address is reserved for multicast communication. Devices that want to receive multicast traffic must join the appropriate multicast group by subscribing to the corresponding multicast address. This allows for efficient use of network resources and reduces unnecessary traffic on the network.


* Explain ISATAP and 6 to 4 tunneling with their address format for IPv4 to IPv6 transition.*


The transition from IPv4 to IPv6 relies heavily on automatic tunneling mechanisms like 6to4 tunneling and ISATAP to allow IPv6 packets to traverse existing IPv4 network infrastructure. 

6to4 tunneling is designed to connect isolated IPv6 site networks over the public IPv4 internet. When an IPv6 packet reaches a boundary router, the router automatically encapsulates the entire IPv6 packet inside a standard IPv4 header and routes it across the IPv4 network to the destination border router, which removes the IPv4 header and forwards the original packet. For this mechanism to function, the edge router must possess a static, globally routable public IPv4 address. The 128-bit 6to4 IPv6 address format is constructed automatically by combining a fixed 16-bit prefix of 2002 with the router's 32-bit public IPv4 address converted into hexadecimal format, creating a 48-bit prefix. This is followed by a 16-bit local subnet identifier and a 64-bit interface identifier for the host device. For example, if a boundary router has a public IPv4 address of 192.0.2.4, converting each octet into hexadecimal yields C002:0204, resulting in a generated 6to4 network prefix of 2002:C002:0204::/48.

On the other hand, Intra-Site Automatic Tunnel Addressing Protocol, commonly known as ISATAP, is designed specifically for internal enterprise local area networks rather than inter-site communication over the public internet. ISATAP treats an entire local IPv4 network as a virtual link layer, enabling individual dual-stack host machines to generate an IPv6 address and communicate with each other over an IPv4-only local network infrastructure. Unlike 6to4 tunneling, ISATAP works seamlessly with private IPv4 addresses behind network address translation routers. The 128-bit ISATAP IPv6 address format consists of a standard 64-bit network prefix—which can be a global unicast prefix or a link-local prefix starting with FE80—combined with a special 64-bit interface identifier. This 64-bit interface identifier contains the fixed reserved value 0000:5EFE in its first 32 bits to indicate an ISATAP link, followed by the host's 32-bit local IPv4 address in hexadecimal format. For instance, a host machine with a private IPv4 address of 10.1.1.5 converts its IPv4 address to 0A01:0105 in hexadecimal, yielding a link-local ISATAP address of FE80::0000:5EFE:0A01:0105.

While both protocols automate the encapsulation of IPv6 packets within IPv4 headers, they serve fundamentally distinct roles in network migration. 6to4 tunneling operates primarily at the perimeter on border routers to bridge geographically separated IPv6 networks using public IPv4 addresses and the reserved 2002 prefix. Conversely, ISATAP operates directly on individual end-host devices within a local intranet, utilizing private IPv4 addresses and embedding the reserved 5EFE identifier to enable host-to-host and host-to-router IPv6 connectivity across legacy local networks.



*IPv4 and IPv6 coexistence" what does this mean?*

*IPv4 and IPv6 coexistence* simply means allowing both versions of the Internet Protocol to live and work together on the internet at the same time.

Because IPv4 and IPv6 are like two completely different languages, an IPv4 computer cannot directly talk to an IPv6 computer. Since we cannot upgrade the entire world to IPv6 overnight, we need them to "coexist" peacefully during the transition.

* How do they coexist?*

Engineers use three main tricks to make them work together without breaking the internet:

+ *Dual-Stack (Speaking Both Languages)* \
  Devices and routers are set up to understand *both* IPv4 and IPv6 at the same time. If a website supports IPv6, the device uses that. If not, it falls back to IPv4. (Most modern phones and laptops do this).

+ *Tunneling (Putting a Letter in an Envelope)* \
  If two IPv6 networks are separated by an older IPv4 network, the IPv6 data is "wrapped" inside an IPv4 packet so it can safely cross the old network. \
  *(Note: ISATAP and 6to4 are examples of tunneling!)*

+ *Translation (Using an Interpreter)* \
  When an IPv6-only device *must* talk to an IPv4-only device, a special router sits in the middle and translates the packets from one language to the other (like a live translator).

