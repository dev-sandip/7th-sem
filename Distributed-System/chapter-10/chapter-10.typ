
= Case Studies
== CORBA
CORBA stands for Common Object Request Broker Architecture.
It is a standard developed by the OMG (Object Management Group) for communication between distributed objects written in different programming languages and running on different platforms.
It allows one object to call a method of another remote object as if it were a local object.

=== CORBA Architecture
The main components of CORBA architecture are:
- *Client*: Requests a service from a remote object.
- *ORB (Object Request Broker)*: Manages communication between client and server objects.
- *Object Adapter*: Connects the ORB with the implementation of the server object.
- *Server Object*: Provides the required service.
- *IDL (Interface Definition Language)*: Used to define the interface of distributed objects.
- *IDL Stub*: Client-side code used to communicate with the remote object.
- *IDL Skeleton*: Server-side code that receives and processes client requests.
- *Naming Service*: Helps clients find remote objects.

*Basic communication:*
$ "Client" -> "ORB" -> "Object Adapter" -> "Server Object" $

=== ORB
ORB stands for Object Request Broker. It acts as a communication broker between a client and a remote object.

The ORB:
- Locates the remote object.
- Sends client requests to the object.
- Transfers parameters.
- Returns the result to the client.
- Hides network communication details from the programmer.

=== ORB Interfaces
The main interfaces related to ORB are:
- *Client interface*: Provides operations required by clients to invoke remote objects.
- *Object interface*: Provides operations for accessing and manipulating remote objects.
- *ORB interface*: Provides basic ORB operations such as object creation and connection.
- *Dynamic Invocation Interface (DII)*: Allows a client to create and invoke requests dynamically.
- *Dynamic Skeleton Interface (DSI)*: Allows a server to handle requests dynamically.
- *Object Adapter*: Connects object implementations with the ORB.

=== CORBA Static and Dynamic Invocation
CORBA provides two approaches for invoking a remote operation: Static invocation and Dynamic invocation.

==== Static Invocation
In static invocation, the interface of the remote object is known at compile time. The client uses an IDL-generated stub.

*Process:*
+ Define the interface using IDL.
+ Generate client stub and server skeleton.
+ Compile the application.
+ Client calls the remote method through the stub.
+ ORB sends the request to the server.
+ Server skeleton receives and processes the request.
+ Result is returned to the client.

*Advantages:*
- Easy to use.
- Faster.
- Type checking is available at compile time.

==== Dynamic Invocation
In dynamic invocation, the client does not need a pre-generated stub for the particular operation. The client creates a request at runtime using the Dynamic Invocation Interface (DII).

*Process:*
+ Client obtains a reference to the remote object.
+ Client determines the required operation at runtime.
+ Client creates a dynamic request.
+ Client adds required arguments.
+ Client sends the request through the ORB.
+ Server executes the operation.
+ Result is returned to the client.

*Advantages:*
- More flexible.
- Operation can be selected at runtime.
- Useful when the interface is not known at compile time.

*Disadvantages:*
- More complex than static invocation.
- Runtime errors may occur.
- Generally slower than static invocation.

=== CORBA Services
CORBA services are standard services provided to support distributed objects.
Important CORBA services include:
- *Naming Service*: Finds objects by name.
- *Trading Service*: Finds objects based on their properties or capabilities.
- *Event Service*: Supports asynchronous event communication.
- *Notification Service*: Provides advanced event and notification mechanisms.
- *Security Service*: Provides authentication, authorization, and security.
- *Transaction Service*: Supports distributed transactions.
- *Concurrency Control Service*: Controls concurrent access to resources.
- *Life Cycle Service*: Creates, copies, moves, and deletes objects.
- *Persistent Object Service*: Provides persistent storage for objects.
- *Time Service*: Provides time-related services.
- *Property Service*: Associates properties with objects.

* Most Important CORBA Services for Exam*\
If the question asks to write different CORBA services, write:
+ Naming Service
+ Trading Service
+ Event Service
+ Security Service
+ Transaction Service
+ Concurrency Control Service
+ Life Cycle Service
+ Persistent Object Service

=== CORBA Component for RMI
CORBA can support remote method invocation through its distributed-object architecture.
Important components are:
- *IDL*: Defines remote object interfaces.
- *ORB*: Handles communication.
- *Stub*: Represents the remote object on the client side.
- *Skeleton*: Receives calls on the server side.
- *Object Adapter*: Connects the server object to the ORB.
- *Remote Object*: Provides the actual service.

*Basic flow:*
$ "Client" -> "Stub" -> "ORB" -> "Skeleton" -> "Remote Object" $
The result follows the reverse path.

== RPC
RPC stands for Remote Procedure Call. It allows a program to call a procedure located on another computer as if it were a local procedure.

=== Basic RPC Steps
+ Client calls the local client stub.
+ Client stub converts parameters into a message. This is called *marshalling*.
+ The message is sent through the network.
+ Server stub receives the message.
+ Server stub performs *unmarshalling*.
+ Server procedure is executed.
+ Result is returned to the client.
+ Client receives the result.

*Basic structure:*
$ "Client" arrow "Client Stub" arrow "Network" -> "Server Stub" arrow "Server" $

=== Advantages of RPC
- Simple programming model.
- Hides network communication details.
- Supports communication between distributed processes.

=== Problems of RPC
- Network failure.
- Message loss.
- Server failure.
- Parameter marshalling/unmarshalling overhead.
- Binding issues.
- Timeout and exception handling.

== JINI
JINI is a Java-based distributed service technology developed by Sun Microsystems. It allows devices and services to discover each other and work together dynamically over a network. Jini is designed for dynamic and flexible distributed systems.

=== Goals of JINI
The main goals of Jini are:
- *Dynamic discovery*: Devices and services can discover available services automatically.
- *Service sharing*: Different devices can share their services over a network.
- *Dynamic joining*: A new device can join the system without complex configuration.
- *Self-healing*: Services can recover from temporary failures.
- *Simple administration*: Services should require minimum manual configuration.
- *Scalability*: The system should support a large number of devices and services.
- *Network mobility*: Services can move between different network environments.
- *Loose coupling*: Devices and services should not depend heavily on each other.

=== Basic Jini Components
- *Service Provider*: Provides a service.
- *Lookup Service*: Maintains information about available services.
- *Service Consumer*: Searches for and uses a service.
- *Discovery*: Allows clients and services to discover lookup services.
- *Lease*: Controls how long a service remains registered.
- *Remote Event*: Allows notification when an event occurs.

=== Jini Working
+ A service provider starts and discovers a lookup service.
+ The provider registers its service with the lookup service.
+ A client discovers the lookup service.
+ The client searches for the required service.
+ The lookup service returns information about the service.
+ The client uses the service.

*Simple flow:*
$ "Service" -> "Lookup Service" <- "Client" $

== Rendezvous Concept
Rendezvous means a meeting or synchronization point between distributed processes. In distributed systems, a rendezvous allows processes to meet and exchange information before continuing execution.

For example, suppose two processes must exchange data before performing the next operation:
+ Process $P_1$ reaches the rendezvous point.
+ $P_1$ waits.
+ Process $P_2$ reaches the same rendezvous point.
+ They exchange the required information.
+ Both processes continue execution.

Therefore, rendezvous provides synchronization and coordination among distributed processes.

=== TIB/Rendezvous
TIB/Rendezvous is a messaging system developed by TIBCO. It provides communication between distributed applications using a publish/subscribe model.

The main components are:
- *Publisher*: Sends messages.
- *Subscriber*: Receives messages.
- *Subject*: Identifies the type or topic of a message.
- *Rendezvous daemon*: Handles message communication between applications.

=== Working
+ Publisher sends a message on a subject.
+ The message is delivered to the Rendezvous communication system.
+ Subscribers interested in that subject receive the message.
+ Subscribers process the message.

*Example:*
Suppose the subject is: `stock.price` \
A publisher sends: `stock.price = 500` \
All subscribers interested in `stock.price` receive the update.

=== Advantages
- Supports asynchronous communication.
- Uses publish/subscribe communication.
- Provides loose coupling between applications.
- Suitable for distributed applications.
- Supports real-time messaging.

== MACH
Mach is a microkernel-based operating system developed as a research project at Carnegie Mellon University. It was designed to provide a small kernel with basic mechanisms while moving many operating-system services outside the kernel.

=== Main Features of Mach
- Microkernel architecture.
- Inter-process communication (IPC).
- Virtual memory management.
- Support for multiple processors.
- Message-based communication.
- Support for distributed computing.
- Port-based communication.
- Threads and tasks.

=== Mach Architecture
Mach keeps only essential functions inside the kernel. The microkernel mainly provides IPC, Scheduling, Basic memory management, Task management, and Thread management. Other services (file systems, networking) run outside the kernel.

*Basic structure:*
$ "Applications" \ arrow.b \ "OS Servers" \ arrow.b \ "Mach Microkernel" \ arrow.b \ "Hardware" $
=== Mach IPC
Mach uses message passing as an important mechanism for inter-process communication. Processes communicate through ports. A process sends a message to a port, and another process receives the message from that port.

*Basic flow:*
$ "Process A" -> "Port" -> "Process B" $

=== Advantages of Mach
- Small kernel.
- Modular design.
- Good fault isolation.
- Supports multiprocessing.
- Provides flexible IPC.
- Easier to extend operating-system services.

=== Disadvantages of Mach
- Message passing can introduce overhead.
- More complex than a monolithic kernel.
- Communication between user-level servers can reduce performance.

== Monolithic Kernel
A monolithic kernel places most operating-system services inside the kernel (e.g., File system, Device drivers, Memory management, Process management, Networking).

*Structure:*
$ "Applications" \ arrow.b \ "Monolithic Kernel" \ arrow.b \ "Hardware" $

=== Advantages
- High performance.
- Direct communication between kernel services.
- Less communication overhead.

=== Disadvantages
- Large and complex kernel.
- Failure of one kernel component can affect the whole system.
- Difficult to modify and maintain.

== Microkernel
A microkernel keeps only the most essential services inside the kernel. Other services run as separate user-level processes.

*Structure:*
$ "Applications" \ arrow.b \ "User-Level Servers" \ arrow.b \ "Microkernel" \ arrow.b \ "Hardware" $

=== Advantages
- Small kernel.
- Better modularity and fault isolation.
- Easier maintenance.
- Services can be added or modified independently.

=== Disadvantages
- IPC introduces overhead.
- More context switches may be required.
- Can be slower than a monolithic kernel.

== Monolithic vs Microkernel
#table(
  columns: (1.8fr, 2.7fr, 2.7fr),
  stroke: 0.5pt,
  [*Feature*], [*Monolithic Kernel*], [*Microkernel*],
  [Kernel size], [Large], [Small],
  [OS services], [Mostly inside kernel], [Many outside kernel],
  [Communication], [Direct function calls], [Message passing / IPC],
  [Performance], [Generally faster], [Generally more overhead],
  [Fault isolation], [Lower], [Better],
  [Maintenance], [More difficult], [Easier],
  [Example], [Linux], [Mach],
)

== CORBA vs Mach
CORBA and Mach are different technologies designed for different purposes.
#table(
  columns: (1.8fr, 2.7fr, 2.7fr),
  stroke: 0.5pt,
  [*Feature*], [*CORBA*], [*Mach*],
  [Type], [Middleware architecture], [Operating system kernel],
  [Purpose], [Distributed object communication], [Operating-system services and IPC],
  [Main concept], [Remote objects], [Message-based IPC],
  [Communication], [ORB], [Mach ports/messages],
  [Language support], [Multiple languages through IDL], [Primarily OS-level mechanism],
  [Main use], [Distributed applications], [Operating systems / distributed computing],
)

== Operating System Support for Distributed Systems
An operating system supports distributed systems by providing mechanisms that allow processes on different machines to communicate and coordinate. Important support includes:
- *Inter-process communication*: Message passing between processes.
- *Process management*: Creation, scheduling, and termination of processes.
- *Synchronization*: Coordination between distributed processes.
- *Distributed resource management*: Sharing resources across machines.
- *Network communication*: Communication between computers.
- *Naming*: Identifying and locating distributed resources.
- *Security*: Authentication and access control.
- *Fault handling*: Detecting and handling failures.
- *File and storage management*: Sharing distributed data and files.
