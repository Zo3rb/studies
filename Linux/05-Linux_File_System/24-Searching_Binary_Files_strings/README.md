# 📖 Lesson: Searching Strings in Binary Files (`strings`)

> **Course Video:** `24 - Searching for Strings in Binary Files (strings)/Searching for Strings in Binary Files (strings).mp4`  
> **Module:** 05 — The Linux File System

---

## 🎯 What This Lesson Covers

- Why compiled binary files contain readable ASCII and UTF-8 strings.
- The `strings` command syntax and default behavior.
- Filtering by minimum string length (`-n`).
- Printing byte offsets (`-t d`, `-t x`) for reverse engineering and forensics.
- Scanning entire files vs initialized ELF sections (`-a`).
- Multi-byte character encodings (`-e`).
- Real-world use cases: discovering binary options, glibc symbol version verification, malware triage, and forensic incident response.

---

## 📝 Key Concepts

### 1. Why Do Binary Executables Contain Strings?

When source code (C, C++, Go, Rust) is compiled into a machine-code binary (an ELF file on Linux), human-readable strings do not disappear. They are stored verbatim in dedicated read-only data sections of the binary (such as `.rodata`, `.data`, and `.dynstr`):

- **String Literals:** Constant strings in source code (e.g., `printf("Usage: myapp [options]\n")`).
- **File System Paths:** Hardcoded configuration files, sockets, and lock files (e.g., `/etc/ssl/certs`, `/var/run/app.pid`).
- **Symbol Names:** Function names, exported APIs, and shared library dependencies (e.g., `malloc`, `connect`, `libc.so.6`).
- **Compiler & Toolchain Info:** GCC version, compiler flags, source filenames.
- **Error Messages & Help Text:** CLI usage instructions and panic messages.

The `strings` utility scans any binary or non-text file and extracts sequences of printable characters that are at least a specified length (default: 4 characters) terminated by a newline or NUL byte.

---

### 2. `strings` Options Reference Table

| Flag | Option Name | Description | Example |
| :--- | :--- | :--- | :--- |
| `-n N` or `-N` | Min length | Set minimum string length (default is 4) | `strings -n 8 /bin/ls` |
| `-t d` | Decimal offset | Print file offset before each string in decimal | `strings -t d binary.elf` |
| `-t x` | Hex offset | Print file offset in hexadecimal (ideal for hex editors like `xxd`) | `strings -t x binary.elf` |
| `-t o` | Octal offset | Print file offset in octal | `strings -t o binary.elf` |
| `-a` | All sections | Scan the entire file (not just initialized ELF data sections) | `strings -a core.dump` |
| `-e s` | Encoding: 7-bit | Default 7-bit ASCII | `strings -e s binary` |
| `-e l` | Encoding: 16-bit LE | 16-bit little-endian Unicode (common in Windows binaries / logs) | `strings -e l firmware.bin` |
| `-e b` | Encoding: 16-bit BE | 16-bit big-endian Unicode | `strings -e b firmware.bin` |

---

### 3. Practical DevOps & Security Use Cases

#### 1. Exploring Undocumented or Unman-paged Options in Binaries
```bash
# Check copyright, licensing, or feature strings inside /bin/ls:
strings /bin/ls | grep -i "copyright"
strings /bin/ls | grep -i "author"
```

#### 2. Determining Supported Glibc Versions
When compiling software or troubleshooting `version 'GLIBC_2.34' not found` errors:
```bash
strings /lib/x86_64-linux-gnu/libc.so.6 | grep "^GLIBC_" | tail -n 10
```

#### 3. Security Auditing & Malware Incident Response
When a server is compromised or an unfamiliar binary appears in `/tmp` or `/dev/shm`:
```bash
# Search for suspicious external IP addresses or domains:
strings /tmp/suspicious_binary | grep -E "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}"
strings /tmp/suspicious_binary | grep -E "https?://"

# Search for shell execution or reverse shell commands:
strings /tmp/suspicious_binary | grep -E "(bash|sh|exec|system|socket)"
```

#### 4. Extracting Text from Corrupted Files or Memory Dumps
If a database, core dump, or document file is corrupted and will not open in its native software, `strings` can recover raw readable text.

---

## ⚠️ Gotchas & Pro-Tips

- 🚨 **False Positives with Short Lengths:** The default minimum length of 4 characters (`-n 4`) generates many accidental ASCII matches from raw machine code bytes. In real analysis, use `-n 8` or `-n 10` to filter out garbage bytes.
- 💡 **Pairing with `grep`:** Piping `strings` into `grep` is the industry standard for binary inspection:  
  `strings binary | grep -i "password"`
- 💡 **Locating Offsets with `-t x`:** If you find a sensitive hardcoded string using `strings -t x binary`, you can immediately open `hexedit` or `xxd` at that exact hex offset to patch or analyze surrounding memory structures.

---

## 💡 Notes

<!-- Add your own notes here as you watch the video -->
