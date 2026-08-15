+ *Distributed Object* \
  A distributed object is an object whose methods can be invoked by a client from another computer or JVM over a network, as if the object were local.
+ *IDL (Interface Definition Language)* \
  IDL is a language used to describe the interface of a distributed object so that programs written in different programming languages can communicate with it.

+ *Local Method Invocation (LMI)* \
  *Definition:* Local method invocation is the process of calling a method of an object within the same process or JVM, without network communication.
+ *Remote Method Invocation (RMI)* \
  *Definition:* Remote method invocation is the process of calling a method of an object located in another process or JVM, possibly on another computer, through a network.

+ *Request-Reply Protocol* \
  Request-Reply Protocol is a communication protocol used in distributed systems where a client sends a request to a server, and the server processes the request and sends back a reply.

+ *Remote Interface* \
  A Remote Interface in Java RMI is an interface that defines the methods that can be invoked remotely by a client.

  
= Remote Procedure Call (RPC)

Remote Procedure Call (RPC) allows a client program to call a function/procedure on a remote server as if it were a local function.
// #image("assets/image.png",width: 90%)
RPC architecture has mainly five components of the program:

+ *Client* -- The program that wants to call a remote function.
+ *Client Stub* -- A helper that prepares the data to send to the server.
+ *RPC Runtime* -- Manages communication over the network.
+ *Server Stub* -- A helper on the server side that receives the data and calls the actual function.
+ *Server* -- The program that contains the function to execute and return results.

*Steps in simple words*

+ *Client makes a call* \
  The client calls a remote function just like a normal function.
+ *Client stub receives the call* \
  The stub acts as a local representative of the remote procedure.
+ *Marshalling* \
  The client stub converts the arguments into a format suitable for network transmission.
+ *Request transmission* \
  The RPC runtime sends the request to the server.
+ *Server stub receives it* \
  The server stub unmarshals the request and extracts the arguments.
+ *Procedure execution* \
  The actual procedure runs on the server.
+ *Result is returned* \
  The server stub marshals the result and sends it back to the client.
+ *Client gets the result* \
  The client stub unmarshals the response and gives the result to the client program.

= Remote Method Invocation (RMI)
RMI is the means by which objects in different processes can communicate with one another.It allows object in one process to invoke or call the methods of an object in another process.

#image("../../assets/image-1a.png",width: 90%)
== Working:
+ *Client Application*
  - The client wants to execute a method on the remote server.
  - It calls the required method on the Stub as if it were a local method.

+ *Stub --- Proxy Layer*
  - The Stub acts as a proxy/representative of the remote object.
  - It receives the method call from the client.
  - It marshals (serializes) the method name and arguments into a form suitable for transmission.
  - It passes the request to the Remote Reference Layer.

+ *Remote Reference Layer (RRL)*
  - The RRL manages the remote reference to the server object.
  - It identifies the required remote object and manages the remote invocation.
  - It passes the request to the Transport Layer.

+ *Transport Layer*
  - The Transport Layer establishes/manages the network connection between client and server.
  - It sends the request across the network to the server-side RMI system.

+ *Skeleton --- Proxy Layer*
  - The Skeleton receives the request from the Transport/RRL.
  - It unmarshals (deserializes) the method name and arguments.
  - It calls the appropriate method on the actual Server Application/remote object.

+ *Server Application*
  - The actual remote method is executed.
  - The server produces a return value or exception.
  - The result is sent back through the Skeleton.

+ *Response Back to Client* \
  The response follows the reverse path:

== Dynamic RMI:
Dynamic RMI generates the required proxy(stub) at runtime, So no pre-generated stub is required. 

*How It works*
- Server registers the remote object.
- The client looks up the object in RMI registry.
- Java dynamically creates a [rpxy (stub).
- The client invokes methods through the proxy.
== Functionalities Provided by RMI Software

RMI (Remote Method Invocation) provides the following functionalities:

+ *Remote Object Creation*
  - Creates objects that can be accessed by clients over a network.
+ *Remote Object Registration*
  - Registers a remote object with the RMI Registry using a unique name.
+ *Remote Object Lookup*
  - Allows the client to find and obtain a reference to a remote object.
+ *Remote Method Invocation*
  - Allows a client to call methods of a remote object as if they were local methods.
+ *Parameter Passing*
  - Provides marshalling and unmarshalling of method arguments and return values.
+ *Remote Object Reference*
  - Maintains references to objects located on remote machines.
+ *Communication Management*
  - Handles communication between client and remote server through the underlying transport mechanism.
+ *Exception Handling*
  - Transfers exceptions generated during remote method execution back to the client.
= Differences between RMI and RPC
  #table(
  columns: 3,
  [*Basis*], [*RPC*], [*RMI*],
  [*Communication model*], [Calls remote procedures/functions], [Calls methods of remote objects],
  [*Programming paradigm*], [Procedure-oriented], [*Object-oriented*],
  [*Objects*], [Mainly works with data/parameters], [Can pass *objects as parameters and return objects*],
  [*Encapsulation*], [Procedure and data are generally separate], [Data and methods are encapsulated in objects],
  [*Inheritance*], [Not naturally supported], [Supports *inheritance and polymorphism*],
  [*Complex data*], [Requires explicit data representation], [Java objects can be serialized and transmitted],
  [*Language*], [Can support multiple languages], [Mainly designed for *Java-to-Java* communication],
  [*Remote references*], [Usually procedure-oriented], [Supports *references to remote objects*],
  [*Object-oriented features*], [Limited], [Supports Java's OO features naturally],
  [*Development*], [More work for object-oriented applications], [Easier for distributed Java applications],
)
= Differences between Stateful and Stateless Services
#table(
  columns: 2,
  [*Stateful*], [*Stateless*],
  [Server *remembers* the client's information.], [Server *does not remember* client information.],
  [Server keeps track of open files.], [Each request contains all required information.],
  [Faster communication.], [Slightly more communication overhead.],
  [Failure recovery is difficult.], [Failure recovery is easy.],
)

= File Service Architecture of DFS
#image("../../assets/image-2a.png")

A DFS consists of three main components:

+ *Flat File Service*
  - It manages the actual contents of files.
  - It uses a Unique File Identifier (UFID) to identify each file.
  - Main operations are:
    - Read,Write,Create,Delete,GetAttributes,SetAttributes

+ *Directory Service*
  - It provides a mapping between a file name and its UFID.
  - It manages file names and directories.
  - Main operations are:
    - Lookup -- finds UFID using a file name.
    - AddName -- adds a name for a file.
    - UnName -- removes a file name.
    - GetNames -- gets names associated with a file.

+ *Client Module*
  - It runs on the client computer.
  - It combines the functions of the directory service and flat file service into a single interface/API for applications.
  - It uses caching to improve performance.

= Communication Between Distributed Systems

Communication between distributed systems means the exchange of data, messages, and requests between processes running on different computers connected through a network.
#pagebreak()
== Basic Communication
```
+-------------+        Network         +-------------+
|  System A   | ---------------------> |  System B   |
|  (Client)   |   Request / Message    |  (Server)   |
+-------------+ <--------------------- +-------------+
                      Response
```
== Operation

+ *Sender creates a message* -- A process prepares data or a request.
+ *Message is sent* -- The message is transmitted through the network.
+ *Network transfers it* -- Communication protocols carry the message to the destination.
+ *Receiver gets the message* -- The receiving system accepts and processes it.
+ *Response is returned* -- The receiver sends the result back to the sender.

= SUN Network File System (SUN NFS) / One Modern DFS.

== Definition

SUN NFS is a network file system developed by SUN Microsystems that provides transparent access to remote files.

== Properties

+ *Implementation + Specification* -- Defines how remote files are accessed.
+ *Transparency* -- Remote files appear like local files.
+ *Client-Server Model* -- A node can act as both client and server.
+ *Mount* -- Makes a remote file system visible to the client.
+ *Stateless* -- Each client request is self-contained.
+ *Machine & OS Independent* -- Works on different machines and operating systems.

#image("../../assets/image-3a.png",width: 80%)
+ *Protocol*
  - Uses SUN RPC for communication.
  - Uses XDR (External Data Representation) for machine-independent data representation.
  - Protocol is stateless.
  - Each procedure call contains all information required to complete the request.
  - Stateless design provides easy crash recovery.

+ *Server Side*
  - Provides a file handle to identify a file.
  - File handle contains:
    - File System ID → identifies disk partition.
    - I-node Number → identifies the file.
    - Generation Number → identifies the current version of the file.
  - File System ID is stored in the superblock.
  - Generation number is stored in the I-node.

+ *Client Side*
  - Provides a transparent interface to NFS.
  - Uses mount to make the remote file system visible.
  - Mapping between remote file name and remote file address is done through remote mount.

== NFS Operations

- Search for a file in a directory.
- Read directory entries.
- Create/manipulate links and directories.
- Read/Write file attributes.
- Read/Write file data.

= Distributed File System (DFS)
A Distributed File System (DFS) is a file system that stores files on multiple computers connected through a network and allows users to access them as if they were stored on their local computer.
==== Requirements of a Distributed File System

+ *Transparency*
  - Remote files should appear like local files to users.
+ *Location Independence*
  - Users should not need to know where a file is physically stored.
+ *Sharing*
  - Multiple users should be able to access and share files.
+ *Reliability*
  - Files should remain available even if a machine or network component fails.
+ *Fault Tolerance*
  - The system should continue working despite failures.
+ *Performance*
  - File access should be fast with minimum network delay.
+ *Scalability*
  - The system should support an increasing number of users, files and computers.
+ *Security*
  - Provides authentication, authorization and protection of files.
+ *Consistency*
  - Users should see correct and updated versions of shared files.

==== Importance of DFS

+ *Resource Sharing* -- Allows users to share files and storage resources.
+ *Easy Access* -- Remote files can be accessed like local files.
+ *Improved Availability* -- Replication can keep files available during failures.
+ *Better Performance* -- Data can be accessed from nearby or multiple servers.
+ *Scalability* -- Storage capacity can be increased by adding more machines.
+ *Centralized Management* -- Files can be managed across distributed servers.
+ *Cost Effective* -- Uses multiple ordinary computers instead of one very large system.
= DNS (Domain Name System)
DNS (Domain Name System) is a distributed naming system that converts human-readable domain names into IP addresses.
= Working Mechanism

+ Issue a DNS query to ask for IP address of #link("https://www.egnitenotes.com")[www.egnitenotes.com]
+ Issue a query to root name server.
+ Returns the IP address of TLD.
+ Issue a query and sent to TLD servers.
+ Reply with ns1.egnitenotes.com and IP address.
+ Issue another query and sent to ns1.egnitenotes.com
+ Reply IP address of #link("https://www.egnitenotes.com")[www.egnitenotes.com]
+ Return IP address of #link("https://www.egnitenotes.com")[www.egnitenotes.com] to client.
+ Request for web content to IP address of #link("https://www.egnitenotes.com")[www.egnitenotes.com]

==== Naming necessary in a distributed system?
Naming is necessary to uniquely identify and locate resources, services, computers, files, and objects in a distributed system.


===  Request Replay Protocol

Request Replay Protocol is a protocol used in distributed systems to handle lost or duplicated requests caused by communication or server failures.