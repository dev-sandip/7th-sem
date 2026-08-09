= CORBA(Common Object Request Broker Architecture):
It is a standard developed by OMG (Object Management Group) that allows objects on different computers and written in different programming languages to communicate and invoke methods on each other.
== Architecture Of CORBA
#image("assets/image-4.png")
+  *Client*
  - The part of the system that makes a request for a service.
  - The client calls methods on remote objects using a stub, which makes it seem like the object is local.
+  *Stub*
  - A proxy generated from the IDL (Interface Definition Language).
  - It handles marshalling (packing method parameters) and unmarshalling (unpacking results).
  - Bridges the client to the ORB.
+  *Object Request Broker (ORB)*
  - The core of CORBA.
  - It acts as a middleware, passing method calls from client to server.
  - Manages communication, object location, connection handling, and data conversion.
  - Ensures location transparency: clients don't need to know where the object is.
+  *IDL (Interface Definition Language)*
  - Used to define interfaces for CORBA objects in a language-neutral way.
  - Compilers generate the client stubs and server skeletons from this.
+  *Skeleton*
  - The server-side proxy also generated from IDL.
  - Receives calls from the ORB and forwards them to the servant (actual implementation).
+  *Object Adapter (POA -- Portable Object Adapter)*
  - Connects the ORB to the servant.
  - Manages object activation, request dispatch, and lifecycle.
  - Allows persistent or transient object references.
+  *Servant*
  - The actual implementation of the object that contains the business logic.
  - Responds to method calls forwarded from the skeleton.

#pagebreak()
 == Main CORBA Services

+ *Naming Service* \
  Provides names for distributed objects and helps clients locate objects.

+ *Trading Service* \
  Helps clients find objects based on the services they provide.

+   *Event Service* \
  Provides event-based communication between distributed objects.

+ *Transaction Service* \
  Manages distributed transactions and maintains consistency.


+ *Security Service* \
  Provides authentication, authorization and access control.


+ *Life Cycle Service* \
  Supports creation, deletion, copying and movement of objects.


+ *Persistence Service* \
  Allows objects to save and restore their state.


+ *Concurrency Control Service* \
  Controls simultaneous access to shared objects.


= Middleware
Middleware is a software layer that hides the complexity of network communication and allows distributed applications to communicate easily.



== Main Needs

*Simplifies Communication* \
Allows processes on different computers to communicate easily.

*Hides Network Complexity* \
Users/programmers do not need to handle network details directly.

*Location Transparency* \
Allows access to remote resources without knowing their physical location.

*Interoperability* \
Helps different operating systems, hardware and programming languages work together.

*Data Conversion* \
Converts data into a common format so different systems can understand it.

*Security* \
Provides authentication and access control.

*Reliability* \
Helps handle communication failures and remote system failures.

*Resource Sharing* \
Makes it easier to share files, objects, services and other resources.
== Roles of Middleware

+ *Communication*
  - Provides communication between processes running on different computers.
+ *Transparency*
  - Hides network details such as location, communication and data transfer from the user.
+ *Interoperability*
  - Allows different operating systems, hardware and programming languages to work together.
+ *Remote Invocation*
  - Supports RPC, RMI and CORBA for calling remote procedures or methods.
+ *Data Conversion*
  - Converts data into a common format so different systems can understand it.
+ *Naming & Service Discovery*
  - Helps clients locate remote services and objects.
+ *Security*
  - Provides authentication, authorization and secure communication.
+ *Fault Handling*
  - Helps detect and handle communication and system failures.

#table(
  columns: 2,
  [*Homogeneous Distributed System*], [*Heterogeneous Distributed System*],
  [All computers use *similar hardware and software*.], [Computers may use *different hardware and software*.],
  [Usually uses the *same operating system*.], [May use *different operating systems*.],
  [Communication and resource sharing are *easier*.], [Communication is more *complex*.],
  [Easier to manage and maintain.], [More difficult to manage and maintain.],
  [Provides better compatibility.], [Requires middleware/standard protocols for interoperability.],
  [Generally easier to implement.], [Generally more flexible and supports diverse systems.],
  [Example: A network of computers running *Linux with similar hardware*.], [Example: A network containing *Windows, Linux and macOS* systems.],
)

= Invocation Methods in CORBA

In CORBA, invocation methods describe how a client requests a service or method from a remote object.

There are three main invocation methods:

*Synchronous Invocation* \
In synchronous invocation, the client waits for the server to complete the operation and return the result.

*Deferred Synchronous Invocation* \
Here, the client sends the request but does not wait immediately for the result. The client can continue doing other work and later check/get the result.

*One-Way Invocation* \
In one-way invocation, the client sends a request and does not expect a reply.