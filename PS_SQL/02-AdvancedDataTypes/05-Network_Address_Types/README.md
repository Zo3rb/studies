# 🌐 Lesson 5: Network Address Types in PostgreSQL

PostgreSQL offers specialized native network address types (`inet`, `cidr`, `macaddr`, `macaddr8`) that validate IP/MAC formats, save storage space, and enable fast IP subnet searches.

---

## 1. The Network Data Types

| Data Type | Storage | Description | Best For |
| :--- | :--- | :--- | :--- |
| **`inet`** | 7 or 19 bytes | IPv4 and IPv6 hosts and networks (allows host address with optional netmask). | User login IP logging, firewall rules, server tracking. |
| **`cidr`** | 7 or 19 bytes | Strict IPv4 and IPv6 network subnets (requires host bits to be zero). | Subnet routing tables, network segment definitions. |
| **`macaddr`** | 6 bytes | 6-byte Ethernet MAC hardware addresses (`08:00:2b:01:02:03`). | Hardware device tracking, router logs. |
| **`macaddr8`** | 8 bytes | 8-byte EUI-64 MAC hardware addresses. | IoT device logs, modern network cards. |

---

## 2. Subnet Containment Operators

PostgreSQL supports native network comparison operators:

| Operator | Description | Example |
| :---: | :--- | :--- |
| **`<<`** | Strictly contained by subnet | `'192.168.1.50'::inet << '192.168.1.0/24'::cidr` (Returns TRUE) |
| **`<<=`** | Contained by or equal to | `'192.168.1.0/24'::cidr <<= '192.168.1.0/24'::cidr` (Returns TRUE) |
| **`>>`** | Strictly contains | `'10.0.0.0/8'::cidr >> '10.1.2.3'::inet` (Returns TRUE) |
| **`&&`** | Contains or is contained by | Subnet overlap check |

---

## 3. Network Helper Functions

*   **`host(inet)`:** Extracts the host IP address as text without netmask (e.g. `'192.168.1.5'`).
*   **`masklen(inet)`:** Returns the netmask prefix length (e.g. `24`).
*   **`network(inet)`:** Extracts the network part of an IP address.

---

## 🛠️ Practice Exercises

To complete this lesson:
1. Open DBeaver.
2. In the empty **`trainings`** database, execute [practice_trainings.sql](./practice_trainings.sql) to store IPv4/IPv6 addresses, query subnets using `<<` containment, and extract host IP strings.
3. In the **`dvdrental`** database, execute [practice_dvdrental.sql](./practice_dvdrental.sql) to practice filtering synthetic user login IP address logs.
