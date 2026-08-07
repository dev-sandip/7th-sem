

= Physical Layer

Physical Layer is the lowest layer of the OSI model that communicates directly with the various types of actual communication media. This layer is responsible for sending and receiving bits from one device to another.

== Network Monitoring

+ *Bandwidth*: Bandwidth is the amount of data that passes through the network connection over time as measured in bits per second.
+ *Latency*: Latency is an expression of how much time it takes a packet of data to travel from one node to another. 
+ *Throughput*: _Throughput_ is the average rate of success full messages that a communication channel can deliver over a communication period.
+ *Delay*: The _delay_ of the network specifies how long it takes for a bit of data to travel across the network from one node to another.
+ *Processing Delay*: The time required to examine the packet header and determine where to direct the packet.
+ *Queuing Delay*: The time a packet spends waiting in routing queues.
+ *Transmission Delay*: It is the time required to transmit all packet bits into the link.
+ *Propagation Delay*: The time it takes for a signal to propagate from the sender to the receiver.

== Transmission Media 

_Transmission media_ is the physical path between the transmitter and receiver in a network. It can be classified into two categories:

- *Guided Media:* Guided media is a physical path that guides the data signals along a specific path.
- *Unguided Media:* Unguided media is a physical path that does not guide the data signals along a specific path. It is also known as wireless transmission.

=== Guided Media

Guided media is a physical path that guides the data signals along a specific path. It is also known as wired transmission. The most common types of guided media are:

+ *Twisted Pair Cable:* Twisted pair cable consists of pairs of insulated copper wires twisted together.

  The applications of _twisted pair cable_ are:
  + Most common transmission media for telephone and data communications.
  + Used in telephone networks house and local exchange.
  + Used for communication within buildings.

  Transmission charactersistics of _twisted pair cable_ are:
  + Requires amplifiers every 5-6 km for analog signal.
  + Requires repeaters every 2-3 km for digital signal.
  + Sussceptible to electromagnetic interference (EMI) and crosstalk.

  The advantages of _twisted pair cable_ is :
  + Easy to work with and install.
  + Well established technology.
  + Inexpensive.

  The disadvantages of _twisted pair cable_ is :
  + Sussceptible to electromagnetic interference (EMI) and crosstalk.
  + Limited bandwidth. 
  + Distance Limitation.
  + Low data rate.
  + Requires more expensive hubs.

  It is widely used for telephone and data communications. There are two types of twisted pair cables :

  - *Unshielded Twisted Pair (UTP):* UTP cables are the most common type of twisted pair cables. They are inexpensive and easy to install. However, they are susceptible to electromagnetic interference (EMI) and crosstalk.

    The applications of UTP cables are:
    + Used in telephone networks.
    + IN DSL Lines
    + IN LANs

    *Advantages:*:
    + Inexpensive and easy to install.
    + Widely available.

    *Disadvantages:*:
    + Susceptible to electromagnetic interference (EMI) and crosstalk.
    + Limited bandwidth and distance.

  - *Shielded Twisted Pair (STP):* STP cables have an additional shielding layer that protects against EMI and crosstalk. They are more expensive than UTP cables but provide better performance in noisy environments.

    *Advantages*:
    + Better performance at higher data rate.
    + Eliminates crosstalk.
    + Comparatively faster.

    *Disadvantages*:
    + More expensive than UTP cables.
    + Bulky
+ *Coaxial Cable:* Coaxial cable consists of a central conductor, an insulating layer, a metallic shield, and an outer insulating layer. It is used for high-frequency signals and provides better shielding against EMI.

  The applications of _coaxial cable_ are:
  + Used in cable television (CATV) networks.
  + Used in broadband internet connections.
  + Used in local area networks (LANs).

  Transmission characteristics of _coaxial cable_ are:
  + Higher bandwidth than twisted pair cables.
  + Less susceptible to EMI and crosstalk.
  + Can carry signals over longer distances without amplification.

  The advantages of _coaxial cable_ are:
  + Better shielding against EMI and crosstalk.
  + Higher bandwidth and data rates.
  + Can carry signals over longer distances.

  The disadvantages of _coaxial cable_ are:
  + More expensive than twisted pair cables.
  + Bulkier and less flexible.

+ *Optical Fiber Cable*:
Optical fiber cable uses light to transmit data and consists of a core, cladding, and protective outer layer. It provides very high bandwidth and is immune to electromagnetic interference.

  The applications of _optical fiber cable_ are:
  + Used in long-distance telecommunications.
  + Used in high-speed internet connections.
  + Used in medical imaging and industrial applications.

  Transmission characteristics of _optical fiber cable_ are:
  + Extremely high bandwidth.
  + Immune to electromagnetic interference (EMI).
  + Can transmit data over long distances without significant loss.

  The advantages of _optical fiber cable_ are:
  + Very high data rates and bandwidth.
  + Immune to EMI and crosstalk.
  + Can cover long distances without signal degradation.

  The disadvantages of _optical fiber cable_ are:
  + More expensive than copper cables.
  + Requires specialized equipment for installation and maintenance.
  Following are the types of optical fiber cables:
  + *Single-mode fiber (SMF):* SMF has a small core diameter and allows only one mode of light to propagate. It is used for long-distance communication.
  + *Multi-mode fiber (MMF):* MMF has a larger core diameter and allows multiple modes of light to propagate. It is used for shorter distance communication.

=== Unguided Media
Unguided media is a physical path that does not guide the data signals along a specific path. It is also known as wireless transmission. The most common types of unguided media are:
+ * Radio Waves:* Radio waves are electromagnetic waves that can travel through the air and are used for wireless communication. They can cover long distances and penetrate through obstacles.

  The applications of _radio waves_ are:
  + Used in AM and FM radio broadcasting.
  + Used in television broadcasting.
  + Used in mobile communication (cellular networks).
  + Used in Wi-Fi networks.

  The advantages of _radio waves_ are:
  + Can cover long distances.
  + Can penetrate through obstacles.
  + Suitable for mobile communication.

  The disadvantages of _radio waves_ are:
  + Susceptible to interference from other electronic devices.
  + Limited bandwidth compared to wired media.
+ *Microwaves:* Microwaves are high-frequency electromagnetic waves that are used for point
-to-point communication. They require line-of-sight between the transmitter and receiver.

  The applications of _microwaves_ are:
  + Used in satellite communication.
  + Used in radar systems.
  + Used in point-to-point communication links.

  The advantages of _microwaves_ are:
  + Can carry large amounts of data.
  + Suitable for long-distance communication.
  + Can be used for both terrestrial and satellite communication.

  The disadvantages of _microwaves_ are:
  + Requires line-of-sight between transmitter and receiver.
  + Susceptible to weather conditions (rain, fog).
  
  Following are the types of microwave transmission:
  + *Terrestrial Microwave:* Terrestrial microwave communication uses microwave frequencies to transmit data between two fixed locations on the Earth's surface. It requires line-of-sight and is commonly used for point-to -point communication links.
  + *Satellite Microwave:* Satellite microwave communication uses satellites to relay microwave signals between two locations on the Earth's surface. It allows for long-distance communication without the need for line-of-sight between the transmitter and receiver.

+ *Infrared Waves:* Infrared waves are electromagnetic waves with wavelengths longer than visible light but shorter than microwaves. They are used for short-range communication and require line-of-sight between the transmitter and receiver.

  The applications of _infrared waves_ are:
  + Used in remote controls for televisions and other electronic devices.
  + Used in short-range wireless communication (e.g., IrDA).
  + Used in some wireless computer peripherals (e.g., keyboards, mice).

  The advantages of _infrared waves_ are:
  + Suitable for short-range communication.
  + Immune to radio frequency interference.
  + Can be used in secure communication systems.

  The disadvantages of _infrared waves_ are:
  + Requires line-of-sight between transmitter and receiver.
  + Limited range compared to other wireless media.


==== Propagation Method 
+ *Ground Wave Progagation:* Ground wave propagation is a method of radio wave propagation that follows the curvature of the Earth. It is used for long-distance communication at low frequencies (LF) and medium frequencies (MF). Distance depends upon the amount of signal.
//Attach figure here
+ *Sky Wave Propagation:* Sky wave propagation is a method of radio wave propagation that uses the ionosphere to reflect radio waves back to the Earth's surface. It is used for long-distance communication at high frequencies (HF). Distance depends upon the amount of signal.
+ *Line of Sight Propagation:* Line of sight propagation is a method of radio wave propagation that requires a clear line of sight between the transmitter and receiver. It is used for high-frequency (VHF, UHF) and microwave communication. Distance depends upon the height of the antennas and the curvature of the Earth.
=== Satellite
A _satellite_ is an artificial object placed in orbit around the Earth to facilitate communication. It receives signals from a ground station, amplifies them, and retransmits them back to another ground station. Satellites are used for long-distance communication, television broadcasting, and internet connectivity.
   
   The transmitter-receiver communication in the satellite is known as _transponder_. The transponder receives the uplink signal from the ground station, amplifies it, and retransmits it back to the ground station as a downlink signal.
   Following are the types of satellites:
    + *Geostationary Satellite (GEO):* GEO satellites orbit the Earth at an altitude of approximately 35,786 kilometers (22,236 miles) and remain fixed relative to a specific point on the Earth's surface. They are used for television broadcasting, weather monitoring, and long-distance communication.
    + *Medium Earth Orbit Satellite (MEO):* MEO satellites orbit the Earth at altitudes between 2,000 and 35,786 kilometers (1,243 to 22,236 miles). They are used for navigation systems (e.g., GPS) and some communication applications.
    + *Low Earth Orbit Satellite (LEO):* LEO satellites orbit the Earth at altitudes between 160 and 2,000 kilometers (99 to 1,243 miles). They are used for Earth observation, scientific research, and some communication applications (e.g., satellite internet constellations like Starlink).




== Switching
 _ Switching_ is the process to forward packets coming from one port to another port leading towards destination.
 When data comes on a port it is called _ingress_ and when it leaves the port it is called _egress_. 

=== Types of Switching
+ *Circuit Switching:* 
  Circuit Switching establishes a dedicated path between sender and receiver before communication, using the full network bandwidth. Data flows without delay, and bit delay remains constant. While it guarantees a fixed data rate, it is costly and inefficient for high-traffic or large networks due to reserved resources.
  
  + Bandwidth is divided into pieces.
  + Bit delay is constant during communication.
  + Data can flow without delay once the circuit is established.
  The circuit switch network operated in three phase:
  + *Set up Phase:* In this phase, a dedicated path is established between the sender and receiver. The network resources are reserved for the duration of the communication.
  + *Data Transfer Phase:* In this phase, data is transmitted between the sender and receiver over
  + *Terminate Phase:* In this phase, the dedicated path is released, and the network resources are freed for other communications.
+ *Message Switching:* 
  Message Switching stores the entire message at an intermediate node before forwarding it to the next node. It does not require a dedicated path, and messages are sent in their entirety. However, it can introduce delays due to storage and processing at intermediate nodes.
  
  + No dedicated path is required.
  + Messages are sent in their entirety.
  + Can introduce delays due to storage and processing.
+ *Packet Switching:*
  Packet Switching divides messages into smaller packets, which are sent independently through the network. Each packet may take different paths to reach the destination, where they are reassembled. It is efficient and allows for better utilization of network resources, but can introduce variable delays and requires mechanisms for packet reassembly and error handling. There are two approaches of packet within packet switching:
  + *Datagram Switching:* In the datagram approach, each packet is treated independently, and packets may take different paths to reach the destination. This approach is similar to sending letters through the postal system, where each letter may take a different route to reach the recipient.

  + *Virtual Circuit Switching:* In the virtual circuit approach, a logical path is established between the sender and receiver before data transmission. All packets follow the same path, ensuring that they arrive in order. This approach is similar to making a phone call, where a dedicated line is established for the duration of the call.

  *Comparision Between Datagram Approach and Virtual Circuit Approach:*
#table(
  columns: (1.5fr, 3fr, 3fr),
  fill: (x, y) => if y == 0 { rgb("e0e0e0") } else if calc.even(y) { rgb("f9f9f9") } else { none },
  stroke: 0.5pt + luma(120),
  align: (left, left, left),
  table.header(
    [*Parameter / Feature*],
    [*Datagram Approach (Connectionless)*],
    [*Virtual Circuit Approach (Connection-Oriented)*]
  ),
  [*Connection Setup*],
  [Not required. Packets are transmitted immediately.],
  [Required. A connection setup phase is mandatory before data transmission.],
  
  [*Packet Routing*],
  [Each packet is routed independently based on destination address.],
  [All packets follow the pre-established fixed path (Virtual Circuit).],
  
  [*Packet Path*],
  [Packets may take different paths to reach the destination.],
  [All packets follow the exact same route.],
  
  [*Addressing*],
  [Every packet contains full source and destination IP addresses.],
  [Packets carry a short Virtual Circuit Identifier (VCI) instead of full destination address.],
  
  [*State Information*],
  [Routers do not hold state information about individual connections.],
  [Routers maintain connection state table for each active virtual circuit.],
  
  [*Packet Arrival Order*],
  [Packets may arrive out of order at the destination.],
  [Packets always arrive in the correct sequence.],
  
  [*Effect of Node Failure*],
  [Robust. If a router/node fails, subsequent packets can be rerouted.],
  [Vulnerable. If a router/node along the circuit fails, the connection terminates.],
  
  [*Resource Allocation*],
  [Dynamic / On-demand. No dedicated bandwidth or buffer reservation.],
  [Resources (bandwidth, buffers) can be reserved in advance.],
  [Congestion Control],
  [Difficult to manage as traffic flows unpredictably.],
  [Easier to manage via connection admission control.],
  
  [*Overhead*],
  [High per-packet overhead due to full headers.],
  [Low per-packet overhead, but initial setup delay exists.],
  
  [*Protocol Examples*],
  [IP (Internet Protocol), UDP],
  [X.25, Frame Relay, ATM, MPLS]
)

== Multiplexing
_Multiplexing_ is a technique that allows multiple signals or data streams to share the same communication channel or medium. It increases the efficiency of the communication system by allowing multiple users to transmit data simultaneously over a single physical medium.

=== Types of Multiplexing
+ *Frequency Division Multiplexing (FDM):* FDM divides the available bandwidth of a communication channel into multiple frequency bands, each carrying a separate signal. Each user is assigned a unique frequency band, and the signals are transmitted simultaneously. FDM is commonly used in radio and television broadcasting and in telephone networks.

+ *Time Division Multiplexing (TDM):* TDM divides the available time on a communication channel into time slots, with each user assigned a specific time slot for transmission. The signals are transmitted in rapid succession, one after the other, allowing multiple users to share the same channel. TDM is commonly used in digital communication systems, such as digital telephony and data networks.

+ *Wavelength Division Multiplexing (WDM):* WDM is a technique used in optical fiber communication that divides the available wavelength spectrum into multiple channels, each carrying a separate signal. Each user is assigned a unique wavelength, and the signals are transmitted simultaneously over the same optical fiber. WDM is commonly used in high-capacity optical networks.

== Hierarchy in Digital Telephony

=== T1 Carrier System 
_T1 Carrier System_ is a digital transmission system used in North America and Japan for transmitting voice and data over telephone lines. It operates at a data rate of 1.544 Mbps and can carry 24 voice channels or data channels simultaneously. 
=== E1 Carrier System
_E1 Carrier System_ is a digital transmission system used in Europe and other parts of the world for transmitting voice and data over telephone lines. It operates at a data rate of 2.048 Mbps and can carry 32 voice channels or data channels simultaneously. 

== ISDN (Integrated Services Digital Network)
_ISDN_ is a set of communication standards for simultaneous digital transmission of voice, video, data , and other network services over traditional telephone networks. It provides end-to-end digital connectivity and allows for faster and more reliable communication compared to analog systems.
=== ISDN Components
+ *TE1* : Terminal Equipment Device Type 1 (TE1) is a digital device that connects directly to the ISDN network. It can be a telephone, computer, or any other device that supports ISDN communication.
+ *TE2* : Terminal Equipment Device Type 2 (TE2) is an analog
  device that requires a terminal adapter (TA) to connect to the ISDN network. It can be a traditional telephone, fax machine, or any other analog device.

+ *TA* : Terminal Adapter (TA) is a device that converts analog signals from TE2 devices into digital signals for transmission over the ISDN network. It also converts digital signals from the ISDN network back into analog signals for TE2 devices.

+ *NT1* : Network Termination Type 1 (NT1) is a device that connects the ISDN network to the customer's premises. It provides the interface between the ISDN network and the customer's equipment, such as TE1 and TE2 devices.

+ *NT2* : Network Termination Type 2 (NT2) is a device that provides additional network functions, such as switching, multiplexing, and concentration. It is typically used in larger ISDN installations to manage multiple connections and provide advanced features.

+ *ISDN Switch:* The ISDN switch is a central component of the ISDN network that manages the routing and switching of digital signals between different users. It connects multiple ISDN lines and provides the necessary signaling and control functions for establishing and maintaining communication sessions.


