

= Network Security

*Network Security* is the process of protecting computers, networks, data, and communication from unauthorized access, modification, destruction, and attacks.

The main goals are:

- *Confidentiality:* Only authorized users can read the data.
- *Integrity:* Data should not be changed by unauthorized users.
- *Authentication:* Confirms the identity of a user or system.
- *Non-repudiation:* A sender should not be able to deny a valid communication.
- *Availability:* Network services should be available when required.

== Cryptography

*Cryptography* is the technique of converting readable information into an unreadable form to protect it from unauthorized users.

The original readable message is called *plaintext*.

The encrypted message is called *ciphertext*.

Basic process:

$"Plaintext" -> "Encryption" -> "Ciphertext"$

$"Ciphertext" -> "Decryption" -> "Plaintext"$

Important cryptography techniques:

- Symmetric key cryptography
- Asymmetric key cryptography
- RSA
- DES
- AES
- Digital Signature
- Diffie-Hellman

== Symmetric Key Cryptography

In *symmetric key cryptography*, the same secret key is used for both encryption and decryption.

$"Plaintext" -> "Encryption with " K -> "Ciphertext"$

$"Ciphertext" -> "Decryption with " K -> "Plaintext"$

Both sender and receiver must know the secret key.

=== Advantages

- Fast.
- Suitable for large amounts of data.
- Requires less processing power.

=== Disadvantages

- Key distribution is difficult.
- If the secret key is stolen, the communication can be decrypted.
- For many users, managing many secret keys becomes difficult.

Examples:

- DES
- AES

== Asymmetric Key Cryptography

*Asymmetric key cryptography* uses two different keys:

- *Public key:* Can be shared with everyone.
- *Private key:* Kept secret by the owner.

For encryption:

$"Plaintext" -> "Public Key" -> "Ciphertext"$

$"Ciphertext" -> "Private Key" -> "Plaintext"$

RSA is an example of asymmetric cryptography.

=== Advantages

- Solves the key-distribution problem better than symmetric encryption.
- Supports digital signatures.
- Public key can be freely distributed.

=== Disadvantages

- Slower than symmetric encryption.
- Requires more computation.
- Not normally preferred for encrypting large amounts of data directly.

== Symmetric vs Asymmetric Cryptography

#table(
  columns: (1.8fr, 2.7fr, 2.7fr),
  stroke: 0.5pt,

  [*Feature*], [*Symmetric*], [*Asymmetric*],

  [Keys], [One shared key], [Public and private keys],
  [Encryption], [Same secret key], [Public/private key pair],
  [Speed], [Fast], [Slower],
  [Key distribution], [Difficult], [Easier],
  [Large data], [Suitable], [Less suitable],
  [Digital signature], [Not normally used], [Supported],
  [Examples], [DES, AES], [RSA],
)

== RSA

*RSA* is an asymmetric/public-key cryptography algorithm.

RSA uses:

- Public key $(e,n)$
- Private key $(d,n)$

It is named after *Rivest, Shamir and Adleman*.

=== RSA Key Generation

The basic RSA steps are:

- Select two prime numbers $p$ and $q$.

- Calculate:

  $n = p times q$

- Calculate Euler's totient:

  $phi(n) = (p-1)(q-1)$

- Select a number $e$ such that:

  $1 < e < phi(n)$

  and:

  $gcd(e,phi(n)) = 1$

- Calculate $d$ such that:

  $e times d equiv 1 mod phi(n)$

- Public key is:

  $(e,n)$

- Private key is:

  $(d,n)$

=== RSA Encryption

If the plaintext number is $M$, ciphertext $C$ is:

$C = M^e mod n$

=== RSA Decryption

The plaintext is recovered using:

$M = C^d mod n$

= RSA Example

Let:

$p = 11$

$q = 17$

Calculate:

$n = 11 times 17 = 187$

Calculate:

$phi(n) = (11-1)(17-1)$

$phi(n) = 10 times 16 = 160$

Choose:

$e = 7$

because:

$gcd(7,160) = 1$

Find $d$:

$7 times 23 = 161$

Therefore:

$161 equiv 1 mod 160$

So:

$d = 23$

Therefore:

- Public key = $(7,187)$
- Private key = $(23,187)$

=== Encrypting "CAT"

Use:

$A=1, B=2, C=3, ..., Z=26$

Therefore:

$C=3$

$A=1$

$T=20$

For C:

$C = 3^7 mod 187$

$C = 130$

For A:

$C = 1^7 mod 187$

$C = 1$

For T:

$C = 20^7 mod 187$

$C = 147$

Therefore:

$"CAT" -> (130,1,147)$

== RSA Decryption

For the first ciphertext:

$M = 130^23 mod 187$

$M = 3$

Similarly:

$1^23 mod 187 = 1$

$147^23 mod 187 = 20$

Therefore:

$3,1,20 -> "CAT"$

This demonstrates both RSA encryption and decryption.

* RSA Exam Method*

For questions such as:

- Encrypt "security".
- Encrypt "network".
- Encrypt "PANDEMIC".
- Encrypt "HELLO".
- Encrypt "ROSE".
- Encrypt "Computer".
- Encrypt "COW".
- Encrypt "OVEL".
- Encrypt "DANGER".
- Encrypt "attack".

Use the key values *given in the question*.

If no key values are given, clearly state the small example key values you are using.

Then:

- Convert letters into numbers according to the mapping specified in the question.
- Calculate $C=M^e mod n$ for every plaintext number.
- Write the ciphertext.
- For decryption, calculate $M=C^d mod n$.
- Convert the resulting numbers back into letters.

*Important:* Do not invent a different key in the middle of the calculation.

== DES

*DES* stands for *Data Encryption Standard*.

It is a symmetric-key block cipher.

DES uses:

- 64-bit plaintext block.
- 64-bit key input.
- 56 effective key bits.
- 16 rounds of processing.

=== Basic DES Operation

- Plaintext is divided into 64-bit blocks.
- Initial permutation is performed.
- The block is divided into left and right halves.
- The data passes through 16 rounds.
- Each round uses a different round key.
- The two halves are combined.
- Final permutation is performed.
- Ciphertext is produced.

=== DES Round

For each round:

$L_i = R_(i-1)$

$R_i = L_(i-1) xor f(R_(i-1),K_i)$

where:

- $L$ = left half.
- $R$ = right half.
- $K_i$ = round key.
- $f$ = DES round function.

=== DES Advantages

- Simple and well studied.
- Historically widely used.
- Uses relatively simple hardware operations.

=== DES Disadvantages

- 56-bit effective key is too small for modern security.
- Vulnerable to brute-force attacks.
- It has been replaced by stronger algorithms such as AES.

== AES

*AES* stands for *Advanced Encryption Standard*.

AES is a symmetric block cipher and is widely used for secure data encryption.

AES supports:

- 128-bit key.
- 192-bit key.
- 256-bit key.

AES always uses a *128-bit data block*.

=== AES Encryption Steps

For AES:

- *AddRoundKey*
- *SubBytes*
- *ShiftRows*
- *MixColumns*
- *AddRoundKey*

The final round does not use MixColumns.

=== AES Advantages

- Strong security.
- Faster than RSA for bulk data encryption.
- Supports different key sizes.
- Efficient in software and hardware.
- More secure than DES.

== AES vs DES

#table(
  columns: (1.8fr, 2.7fr, 2.7fr),
  stroke: 0.5pt,

  [*Feature*], [*DES*], [*AES*],

  [Type], [Symmetric], [Symmetric],
  [Block size], [64 bits], [128 bits],
  [Key sizes], [56 effective bits], [128, 192, 256 bits],
  [Rounds], [16], [10, 12 or 14],
  [Security], [Weak by modern standards], [Strong],
  [Speed], [Slower by modern standards], [Fast],
  [Current use], [Mostly legacy], [Widely used],
)

== Digital Signature

A *digital signature* is a cryptographic technique used to verify the identity of the sender and the integrity of a message.

It provides:

- Authentication.
- Integrity.
- Non-repudiation.

=== Working of Digital Signature

- Sender creates a hash of the message.
- The sender encrypts the hash using the sender's private key.
- The encrypted hash becomes the digital signature.
- The message and signature are sent to the receiver.
- Receiver calculates the hash of the received message.
- Receiver uses the sender's public key to verify the signature.
- If both hashes match, the message is authentic and unchanged.

Basic idea:

$"Message" -> "Hash" -> "Private Key" -> "Digital Signature"$

* Digital Signature Does Not Mainly Provide*

A digital signature is mainly for:

- Authentication.
- Integrity.
- Non-repudiation.

It is not primarily used to provide confidentiality.

== Diffie-Hellman Algorithm

*Diffie-Hellman* is a key-exchange method.

It allows two parties to establish a shared secret key over an insecure network.

The actual secret key is not directly sent over the network.

=== Steps

Assume two users:

- Alice
- Bob

Public values:

- Prime number $p$
- Generator $g$

- Alice chooses a private number $a$.

- Alice calculates:

  $A = g^a mod p$

- Bob chooses a private number $b$.

- Bob calculates:

  $B = g^b mod p$

- Alice sends $A$ to Bob.

- Bob sends $B$ to Alice.

- Alice calculates:

  $K = B^a mod p$

- Bob calculates:

  $K = A^b mod p$

Both obtain the same shared secret:

$K = g^(a b) mod p$

=== Advantages

- Secret key is not directly transmitted.
- Useful for establishing a shared key.

==== Limitation

Basic Diffie-Hellman does not itself authenticate the communicating parties, so it can be vulnerable to a *man-in-the-middle attack* unless combined with authentication.

== PGP

*PGP* stands for *Pretty Good Privacy*.

It is used to secure email and other files.

PGP provides:

- Confidentiality.
- Authentication.
- Integrity.
- Digital signatures.

=== How PGP Secures Email

PGP commonly combines symmetric and asymmetric cryptography.

- Sender creates the message.
- Sender generates a temporary symmetric session key.
- Message is encrypted using the session key.
- Session key is encrypted using the receiver's public key.
- Encrypted message and encrypted session key are sent to the receiver.
- Receiver uses their private key to recover the session key.
- Receiver uses the session key to decrypt the message.

This combination gives:

- Symmetric encryption → fast data encryption.
- Asymmetric encryption → secure session-key exchange.

=== PGP with Digital Signature

For authentication and integrity:

- Sender creates a hash of the message.
- Sender signs the hash using their private key.
- The receiver uses the sender's public key to verify the signature.

== SSL/TLS

*SSL* stands for *Secure Sockets Layer*.

SSL was designed to provide secure communication over a network.

Modern systems use *TLS (Transport Layer Security)*, which replaced SSL.

SSL/TLS provides:

- Confidentiality.
- Authentication.
- Integrity.

=== Basic SSL/TLS Operation

- Client connects to the server.
- Server provides its certificate.
- Client verifies the server certificate.
- Secure cryptographic parameters are negotiated.
- A session key is established.
- Data is encrypted using the established session keys.
- Secure communication continues.

Example:

$"Browser" <-> "HTTPS Server"$

HTTPS commonly uses TLS to protect HTTP communication.

== IPSec

*IPSec* stands for *Internet Protocol Security*.

It is a collection of protocols used to secure IP communication.

IPSec provides:

- Authentication.
- Integrity.
- Confidentiality.
- Anti-replay protection.

It operates at the *network layer*.

Its types are:
=== AH

*AH* stands for *Authentication Header*.

AH provides:

- Data integrity.
- Data-origin authentication.
- Anti-replay protection.

AH does *not* provide encryption-based confidentiality.

=== ESP

*ESP* stands for *Encapsulating Security Payload*.

ESP can provide:

- Confidentiality.
- Data integrity.
- Authentication.
- Anti-replay protection.

ESP is widely used in VPNs.

=== AH vs ESP

#table(
  columns: (1.8fr, 2.7fr, 2.7fr),
  stroke: 0.5pt,

  [*Feature*], [*AH*], [*ESP*],

  [Authentication], [Yes], [Yes],
  [Integrity], [Yes], [Yes],
  [Confidentiality], [No], [Yes],
  [Anti-replay], [Yes], [Yes],
  [Encryption], [No], [Yes],
)

== VPN

*VPN* stands for *Virtual Private Network*.

A VPN creates a secure logical connection over a public network such as the Internet.

It protects communication by using encryption and other security mechanisms.

Example:

$"Office A" -> "Internet" -> "VPN Tunnel" -> "Office B"$

=== VPN Working

- User connects to a VPN server.
- VPN authentication takes place.
- A secure tunnel is established.
- Data is encrypted.
- Encrypted data travels through the Internet.
- VPN endpoint decrypts the data.
- Data reaches the destination securely.

=== Advantages of VPN

- Provides confidentiality.
- Protects data over public networks.
- Allows remote users to access private networks.
- Can connect geographically separated offices.
- Provides secure communication over the Internet.

=== Types of VPN

Common types include:

- *Remote Access VPN:* Connects an individual user to a private network.
- *Site-to-Site VPN:* Connects two or more complete networks.
- *Intranet VPN:* Connects offices within the same organization.
- *Extranet VPN:* Provides controlled access to external organizations.

== WEP

*WEP* stands for *Wired Equivalent Privacy*.

It was an older security mechanism for Wi-Fi networks.

WEP uses RC4-based encryption with a relatively weak security design.

=== Problems of WEP

- Weak security.
- IV reuse problems.
- Vulnerable to key-recovery attacks.
- Easy to break using modern tools.
- Replaced by stronger Wi-Fi security standards.

Modern Wi-Fi networks should use stronger standards such as WPA2 or WPA3.

== Firewall

A *firewall* is a security system that controls network traffic entering or leaving a network according to predefined security rules.

It acts as a barrier between a trusted network and an untrusted network.

Basic structure:

$"Internet" -> "Firewall" -> "Internal Network"$

=== How Firewall Protects a Network

- A packet reaches the firewall.
- Firewall examines the packet.
- It checks the configured security rules.
- If the packet is allowed, it is forwarded.
- If the packet violates the rules, it is blocked or dropped.
- The firewall may record the event in a log.

A firewall can control traffic based on:

- Source IP.
- Destination IP.
- Port number.
- Protocol.
- Connection state.
- Application information, depending on firewall type.

=== Types of Firewall

Important firewall types are:

- Packet filtering firewall.
- Stateful inspection firewall.
- Circuit-level gateway.
- Application-level gateway / proxy firewall.
- Next-generation firewall.

=== Packet Filtering Firewall

A *packet filtering firewall* examines individual packets and allows or blocks them according to rules.

Rules may use:

- Source IP address.
- Destination IP address.
- Source port.
- Destination port.
- Protocol.
- Interface.
- Direction.

Example:

Suppose the rule is: *Block TCP port 23*

The firewall drops Telnet traffic using TCP port 23.

==== Working

- Packet arrives at the firewall.
- Firewall reads packet header information.
- It compares the information with firewall rules.
- If a matching allow rule exists, the packet is forwarded.
- If a matching deny rule exists, the packet is dropped.
- If no rule matches, the default policy is applied.

=== Stateful Firewall

A *stateful firewall* keeps track of active network connections.

For example, when a client establishes a TCP connection, the firewall records information about that connection.

It can then distinguish between:

- Valid packets belonging to an existing connection.
- Unexpected packets that do not belong to a valid connection.

Advantages:

- More secure than simple packet filtering.
- Understands connection state.
- Can automatically allow valid return traffic.

=== Circuit-Level Gateway

A circuit-level gateway monitors TCP connections or sessions rather than examining the complete application data.

It checks whether a connection is permitted.

It generally does not inspect the actual application content in detail.

=== Application-Level Gateway

An *application-level gateway* is also called a *proxy firewall*.

It works at the application level.

It can inspect application-specific traffic such as:

- HTTP
- FTP
- SMTP

It can provide detailed control over application requests.

=== Firewall Types Comparison

#table(
  columns: (2fr, 2.4fr, 2.4fr),
  stroke: 0.5pt,

  [*Type*], [*Main Function*], [*Main Feature*],

  [Packet filtering], [Checks packet headers], [Simple and fast],
  [Stateful], [Checks connection state], [Tracks sessions],
  [Circuit-level], [Checks sessions/connections], [Controls connection establishment],
  [Application-level], [Checks application traffic], [Detailed inspection],
  [Next-generation], [Advanced traffic inspection], [Application/security awareness],
)

== Router ACL

*ACL* stands for *Access Control List*.

A router ACL is a list of rules used to permit or deny network traffic.

ACLs can control traffic based on:

- Source IP.
- Destination IP.
- Protocol.
- Port.
- Direction.

=== Standard and Extended ACL

*Standard ACL:*

- Mainly filters using source IP address.

*Extended ACL:*

- Can filter source IP.
- Destination IP.
- Protocol.
- Port number.

Therefore, extended ACL provides more control.

== ACL Example

Question: *Block incoming traffic from network 202.70.91.0/24 on FastEthernet interface.*

A simple extended ACL can be:

```text
Router(config)# access-list 100 deny ip 202.70.91.0 0.0.0.255 any
Router(config)# access-list 100 permit ip any any
Router(config)# interface fastethernet 0/0
Router(config-if)# ip access-group 100 in
```

Explanation:

- ACL 100 is created.
- Traffic from `202.70.91.0/24` is denied.
- Other IP traffic is permitted.
- The ACL is applied to the FastEthernet interface.
- `in` means incoming traffic.

The wildcard mask for `/24` is $0.0.0.255$.

*Note:* The interface number depends on the router topology given in the question, so use the actual FastEthernet interface specified by the diagram.

== Network Security Threats

Common threats include:

- Eavesdropping.
- Data modification.
- Masquerading.
- Replay attack.
- Denial of Service.
- Man-in-the-middle attack.
- Malware.
- Password attacks.

=== Eavesdropping

An attacker secretly listens to communication.

Encryption helps protect the information.

=== Masquerading

An attacker pretends to be a legitimate user or system.

Authentication helps prevent this.

=== Replay Attack

An attacker captures a valid message and sends it again later.

Timestamps, sequence numbers, and anti-replay mechanisms can help prevent it.

=== Man-in-the-Middle Attack

An attacker secretly places themselves between two communicating parties.

Authentication and secure key-exchange mechanisms help prevent this attack.

== Secure Communication

Secure communication means transferring information so that unauthorized users cannot read, modify, or impersonate the communication.

The desirable properties are:

- *Confidentiality:* Prevent unauthorized reading.
- *Integrity:* Prevent unauthorized modification.
- *Authentication:* Verify communicating parties.
- *Non-repudiation:* Prevent denial of a valid action.
- *Availability:* Keep services accessible.

== Network Security vs Cryptography

#table(
  columns: (2fr, 2.7fr, 2.7fr),
  stroke: 0.5pt,

  [*Concept*], [*Meaning*], [*Examples*],

  [Network Security], [Protects networks and systems], [Firewall, IDS, VPN],
  [Cryptography], [Protects information using mathematical techniques], [RSA, AES, DES],
)

== IDS

*IDS* stands for *Intrusion Detection System*.

It monitors network or system activity and detects suspicious or malicious behavior.

When an attack is detected, it can generate an alert.

=== Types of IDS

- *NIDS:* Network-based Intrusion Detection System.
- *HIDS:* Host-based Intrusion Detection System.

=== IDS vs Firewall

#table(
  columns: (1.8fr, 2.7fr, 2.7fr),
  stroke: 0.5pt,

  [*Feature*], [*Firewall*], [*IDS*],

  [Main purpose], [Controls traffic], [Detects suspicious activity],
  [Action], [Allows or blocks], [Usually alerts/logs],
  [Focus], [Traffic control], [Attack detection],
)

== SMTP Security

*SMTP* stands for *Simple Mail Transfer Protocol*.

It is used to send email between mail systems.

Basic operation:

- Sender's mail client sends the email to a mail server.
- The mail server processes the message.
- SMTP transfers the message between mail servers.
- The receiver's mail server stores the message.
- The receiver accesses the message using an email retrieval protocol such as IMAP or POP3.

SMTP itself is not inherently end-to-end encrypted. Modern email systems commonly use TLS to protect SMTP connections between systems.

* How to Maintain Security in a Communication Network*:

A network can be secured using:

- *Encryption:* Protect sensitive data.
- *Authentication:* Verify users and devices.
- *Firewalls:* Filter unwanted traffic.
- *VPN:* Protect communication over public networks.
- *IDS/IPS:* Detect or prevent attacks.
- *Access control:* Give users only required permissions.
- *Secure protocols:* Use HTTPS, TLS, SSH, and other secure protocols.
- *Strong passwords:* Prevent unauthorized access.
- *Regular updates:* Fix security vulnerabilities.
- *Monitoring and logging:* Detect unusual activity.
- *Backup:* Recover data after failures or attacks.
