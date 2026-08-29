#set text(
  font: "Charis SIL",
  size: 12pt,
  lang: "en",
)

#set par(justify: true)

= Distributed Object and File Systems

== Distributed Object

A *distributed object* is an object located on another computer or
process whose methods can be called through a network as if the object
were local.

*Example:* A client on one computer calls a method of an object running
on another computer.

== IDL (Interface Definition Language)

*IDL* is a language-independent way of describing the interface of a
distributed object.

It defines:

- Methods provided by the object.
- Parameters of methods.
- Return types.
- Exceptions.

IDL allows programs written in different programming languages to
communicate with the same distributed object.

== Local Method Invocation (LMI)

*Local Method Invocation* means calling a method of an object located
within the same process or JVM.

No network communication is required.

== Remote Method Invocation (RMI)

*Remote Method Invocation* means calling a method of an object located
in another process or computer through a network.

== Request-Reply Protocol

The *Request-Reply Protocol* is a basic communication method in which
a client sends a request to a server and the server sends a reply.

=== Working

+ Client sends a *request*.
+ Server receives and processes the request.
+ Server sends a *reply*.
+ Client receives the reply.

It is commonly used in RPC and RMI.

== Remote Interface

A *Remote Interface* defines the methods that can be called remotely
by a client.

In Java RMI, the remote interface normally extends
`java.rmi.Remote`, and remote methods can throw
`RemoteException`.

#pagebreak()

== Remote Procedure Call (RPC)

*RPC* allows a client to call a procedure or function running on a
remote server as if it were a local function.

=== Components of RPC

+ *Client*: Requests a remote procedure.
+ *Client Stub*: Converts the client request into a network message.
+ *RPC Runtime*: Handles network communication.
+ *Server Stub*: Receives the request and passes it to the procedure.
+ *Server*: Executes the actual procedure.

=== Working of RPC

+ *Client makes a call*: Client calls the remote procedure.
+ *Client Stub*: Receives the call and prepares the parameters.
+ *Marshalling*: Parameters are converted into a transferable format.
+ *Request Transmission*: RPC runtime sends the request to the server.
+ *Server Stub*: Receives and unmarshals the request.
+ *Procedure Execution*: Server executes the actual procedure.
+ *Result*: Server sends the result back.
+ *Client receives result*: Client stub unmarshals the result and gives
  it to the client.

== Modern RPC Communication Semantics

Communication semantics describe what happens when a request or reply
is lost.

=== Request-Retry

If the request or reply is lost, the client retransmits the request.

The server uses a request ID or sequence number to detect duplicate
requests.

=== At-Least-Once Semantics

The client keeps retransmitting until a reply is received.

Therefore, the operation is executed *at least once*, but it may be
executed more than once.

=== At-Most-Once Semantics

The server detects duplicate requests using request IDs or sequence
numbers.

Therefore, an operation is executed *zero or one time*.

This is safer for operations that should not be repeated.

=== Maybe Semantics

The client does not know whether the request was executed when no
reply is received.

The operation may have been executed or may not have been executed.

#pagebreak()

== Problems in Parameter Passing in RPC

Passing parameters in RPC is more difficult than a local procedure call
because data must travel through a network.

Main problems are:

- *Different Data Representations*: Different machines may use
  different formats for numbers and characters.
- *Pointers*: A pointer in one machine cannot directly refer to memory
  on another machine.
- *Complex Data*: Structures, arrays, and objects need proper
  serialization.
- *Call-by-Reference*: Remote memory references cannot directly be used.
- *Large Data*: Sending large parameters increases network traffic.
- *Data Conversion*: Parameters must be converted into a common format.

*Solution:* Marshalling and data representation techniques such as
XDR are used to convert data into a machine-independent format.

== Asynchronous RPC

In normal RPC, the client waits for the reply.

In *asynchronous RPC*, the client sends the request and continues its
work without waiting immediately for the result.

=== Alternatives of Asynchronous RPC

+ *Client continues and later checks*: Client sends a request and
  continues working. Later it asks for the result.

+ *Callback*: Server sends the result to a callback function when the
  operation is completed.

+ *Notification*: Server sends a notification when the result is ready.

#pagebreak()

== Remote Method Invocation (RMI)

RMI allows an object in one process to invoke methods of an object in
another process.

#image("../../assets/image-1a.png", width: 90%)

=== Working of RMI

+ *Client Application*: Calls a method on the remote object.
+ *Stub / Proxy*: Acts as a local representative of the remote object.
+ *Marshalling*: Converts method name and parameters into a transferable
  format.
+ *Remote Reference Layer*: Manages the reference to the remote object.
+ *Transport Layer*: Sends the request through the network.
+ *Skeleton / Server-side layer*: Receives the request and calls the
  actual object.
+ *Server Application*: Executes the remote method.
+ *Response*: Result or exception is returned to the client.

== Static RMI

In *static RMI*, the required stub/proxy is generated before the
program runs.

=== Working

+ Define the remote interface.
+ Implement the remote object.
+ Generate the required stub/proxy.
+ Register the remote object.
+ Client looks up the object.
+ Client calls the remote method through the stub.

*Advantage:* Simple and efficient.

== Dynamic RMI

In *dynamic RMI*, the required proxy/stub information is obtained or
created at runtime instead of depending completely on a pre-generated
stub.

=== Working

+ Server registers the remote object.
+ Client looks up the remote object.
+ Required proxy information is obtained dynamically.
+ A proxy is created or loaded at runtime.
+ Client invokes the remote method through the proxy.

*Advantage:* More flexible than static invocation.

== Importance of IDL in Distributed Object Communication

IDL provides a common interface between different languages and
platforms.

It:

- Defines the methods and parameters of an object.
- Hides programming-language differences.
- Allows different languages to communicate.
- Helps generate communication code such as stubs and skeletons.

*Note:* IDL is especially important in systems such as CORBA. Java RMI
primarily uses Java remote interfaces rather than CORBA IDL.

#pagebreak()

== Functionalities Provided by RMI Software

+ *Remote Object Creation*: Creates objects that can be accessed remotely.
+ *Remote Object Registration*: Registers objects with a registry.
+ *Remote Object Lookup*: Allows clients to find remote objects.
+ *Remote Method Invocation*: Allows clients to call remote methods.
+ *Parameter Passing*: Serializes and transfers parameters and results.
+ *Remote Object References*: Maintains references to remote objects.
+ *Communication Management*: Handles client-server communication.
+ *Exception Handling*: Sends remote exceptions back to the client.

== RMI vs RPC

#table(
  columns: 3,
  [*Basis*], [*RPC*], [*RMI*],

  [*Meaning*],
  [Calls remote procedures/functions.],
  [Calls methods of remote objects.],

  [*Programming Model*],
  [Procedure-oriented.],
  [Object-oriented.],

  [*Object Support*],
  [Mainly passes data/parameters.],
  [Can pass objects and object references.],

  [*Encapsulation*],
  [Data and procedures are separate.],
  [Data and methods are encapsulated in objects.],

  [*Inheritance*],
  [Not naturally supported.],
  [Supports object-oriented features.],

  [*Language*],
  [Can support multiple languages.],
  [Java RMI is mainly used between Java programs.],

  [*Remote Reference*],
  [Usually procedure-oriented.],
  [Supports references to remote objects.],
)

== Distributed Object Communication

Distributed objects can communicate using:

- *RMI*: Client invokes methods on remote objects.
- *RPC*: Client calls procedures on remote servers.
- *CORBA*: Objects written in different languages can communicate.
- *Message Passing*: Objects exchange messages through a network.

The basic process is:

`Client -> Request -> Network -> Remote Object -> Response -> Client`

#pagebreak()

== Stateful and Stateless Services

#table(
  columns: 2,
  [*Stateful Service*], [*Stateless Service*],

  [Server remembers information about the client.],
  [Server does not remember previous client requests.],

  [Each request may depend on previous requests.],
  [Each request contains all required information.],

  [Example: Open file session.],
  [Example: Independent file request.],

  [Failure recovery is more difficult.],
  [Failure recovery is easier.],

  [May require more server state.],
  [Less server state is required.],
)

== Distributed File System (DFS)

A *Distributed File System* stores files on multiple computers and
allows users to access them as if they were local files.

=== Requirements of DFS

+ *Transparency*: Remote files should appear like local files.
+ *Location Independence*: Users do not need to know where files are stored.
+ *Sharing*: Multiple users can share files.
+ *Reliability*: Files should remain available during failures.
+ *Fault Tolerance*: The system should continue despite failures.
+ *Performance*: File access should be fast.
+ *Scalability*: It should support increasing users and files.
+ *Security*: Files should be protected from unauthorized access.
+ *Consistency*: Users should see correct file versions.

=== Importance of DFS

+ Allows *file and storage sharing*.
+ Makes remote files easy to access.
+ Improves availability through replication.
+ Can improve performance.
+ Supports system scalability.
+ Allows distributed storage resources to be shared.

#pagebreak()

== File Service Architecture of DFS

#image("../../assets/image-2a.png")

A DFS file service mainly contains:

=== Flat File Service

It manages the actual contents of files.

Files are identified using a *UFID (Unique File Identifier)*.

Main operations:

- Read
- Write
- Create
- Delete
- Get Attributes
- Set Attributes

=== Directory Service

It maps a human-readable file name to its UFID.

Main operations:

- *Lookup*: Finds UFID using a file name.
- *AddName*: Adds a name to a file.
- *UnName*: Removes a file name.
- *GetNames*: Gets names associated with a file.

=== Client Module

The client module runs on the client computer.

It provides an interface to applications and may use caching to
improve performance.

=== How DFS Encourages Storage Sharing

+ Files are stored on different servers.
+ Directory service provides a common way to locate files.
+ Clients access remote files through the client module.
+ Users do not need to know the physical storage location.
+ Therefore, storage resources of different machines can be shared.

#pagebreak()

== SUN Network File System (SUN NFS)

*SUN NFS* is a distributed file system developed by Sun Microsystems.
It allows users to access remote files as if they were local files.

=== Properties of NFS

+ *Transparency*: Remote files appear like local files.
+ *Client-Server Model*: Machines can act as clients or servers.
+ *Mounting*: Remote file systems are attached to a local directory.
+ *Stateless*: Each request contains enough information to process it.
+ *Machine Independent*: Works across different machines.
+ *OS Independent*: Can work with different operating systems.

=== NFS Architecture

#image("../../assets/image-3a.png", width: 80%)

=== NFS Protocols

+ *SUN RPC*: Used for client-server communication.
+ *XDR*: Provides machine-independent data representation.
+ *Mount Protocol*: Helps clients attach remote file systems.
+ *NFS Protocol*: Provides operations for accessing files.

=== NFS Server Side

The server provides a *file handle* to identify a file.

A file handle contains information such as:

- *File System ID*: Identifies the file system.
- *I-node Number*: Identifies the file.
- *Generation Number*: Identifies the current version of the file.

=== NFS Client Side

+ Client requests a remote file system.
+ Mount operation makes the remote directory available.
+ Client accesses files through normal file operations.
+ Requests are sent to the NFS server using RPC.

=== NFS Operations

- Search for a file in a directory.
- Read directory entries.
- Create and remove files.
- Create and manipulate links.
- Read and write file data.
- Read and write file attributes.

#pagebreak()

== Design Issues of NFS

Important design issues include:

+ *Statelessness*: The server does not need to maintain client session
  information.

+ *Naming*: The system must provide a way to locate remote files.

+ *File Identification*: File handles are used to identify files.

+ *Caching*: Clients can cache data to reduce network communication.

+ *Consistency*: Cached copies must be managed so users receive
  appropriate file data.

+ *Failure Handling*: Stateless operation makes server crash recovery
  easier.

+ *Security*: Access permissions and authentication must be considered.

+ *Performance*: Network delay and server load affect file access speed.

== Event and Notification System

An *event and notification system* allows distributed objects to
communicate without directly calling each other.

=== Working

+ An object generates an *event*.
+ The event is sent to an event/notification service.
+ Interested objects subscribe to the event.
+ The service sends the event to subscribed objects.
+ The receiving objects perform the required action.

*Example:* A server generates a `FileUpdated` event. All clients
subscribed to that event receive a notification.

=== Benefit

It provides *loose coupling* because the sender does not need to know
the exact receiver.

#pagebreak()

== DNS (Domain Name System)

*DNS* is a distributed hierarchical database that converts domain names
into IP addresses.

*Example:*

`www.example.com -> IP address`

=== Why DNS is a Distributed Hierarchical Database

DNS is distributed because its information is stored across many name
servers.

It is hierarchical because names are organized into levels:

`Root -> TLD -> Domain -> Host`

For example:

`www.example.com`

- `.` -> Root
- `.com` -> Top-Level Domain
- `example.com` -> Domain
- `www.example.com` -> Host

=== DNS Query Types

There are two common ways of resolving a DNS query.

==== Recursive Query

In a *recursive query*, the DNS server contacted by the client is
responsible for finding the final answer.

*Example:*

`Client -> Local DNS -> Root/TLD/Authoritative DNS -> Local DNS -> Client`

The client receives the final answer from the local DNS server.

==== Iterative Query

In an *iterative query*, the server does not find the complete answer.
Instead, it gives the address of another server that may know the answer.

*Example:*

`DNS -> Root`

`Root -> TLD server`

`DNS -> TLD`

`TLD -> Authoritative server`

`DNS -> Authoritative server`

`Authoritative server -> IP address`

=== DNS Working Example

Suppose the client wants the IP address of:

`www.example.com`

+ Client sends a DNS query to its local DNS server.
+ Local DNS asks the *root server*.
+ Root server points to the `.com` TLD server.
+ Local DNS asks the `.com` TLD server.
+ TLD server points to the authoritative server for `example.com`.
+ Local DNS asks the authoritative server.
+ Authoritative server returns the IP address.
+ Local DNS returns the IP address to the client.
+ Client connects to the web server using that IP address.

#pagebreak()

== Naming in Distributed Systems

Naming is necessary to uniquely identify and locate resources such as
files, computers, services, and objects.

=== Importance of Naming

+ Provides unique identification.
+ Helps locate resources.
+ Hides physical locations.
+ Supports resource sharing.
+ Provides location transparency.

== Request-Reply and Failure Handling

Communication may fail because requests or replies can be lost.

=== Lost Request

If the client does not receive a reply within a timeout, it may resend
the request.

=== Lost Reply

The server may have completed the operation but the reply may be lost.

If the client resends the request, the server uses a request ID or
sequence number to detect the duplicate.

It can return the previously stored result instead of executing the
operation again.

=== Duplicate Requests

Sequence numbers or unique request IDs are used to identify duplicate
requests.

#pagebreak()

== Summary of Important Terms

#table(
  columns: 2,
  [*Term*], [*Simple Meaning*],

  [*Distributed Object*],
  [Object whose methods can be called remotely.],

  [*IDL*],
  [Language-independent description of an object interface.],

  [*LMI*],
  [Method call within the same process.],

  [*RMI*],
  [Calling a method of a remote object.],

  [*RPC*],
  [Calling a remote procedure as if it were local.],

  [*DFS*],
  [File system distributed across multiple computers.],

  [*NFS*],
  [A distributed file system for accessing remote files.],

  [*DNS*],
  [Hierarchical distributed system for resolving names.],

  [*Stateful*],
  [Server remembers client state.],

  [*Stateless*],
  [Server does not maintain client state.],

  [*Middleware*],
  [Software layer that hides distributed communication complexity.],
)