
#set text(
  font: "Charis SIL",
  size: 12pt,
  lang: "en",
)

#set par(justify: true)

= Distributed Systems

== Distributed System (DS)

A *distributed system* is a collection of independent computers connected through a network that work together and appear to users as a single system.

Each computer has its own processor and memory, but they communicate and share resources through the network.

*Example:* Google Search, online banking, cloud computing, and distributed databases.

=== Main Characteristic

+ *Concurrency* : Many users and processes can work at the same time.

+ *No Global Clock* : Each computer has its own clock, so there is no single global clock.

+ *Failure Independence* : One computer can fail while others continue working.

+ *Transparency* : The system hides the distributed nature from users as much as possible.

+ *Scalability* : More computers can be added when the workload increases.


== Importance of Distributed Systems

+ *Resource Sharing* : Allows users to share files, printers, databases, and other resources.

+ *Better Performance* : Work can be divided among several computers.

+ *High Availability* : Services can continue even if some computers fail.

+ *Fault Tolerance* : Failure of one component does not necessarily stop the whole system.

+ *Scalability* : New computers can be added to increase system capacity.

+ *Communication* : Supports communication between users and applications at different locations.

+ *Cost Effective* : Multiple ordinary computers can be used instead of one very powerful computer.

+ *Geographical Distribution* : Resources and services can be provided from different locations.


== Goals of Distributed Systems

+ *Resource Sharing* : Make hardware, software, data, and services available to different users.

+ *Transparency* : Hide the complexity of distribution from users.

+ *Openness* : Use standard interfaces and protocols so different systems can work together.

+ *Scalability* : Allow the system to grow without major performance problems.

+ *Reliability* : Continue providing services even when some components fail.

+ *Performance* : Provide fast and efficient service by sharing the workload.

+ *Security* : Protect data and resources from unauthorized access.


== Design Goals of Distributed Systems
+ *Resource Sharing* :  Resources such as files, databases, printers, and services should be easily shared among different computers.
+ *Transparency* :The distributed nature of the system should be hidden from users.

+ *Openness*  : The system should use standard rules and interfaces so that different components can work together.

+ *Scalability* :The system should continue to work efficiently when the number of users, computers, or resources increases.

+ *(Reliability and Fault Tolerance)* :The system should continue providing services even when some components fail.


== Transparency in Distributed Systems

*Transparency* means hiding the fact that resources and services are physically distributed among different computers.

A user should feel that the distributed system is a single system.

*Example:* A user opens a file from a remote server without needing to know where the file is physically stored.

=== Types of Transparency

+ *Access Transparency* : Hides differences between local and remote access methods.
  *Example:* A remote file is accessed in the same way as a local file.
+ *Location Transparency* : Hides the physical location of a resource
  *Example:* Users can access a file without knowing which server stores it.
+ *Migration Transparency* : Hides the movement of a resource from one location to another.
+ *Relocation Transparency* : Hides the movement of a resource while it is being used.
+ *Replication Transparency* : Hides the existence of multiple copies of a resource.
+ *Concurrency Transparency* : Hides the fact that many users are accessing the same resource at the same time.
+ *Failure Transparency* : Hides failures and recovery of system components from users.
+ *Persistence Transparency* : Hides whether a resource is stored in memory or on permanent storage.

=== Why is Transparency Important?

+ Makes the system easier to use.

+ Makes a distributed system appear as a single system.

+ Hides network and hardware complexity.

+ Makes applications easier to develop.

+ Improves user experience.

+ Allows resources to be moved or replicated without affecting users.


== Advantages of Distributed Systems

+ *Resource Sharing* : Resources can be shared among many computers.

+ *High Performance* : Tasks can be divided among multiple computers.

+ *High Availability* : Services can remain available even if one machine fails.

+ *Fault Tolerance* : Failure of one component does not necessarily stop the entire system.

+ *Scalability* : New computers can be added easily.

+ *Communication* : Supports communication between users and systems at different locations.

+ *Load Sharing* : Workload can be distributed among multiple machines.

+ *Cost Reduction* : Uses several smaller systems instead of one expensive machine.


== Disadvantages / Complexities of Distributed Systems

+ *Network Dependency* : The system depends on network communication.

+ *Security Problems* : Data travels through networks and may be exposed to attacks.

+ *Complexity* : Designing and managing a distributed system is more difficult.

+ *Synchronization* : Processes and data must be properly synchronized.

+ *Failure Handling* : Detecting and recovering from failures is difficult.

+ *Data Consistency* : Keeping copies of data consistent is challenging.

+ *Communication Delay* : Network delays can affect performance.

+ *No Global Clock* : It is difficult to determine the exact order of events.

+ *Concurrency Problems* : Multiple processes may access the same resource simultaneously.


== Distributed System vs Centralized System

#table(
  columns: 2,
  [*Centralized System*], [*Distributed System*],

  [Uses mainly *one central computer*.], [Uses *multiple computers* connected through a network.],

  [Resources are controlled centrally.], [Resources are distributed among different machines.],

  [Failure of the central machine can stop the system.], [Failure of one machine may not stop the whole system.],

  [Usually easier to design and manage.], [More complex to design and manage.],

  [Limited scalability.], [Highly *scalable* by adding more machines.],

  [Communication is simpler.], [Communication depends on the network.],

  [Less suitable for geographically distributed users.], [Suitable for users and resources in different locations.],

  [Example: A single-server application.], [Example: Cloud computing system.],
)


== Models of Distributed Systems

A *distributed system model* describes how computers, data, and control are distributed and how they communicate.

The main models are:

+ Physical Model

+ Architectural Model

+ Fundamental Model


== Physical Model

The physical model describes the actual physical components of a distributed system and how they are connected.

It includes:

+ Computers or nodes.

+ Networks and communication links.

+ Servers and clients.

+ Mobile and embedded devices.

+ Data storage devices.

*Example:* A cloud system containing many servers connected through a high-speed network.


== Architectural Model

The architectural model describes how the software components of a distributed system are organized and how they communicate.

Common architectural models include:

=== Client-Server Model

The client requests a service and the server provides the service.

```text
+----------+       Request       +----------+
|  Client  | ------------------> |  Server  |
|          | <------------------ |          |
+----------+       Response      +----------+
```

=== Peer-to-Peer Model

All nodes can act as both clients and servers.

```md

       +---------+
       |  Peer A |
       +---------+
        /       \
       /         \
+---------+     +---------+
|  Peer B |-----|  Peer C |
+---------+     +---------+
```
=== Multi-tier Model

The application is divided into multiple layers such as presentation, application logic, and database.

```text
+------------------+
|  Presentation    |
+------------------+
          |
+------------------+
| Business Logic   |
+------------------+
          |
+------------------+
|     Database     |
+------------------+

```

== Fundamental Model

The *fundamental model* identifies the basic properties and limitations of a distributed system.

It mainly describes:

+ *Interaction Model*

+ *Failure Model*

+ *Security Model*

== Interaction Model

The interaction model describes how processes communicate and coordinate with each other.

In distributed systems:

+ Processes execute concurrently.
+ Messages are exchanged through a network.
+ Network communication may have delays.
+ Processes may execute at different speeds.
+ There is no common global clock.

*Main Issues:*
+ Communication delay.
+ Process execution speed.
+ Lack of global time.
+ Message ordering.

== Failure Model

The failure model describes the types of failures that may occur in a distributed system.

Common failures include:

+ *Crash Failure* : A process stops working.
+ *Omission Failure* : A message is not sent or received.
+ *Timing Failure* : A response arrives too early or too late.
+ *Response Failure* : A process gives an incorrect response.
+ *Arbitrary / Byzantine Failure* : A process behaves unpredictably or gives incorrect information.

== Security Model

The security model describes possible security threats and methods used to protect distributed systems.

Main concerns are:

+ Unauthorized access.
+ Data modification.
+ Data theft.
+ Message interception.
+ Impersonation.
Security can be improved using authentication, authorization, encryption, and access control.

== Challenges in Distributed Systems

+ *Heterogeneity* : Different hardware, operating systems, networks, and programming languages must work together.

+ *Openness* : Components should communicate using standard interfaces and protocols.

+ *Security* : Protecting data and services from unauthorized users is difficult.

+ *Scalability* : Performance may decrease as the number of users and machines increases.

+ *Failure Handling* : Failures must be detected and handled without stopping the whole system.

+ *Concurrency* : Many processes may access the same resources simultaneously.

+ *Synchronization* : Processes need proper coordination even without a global clock.

+ *Consistency* : Replicated data must remain consistent.

+ *Communication Delay* : Network delays can affect system performance.

+ *Naming* : Resources and services must be uniquely identified and located.

+ *Transparency* : Hiding distribution while maintaining good performance is difficult.

== Why are Requirements of Distributed Systems Challenging?

Distributed systems have several computers connected through a network. Therefore, achieving all requirements at the same time is difficult.

+ *Scalability vs Performance* : Adding more users and machines may increase communication and processing overhead.

+ *Availability vs Consistency* : Keeping the system always available while maintaining perfectly consistent data is difficult.

+ *Transparency vs Performance* : Hiding distribution may introduce additional communication overhead.

+ *Security vs Usability* : Strong security may make the system more complex for users.

+ *Fault Tolerance vs Cost* : Extra backup machines and replicas improve fault tolerance but increase cost.

+ *Concurrency vs Consistency* : Many users accessing the same data can create conflicts.

== Homogeneous and Heterogeneous Distributed Systems

#table(
columns: 2,
[*Homogeneous Distributed System*], [*Heterogeneous Distributed System*],

[Uses similar hardware and software.], [Uses different hardware and software.],

[Usually uses the same operating system.], [May use different operating systems.],

[Communication is relatively easier.], [Communication is more complex.],

[Easier to manage and maintain.], [More difficult to manage and maintain.],

[Provides better compatibility.], [Requires middleware and standard protocols.],

[Less flexible.], [More flexible and diverse.],

[Example: Linux computers with similar hardware.], [Example: Windows, Linux, and macOS computers working together.],
)

== Distribution of Hardware, Data and Control

Distributed systems can be understood based on how hardware, data, and control are distributed.
=== Hardware Distribution

Hardware resources such as processors, servers, storage devices, and network devices are located on different computers.

*Example:* A cloud system uses hundreds of servers located in different data centers.

=== Data Distribution

Data is stored on multiple computers or locations.

*Example:* A distributed database stores different or replicated data on several servers.

=== Control Distribution

Control of the system is shared among multiple computers instead of being controlled by a single central computer.

*Example:* In a peer-to-peer system, each peer can make decisions and provide services.

== Applications of Distributed Systems

+ *Cloud Computing* : Provides computing and storage services through distributed servers.
+ *Distributed Databases* : Stores and manages data across multiple computers.
+ *Web Services* : Different servers provide services to users through the Internet.
+ *Online Banking* : Banking services operate using distributed servers and databases.
+ *E-Commerce* : Handles users, payments, products, and orders using distributed systems.
+ *Multimedia Systems* : Supports distributed video, audio, and streaming services.
+ *Distributed File Systems* : Allows users to access files stored on different computers.
+ *Communication Systems* : Email, messaging, and video-conferencing systems use distributed omponents.
+ *Scientific Computing* : Large computations are divided among multiple computers.

== Properties of Distributed Systems

+ *Resource Sharing* : Resources can be shared among different users and computers.
+ *Concurrency* : Multiple processes can execute at the same time.
+ *Scalability* : The system can grow by adding more resources.
+ *Fault Tolerance* : The system can continue working despite some failures.
+ *Transparency* : Distribution is hidden from users.
+ *Heterogeneity* : Different hardware and software can work together.
+ *Openness* : Standard interfaces allow different components to communicate.
+ *Security* : Resources and communication are protected from unauthorized access.
== Distributed System as a Single Coherent System

A distributed system may contain many computers, but it appears as a *single coherent system* to the user.

This is achieved mainly through *transparency*.

For example, when a user accesses a file, the user does not need to know:

+ Which computer stores the file.
+ Which server processes the request.
+ Whether multiple copies of the file exist.
+ Whether the file has moved to another server.
Thus, distributed systems hide internal complexity and provide a simple interface to users.
