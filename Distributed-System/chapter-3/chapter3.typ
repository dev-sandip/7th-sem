= Difference between Network OS and Distributed OS
#table(
  columns: 2,
  [*Network OS*], [*Distributed OS*],
  [Computers are *clearly separate* systems.], [Computers appear as *one single system*.],
  [Users know which machine they are accessing.], [*Location transparency* hides where resources are located.],
  [Each computer has its *own OS*.], [A common OS manages the distributed resources.],
  [Users explicitly access remote resources.], [Resources can be accessed almost like local resources.],
  [Example: *Windows Server, Linux server*.], [Example: *Amoeba, Plan 9*.],
)
= Difference between Threads vs Processes

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

== Why are Threads Important in Distributed Systems?

+ *Concurrency* -- Multiple tasks can execute at the same time.
+ *Better Performance* -- Threads can perform different operations concurrently.
+ *Efficient Resource Sharing* -- Threads share the same memory and resources.
+ *Responsiveness* -- One thread can continue working while another waits for network I/O.
+ *Parallelism* -- Threads can run on multiple processors/cores.
+ *Efficient Communication* -- Threads within a process can communicate through shared memory.

= Distributed Operating System (DOS)
A Distributed Operating System is an operating system that manages a collection of networked computers and makes them appear to users as a single integrated system.

== Monolithic Kernel vs Microkernel
#table(
  columns: 3,
  [*Feature*], [*Monolithic Kernel*], [*Microkernel*],
  [*Kernel Size*], [Large; contains most/all OS functions], [Small; contains only basic functions],
  [*Where Services Run*], [All services run inside the kernel], [Most services run outside the kernel as separate programs],
  [*Performance*], [Fast because services communicate directly inside the kernel], [Relatively slower due to extra communication],
  [*Reliability*], [Less reliable; one problem can affect the whole system], [More reliable; failure of one service may not affect others],
  [*Security*], [Kernel controls all resources], [Kernel provides basic security and protection],
  [*Design Complexity*], [Easier to design but difficult to update], [More complex due to separate components],
  [*Flexibility*], [Less flexible; difficult to add/change services], [More flexible; easy to add new services],
)

= Context Switching in OS

Context switching is the process of saving the state of a running process/thread and loading the state of another process/thread so the CPU can switch execution between them.

=== Why is it needed?

- Allows multitasking.
- Enables concurrent execution of processes/threads.
- Allows the CPU to switch when a process is waiting for I/O.
- Helps provide CPU sharing among processes.