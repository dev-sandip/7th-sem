#set text(font: "Charis SIL", size: 11pt, lang: "en")
#set par(justify: true)

= Distributed Heterogeneous Applications and CORBA

== Middleware

*Middleware* is a software layer between applications and the operating
system/network. It makes communication between distributed systems
easier by hiding network complexity.

=== Role of Middleware

- *Communication*: Allows processes on different computers to communicate.
- *Transparency*: Hides network details such as location and data transfer.
- *Interoperability*: Allows different operating systems, hardware, and
  programming languages to work together.
- *Remote Invocation*: Supports RPC, RMI, and CORBA for calling remote
  procedures or methods.
- *Data Conversion*: Converts data into a common format.
- *Naming*: Helps clients find remote objects and services.
- *Security*: Provides authentication and access control.
- *Fault Handling*: Helps handle communication and system failures.

== Homogeneous and Heterogeneous Distributed Systems

#table(
  columns: 2,
  [*Homogeneous System*], [*Heterogeneous System*],

  [Uses similar hardware and software.],
  [Uses different hardware and software.],

  [Usually uses the same operating system.],
  [May use different operating systems.],

  [Communication is easier.],
  [Communication is more complex.],

  [Easier to manage and maintain.],
  [More difficult to manage and maintain.],

  [Less need for middleware for compatibility.],
  [Uses middleware and standard protocols for interoperability.],

  [Example: Similar Linux computers.],
  [Example: Windows, Linux, and macOS computers working together.],
)

== RMI

*RMI (Remote Method Invocation)* is a mechanism that allows a program
to call a method of an object located on another computer as if it were
a local object.

=== Working of RMI

+ Client calls a method using a remote object reference.
+ The *stub* sends the request to the remote server.
+ The server receives the request and executes the method.
+ The result is sent back to the client.
+ The client receives the result.

*Example:* A client application requests account information from a
bank server using a remote method.

== CORBA

*CORBA (Common Object Request Broker Architecture)* is a standard
developed by the *Object Management Group (OMG)*.

It allows objects running on different computers and written in
different programming languages to communicate with each other.

=== CORBA Architecture

#image("../../assets/image-4a.png")

=== Components of CORBA

+ *Client*: Requests a service from a remote object.

+ *Stub*: Client-side proxy generated from IDL. It packs the request
  and sends it to the ORB.

+ *ORB (Object Request Broker)*: The main middleware of CORBA. It
  connects the client with the remote object and handles communication.

+ *IDL (Interface Definition Language)*: Defines the interface of a
  CORBA object in a language-independent way.

+ *Skeleton*: Server-side code generated from IDL. It receives requests
  from the ORB and passes them to the servant.

+ *Object Adapter (POA)*: Connects the ORB with the servant. It manages
  object activation, requests, and object lifetime.

+ *Servant*: The actual implementation of the remote object containing
  the business logic.

=== CORBA Environment

The main components of a CORBA environment are:

- *Client*
- *Client Stub*
- *ORB*
- *IDL*
- *Object Adapter*
- *Skeleton*
- *Servant*

Together, these components allow a client to invoke methods on remote
objects.

== Object Adapter

An *Object Adapter* is a component that connects the *ORB* with the
actual server object (servant).

Its main functions are:

- Activates and manages servants.
- Connects client requests to the correct servant.
- Manages object references and object lifetime.
- Helps the ORB communicate with server objects.

*POA (Portable Object Adapter)* is the commonly used object adapter
in CORBA.

== CORBA Services

CORBA provides several standard services for distributed objects.

+ *Naming Service*: Helps clients find objects using their names.

+ *Trading Service*: Helps clients find objects based on the services
  they provide.

+ *Event Service*: Supports event-based communication between objects.

+ *Transaction Service*: Manages distributed transactions.

+ *Security Service*: Provides authentication, authorization, and
  access control.

+ *Life Cycle Service*: Supports creation, deletion, copying, and
  movement of objects.

+ *Persistence Service*: Allows objects to save and restore their state.

+ *Concurrency Control Service*: Controls simultaneous access to
  shared objects.

== Invocation Methods in CORBA

Invocation means requesting a method of a remote CORBA object.

=== Synchronous Invocation

The client sends a request and *waits for the result*.

*Example:* Client asks a server for account balance and waits for the
answer.

=== Deferred Synchronous Invocation

The client sends the request but *does not wait immediately*. It can
perform other work and later collect the result.

=== One-Way Invocation

The client sends a request and *does not wait for a result*.

It is useful when the client does not need a response.

== Static and Dynamic Invocation

CORBA provides two approaches for invoking remote methods.

=== Static Invocation

In *static invocation*, the client knows the remote object's interface
in advance.

- IDL is used to define the interface.
- IDL compiler generates the *stub and skeleton*.
- Client uses the generated stub to make calls.
- It is easier and faster to use.

*Example:* A banking client already knows the `getBalance()` method.

=== Dynamic Invocation

In *dynamic invocation*, the client does not need a pre-generated stub
for the requested operation.

- Client discovers the required operation at runtime.
- It creates a request dynamically.
- The ORB sends the request to the remote object.
- It is more flexible but more complex.

#table(
  columns: 2,
  [*Static Invocation*], [*Dynamic Invocation*],

  [Interface is known at compile time.],
  [Interface can be discovered at runtime.],

  [Uses generated stubs.],
  [Creates requests dynamically.],

  [Simpler and faster.],
  [More flexible but more complex.],

  [Less runtime overhead.],
  [More runtime overhead.],
)

== RMI and CORBA

#table(
  columns: 2,
  [*RMI*], [*CORBA*],

  [Allows remote method calls between objects.],
  [Allows communication between distributed objects.],

  [Mainly associated with Java.],
  [Supports multiple programming languages.],

  [Uses Java interfaces and remote objects.],
  [Uses IDL to define language-independent interfaces.],

  [Best suited for Java-based systems.],
  [Suitable for heterogeneous systems.],
)
