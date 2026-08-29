#set text(
  font: "Charis SIL",
  size: 12pt,
  lang: "en",
)
= Operating System Support 
== Difference between Threads vs Processes

#table(
  columns: 2,
  [*Process*], [*Thread*],
  [A process is an *independent program in execution*.], [A thread is a *smallest unit of execution within a process*.],
  [Has its *own memory space*.], [Shares memory with other threads of the same process.],
  [Creation is *slower*.], [Creation is *faster*.],
  [Context switching is *costly*.], [Context switching is *less costly*.],
  [Communication uses *IPC*, which is relatively slower.], [Threads communicate easily through shared memory.],
  [Failure of one process usually does not affect another process.], [Failure of a thread may affect the whole process.],
)

=== Why are Threads Important in Distributed Systems?

+ *Concurrency* -- Multiple tasks can execute at the same time.
+ *Better Performance* -- Threads can perform different operations concurrently.
+ *Efficient Resource Sharing* -- Threads share the same memory and resources.
+ *Responsiveness* -- One thread can continue working while another waits for network I/O.
+ *Parallelism* -- Threads can run on multiple processors/cores.
+ *Efficient Communication* -- Threads within a process can communicate through shared memory.

== Distributed Operating System (DOS)
A Distributed Operating System is an operating system that manages a collection of networked computers and makes them appear to users as a single integrated system.

== Monolithic Kernel vs Microkernel

#table(
  columns: (1fr, 1fr),
  align: left,
  stroke: 0.5pt,
  [*Monolithic Kernel*], [*Microkernel*],
  [*Size:* Large; contains almost all operating system functions.], [*Size:* Small; contains only the most basic functions.],
  [*Service Location:* All services (like file systems and drivers) run inside the kernel.], [*Service Location:* Most services run outside the kernel as independent separate programs.],
  [*Performance:* Fast, because everything is packed together and communicates directly.], [*Performance:* Slower, because separate services have to send messages to talk to each other.],
  [*Reliability:* Low. If one small part crashes, the entire computer crashes.], [*Reliability:* High. If one service crashes, the rest of the system keeps running.],
  [*Security:* The kernel controls all resources directly.], [*Security:* The kernel provides basic protection, while services manage their own security.],
  [*Design & Updates:* Easier to design initially, but very hard to update later.], [*Design & Updates:* More complex to build, but much easier to update piece by piece.],
  [*Flexibility:* Very rigid; it is difficult to add or change services.], [*Flexibility:* Highly flexible; you can easily add new services without touching the core kernel.]
)

== Context Switching in OS

Context switching is the process of saving the state of a running process/thread and loading the state of another process/thread so the CPU can switch execution between them.

=== Why is it needed?

- Allows multitasking.
- Enables concurrent execution of processes/threads.
- Allows the CPU to switch when a process is waiting for I/O.
- Helps provide CPU sharing among processes.


== Operating System Layers
In a distributed system, software is usually divided into layers. Each layer has a specific job:
+ *Hardware Layer*: The physical parts of the computer (CPU, memory, hard drives). Its importance is to provide the actual computing power and storage.
+ *Operating System Kernel*: The core software that manages the local hardware. It is important because it allocates memory and CPU time to programs so they can run efficiently.
+ *Middleware Layer*: The software that connects different computers over a network to make them look like one system. It is important because it hides the complexity of the network from the applications.
+ *Application Layer*: The actual programs users interact with (like a web browser or a game). It is important because it provides the actual service the user needs.

== Network Operating System (NOS) vs. Distributed Operating System (DOS)
#table(
  columns: (1fr, 1fr),
  align: left,
  stroke: 0.5pt,
  [*Network Operating System (NOS)*], [*Distributed Operating System (DOS)*],
  [Users know there are multiple computers.], [The whole system looks like one single computer.],
  [Each computer runs its own independent operating system.], [One global operating system manages all computers.],
  [Low transparency (you have to manually log in to another machine).], [High transparency (the system decides where tasks run automatically).],
  [Easy to build and scale.], [Very complex to build and hard to manage.]
)

== Why Distributed Operating Systems (DOS) are not popular
Even though a true DOS perfectly hides all network complexities, it is extremely hard to build, hard to maintain, and very rigid. If a hardware or network failure occurs, a pure DOS often struggles to handle it gracefully. 

*How a DOS is realized practically:*
Instead of building a pure DOS from scratch, modern systems build a "fake" DOS. They install a standard *Network Operating System (NOS)* (like Linux or Windows) on every machine, and then run a powerful layer of software called *Middleware* on top of it. This combination gives users the illusion of a DOS without the extreme complexity of building one.

== Middleware and its Importance
*Middleware* is a software layer that sits between the operating system and the applications. It acts as "glue" that connects different computers, operating systems, and networks together.

*Importance:* 
It hides the messy details of the network. A developer can write an application without worrying about how data is sent over the cables, or whether the other computer is running Windows or Linux. Middleware handles all the translations and connections.

*Simple Block Diagram:*
#align(center)[
  #rect(
    inset: 10pt,
    stroke: 1pt,
    [
      *Applications* \
      --------------------------------- \
      *Middleware* (Hides network complexity) \
      --------------------------------- \
      *Local Operating Systems* (Windows, Linux, macOS) \
      --------------------------------- \
      *Hardware & Network*
    ]
  )
]



*Importance of Threads in Distributed Systems:*
Threads are crucial for high performance, especially for servers. 
*Example:* Imagine a web server receiving 1,000 requests per second. If the server creates a new *Process* for every request, it will run out of memory and crash. But if it creates a new *Thread* for each request, it can easily handle all 1,000 requests at the same time because threads use very little memory and share resources.

== Operating System Architectures

+ *Monolithic Architecture*: 
  In this design, every part of the operating system (file management, memory management, network drivers) is packed into one giant block (the kernel). 
  - _Pros_: It is very fast because all parts can talk to each other directly. 
  - _Cons_: If one tiny part (like a bad printer driver) crashes, the entire computer crashes.

+ *Microkernel Architecture*: 
  In this design, the core kernel is kept as small as possible. It only handles the most basic tasks (like letting parts communicate). All other services (like file systems or device drivers) run outside the kernel as normal programs.
  - _Pros_: Highly secure and stable. If a driver crashes, only that driver stops working, not the whole system.
  - _Cons_: Slightly slower because services have to send messages to each other through the central microkernel.