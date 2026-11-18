# 📖 Lesson: Understanding File Timestamps — atime, mtime, ctime

> **Course Video:** `5 - Understanding File Timestamps - atime, mtime, ctime (stat, touch, date)/Understanding File Timestamps - atime, mtime, ctime (stat, touch, date).mp4`  
> **Module:** 05 — The Linux File System

---

## 🎯 What This Lesson Covers

- The three core timestamps in the Linux inode: `atime`, `mtime`, and `ctime`.
- Inspecting timestamps with `stat`.
- Manipulating timestamps with `touch` flags (`-a`, `-m`, `-t`, `-d`, `-r`).
- Working with the `date` command.
- Filesystem mount optimizations (`relatime`, `noatime`).

---

## 📝 Key Concepts

### 1. The Three Inode Timestamps

In Linux, file timestamps are recorded in the file's **inode** (the filesystem data structure describing the file). Unlike Windows, which records Creation Time, traditional Unix filesystems track:

| Timestamp | Full Name | Trigger Event | Triggered by Commands |
| :--- | :--- | :--- | :--- |
| **`atime`** | **Access Time** | Updated when file content is **read** or executed by a process. | `cat`, `less`, `grep`, `head`, running a script/binary |
| **`mtime`** | **Modification Time** | Updated when file **content is modified** (data written, appended, or truncated). | `echo >> file`, editing in `vim`, `nano`, redirection `>` |
| **`ctime`** | **Change Time** | Updated when file **metadata or inode attributes change**. | `chmod`, `chown`, `mv`, creating hard links, or any `mtime` update |

> [!IMPORTANT]
> - Whenever `mtime` updates, `ctime` **also** updates automatically (because changing content alters file size and block allocation metadata).
> - However, changing metadata (such as `chmod 755 file`) updates `ctime` **without** altering `mtime`!
> - **You CANNOT manually forge `ctime` with `touch`!** The kernel updates `ctime` based strictly on system clock time whenever an inode modification occurs.

---

### 2. Inspecting Timestamps with `stat`

The `stat` command provides detailed file status and decodes all inode timestamps down to nanoseconds:

```bash
stat filename.txt
```

Example output:
```text
  File: filename.txt
  Size: 42         	Blocks: 8          IO Block: 4096   regular file
Device: 8,1        	Inode: 1048578     Links: 1
Access: (0664/-rw-rw-r--)  Uid: ( 1000/   ali)   Gid: ( 1000/   ali)
Access: 2026-11-18 00:50:12.123456789 +0200   <-- atime
Modify: 2026-11-18 00:48:00.000000000 +0200   <-- mtime
Change: 2026-11-18 00:49:30.987654321 +0200   <-- ctime
 Birth: 2026-11-18 00:45:00.000000000 +0200   <-- btime (ext4/btrfs)
```

Useful `stat` format specifiers (`stat -c`):
| Specifier | Output |
| :--- | :--- |
| `%x` / `%X` | Human-readable `atime` / Epoch seconds |
| `%y` / `%Y` | Human-readable `mtime` / Epoch seconds |
| `%z` / `%Z` | Human-readable `ctime` / Epoch seconds |
| `%w` / `%W` | Human-readable `btime` (birth/creation) / Epoch seconds |

---

### 3. Manipulating Timestamps with `touch`

The primary purpose of `touch` is updating file timestamps. If the target file does not exist, `touch` creates an empty file.

| Command Syntax | Action |
| :--- | :--- |
| `touch file.txt` | Updates both `atime` and `mtime` to current system time. |
| `touch -a file.txt` | Updates **only** Access Time (`atime`). |
| `touch -m file.txt` | Updates **only** Modification Time (`mtime`). |
| `touch -t [[CC]YY]MMDDhhmm[.ss] file` | Sets explicit timestamp: Century, Year, Month, Day, Hour, Minute, Seconds. |
| `touch -d "YYYY-MM-DD HH:MM:SS" file` | Sets timestamp using flexible human-readable date string. |
| `touch -r source.txt target.txt` | Reference file: copies timestamps from `source.txt` to `target.txt`. |
| `touch -c file.txt` | Do not create file if it does not already exist (no-create). |

Examples:
```bash
# Set mtime to Jan 15, 2025 at 14:30
touch -t 202501151430.00 document.txt

# Set mtime using natural language string
touch -d "2 days ago" document.txt
touch -d "yesterday 18:00" document.txt
```

---

### 4. System Time with `date`

```bash
# Current date and time
date

# Current timestamp in UTC
date -u

# Format date output (useful in automation and log naming)
date "+%Y-%m-%d_%H-%M-%S"
# Example output: 2026-11-18_00-50-12
```

---

## ⚠️ Gotchas & Pro-Tips

- 🚨 **`relatime` Mount Option:** In modern Linux distributions (including Ubuntu), filesystems are mounted with the `relatime` (relative atime) flag by default in `/etc/fstab`. To prevent constant, excessive disk writes every time a file is read, the kernel only updates `atime` if the previous `atime` is older than the `mtime` or `ctime`, or if more than 24 hours have elapsed.
- 💡 **Build tools rely on `mtime`:** Build systems like `make`, Webpack, and compiler caches determine whether a source file needs recompiling by comparing its `mtime` against the binary's `mtime`. Running `touch file.c` forces `make` to recompile the file without changing a single line of code.
- 💡 **Forensics and `ctime`:** Because a normal user (or even a malicious process) cannot directly overwrite `ctime` to a past timestamp, security investigators use `ctime` to detect file tampering, permission changes, or rootkits.

---

## 💡 Notes

<!-- Add your own notes here as you watch the video -->
