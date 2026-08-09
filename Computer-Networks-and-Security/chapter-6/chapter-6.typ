#set page(paper: "a4", margin: (x: 2cm, y: 2.5cm))
#set text(font: "Charis SIL", size: 11pt, lang: "en")
#set par(justify: true)

= Application Layer

The *Application Layer* is the topmost layer in the OSI model, serving as the direct interface between network applications and the underlying communication infrastructure. It enables user applications such as web browsers, email clients, and remote management tools to access network services, format messages, and exchange data over local or wide-area networks.

== World Wide Web (WWW)

The World Wide Web is a global framework of interlinked hypertext documents accessed via the Internet using web browsers and Uniform Resource Locators (URLs). Built primarily around HTTP and HTTPS protocols, it facilitates information sharing and retrieval on a global scale.

=== HTTP vs. HTTPS

*HTTP* (Hypertext Transfer Protocol) is an unencrypted application-layer protocol operating on a request-response model. It is stateless, meaning each client request is processed independently without retaining session data from prior interactions. *HTTPS* (Hypertext Transfer Protocol Secure) extends HTTP by integrating SSL/TLS encryption. It establishes an encrypted channel between the client and server to protect transmitted data against eavesdropping, interception, and tampering.

#table(
  columns: (1fr, 1fr),
  align: left,
  table.header(
    [*HTTP*], 
    [*HTTPS*]
  ),
  [Transmits data in unencrypted plain text.], [Encrypts all traffic using SSL/TLS protocols.],
  [Listens on default Port 80.], [Listens on default Port 443.],
  [Does not require security certificates.], [Requires a valid SSL/TLS certificate.],
  [Vulnerable to packet sniffing and tampering.], [Ensures data privacy and message integrity.],

  [Lower processing overhead (no encryption).], [Slight encryption/decryption CPU overhead.],
  [Suited for public, non-sensitive web pages.], [Standard for modern web, banking, and auth.]
)

== File Transfer Protocols

File transfer protocols manage the structured exchange, upload, and download of files across TCP/IP networks.

- *FTP (File Transfer Protocol)*: A standard protocol utilizing TCP for file operations. It separates communication into two distinct channels: a *Control Connection* for commands and responses, and a *Data Connection* for actual file transfers. Standard FTP lacks encryption and sends credentials in plaintext.
- *TFTP (Trivial File Transfer Protocol)*: A lightweight, stripped-down protocol running over UDP. Designed for simplicity and low overhead, it lacks authentication, directory navigation, and encryption. It is primarily used for system bootstrapping, network device configuration, and local transfers.
- *File Transfer Clients*: Secure file operations rely on specialized utilities like *WinSCP* (a GUI-based Windows client supporting SFTP and SCP protocols for remote management) and *PuTTY* (an open-source terminal emulator providing encrypted SSH command-line access to remote servers).

== Electronic Mail (Email)

Email communication relies on a cooperative architecture composed of three primary functional elements:

+ *User Agent (UA)*: The software application (e.g., Gmail web interface, Outlook, Thunderbird) used by clients to draft, organize, and read messages.
+ *Mail Transfer Agent (MTA)*: Server-side software (e.g., Postfix, Sendmail) responsible for routing and transferring emails between servers across the Internet.
+ *Mail Delivery Agent (MDA)*: The local component (e.g., Dovecot) that accepts incoming emails from an MTA and writes them to the recipient's mailbox storage.

=== Email Protocols: POP3 vs. IMAP

*SMTP* (Simple Mail Transfer Protocol) is used exclusively to send and relay email messages from a client to a server, or between mail servers. Receiving messages from a mailbox server requires access protocols such as POP3 or IMAP.

#table(
  columns: (1fr, 1fr),
  align: left,
  table.header(
    [*POP3*], 
    [*IMAP*]
  ),
  [Downloads email to a local storage device.], [Reads and manages emails on the central server.],
  [Deletes mail from server after download.], [Retains mail on server across sessions.],
  [Optimized for single-device offline access.], [Built for multi-device real-time sync.],
  [Local actions (read/delete) do not sync.], [Changes immediately sync across all devices.],
  [Consumes minimal server disk space.], [Requires higher server storage capacity.],
  [Limited folder and search capabilities.], [Supports remote folder creation and search.],
  [Uses Port 110 (plain) / Port 995 (SSL).], [Uses Port 143 (plain) / Port 993 (SSL).]
)

== Domain Name System (DNS)

DNS is a hierarchical and distributed database that translates human-readable domain names (such as `example.com`) into machine-routable numerical IP addresses.

=== Resolution Process (Step-by-Step)

When a client requests a domain name, resolution follows a 6-step lookup chain:

+ *Browser Cache*: The browser checks its internal cache for a recent IP mapping.
+ *Local Resolver*: If uncached, the query goes to the Local DNS Resolver (usually provided by an ISP or custom network).
+ *Root Name Server*: The resolver queries a Root Server (`.`), which points to the relevant Top-Level Domain (TLD) server.
+ *TLD Name Server*: The TLD server (e.g., `.com`) returns the address of the domain's Authoritative Server.
+ *Authoritative Server*: The resolver queries the Authoritative Name Server, which holds the official IP address record.
+ *Response & Cache*: The resolver receives the IP, caches it locally for future speed, and returns it to the client to open the connection.

#align(center)[
  #image("/assets/image-5.png", width: 70%)
]

=== Hierarchy and Architecture

The Domain Name Space is structured like an inverted tree:

- *Root Domains (`.`)*: The apex of the hierarchy managed by IANA, directing queries to global TLD servers.
- *Top-Level Domains (TLDs)*: Divided into generic TLDs (`.com`, `.org`) and country-code TLDs (`.uk`, `.np`).
- *Authoritative Name Servers*: Host specific zone records for second-level domain registrations.
- *DNS Caching & Resolvers*: Temporary storage structures and query handlers that reduce query latency across the internet.

== Peer-to-Peer (P2P) Architecture

In a Peer-to-Peer network, participating nodes (*peers*) function as both clients and servers simultaneously, distributing work without relying on centralized host systems.

Peers perform peer discovery, query adjacent nodes, and exchange files directly. P2P offers scalable capacity, fault tolerance, and reduced centralized hardware costs. However, it consumes substantial upload/download bandwidth, lacks centralized administrative control, and presents security risks regarding unverified traffic and illegal content distribution.

== Socket Programming

Socket programming provides an API for configuring application-level network communication. A *Socket* represents a network communication endpoint defined by combining an *IP Address* and a *Port Number*. Applications use stream sockets (TCP) for reliable connection-oriented transport or datagram sockets (UDP) for low-overhead connectionless transport.

== Proxy Servers & Web Caching

A Proxy Server operates as an intermediate node between client devices and destination web servers, intercepting and evaluating network traffic.

Primary functions include:

- *Caching*: Storing frequently requested web assets to reduce bandwidth overhead and lower response latency.
- *Content Filtering*: Intercepting traffic to enforce access control rules and block malicious domain requests.
- *Anonymity*: Masking local IP addresses and internal network topologies from public servers.

#table(
  columns: (1fr, 1fr),
  align: left,
  table.header(
    [*Proxy Type*], 
    [*Behavior*]
  ),
  [Transparent Proxy], [Forwards client IP; used for local caching and network policy enforcement.],
  [Anonymous Proxy], [Hides the real client IP address from destination servers.],
  [High Anonymity Proxy], [Hides client IP and conceals the fact that a proxy is being used.],
  [Distorting Proxy], [Sends a modified or false client IP address to destination servers.]
)