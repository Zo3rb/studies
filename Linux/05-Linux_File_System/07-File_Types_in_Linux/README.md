# 📖 Lesson: File Types in Linux

> **Course Video:** `7 - File Types in Linux (ls -F, file)/File Types in Linux (ls -F, file).mp4`  
> **Module:** 05 — The Linux File System

---

## 🎯 What This Lesson Covers

- The **7 distinct file types** recognized by the Linux kernel.
- Identifying file types using `ls -l` (the first character).
- Classifying files visually with `ls -F`.
- Inspecting file content and MIME types with the `file` command.

---

## 📝 Key Concepts

### 1. The 7 Linux File Types

In Linux, the "everything is a file" philosophy encompasses seven fundamental object types:

| Symbol (`ls -l`) | Indicator (`ls -F`) | File Type | Description | Common Locations / Examples |
| :---: | :---: | :--- | :--- | :--- |
| **`-`** | *(none)* or `*` | **Regular File** | Contains human-readable text, binary data, compiled executables, media, or archives. | `/etc/passwd`, `/bin/bash`, `document.pdf` |
| **`d`** | `/` | **Directory** | A special file containing a list of filename entries mapped to inode numbers. | `/home`, `/var/log`, `/etc` |
| **`l`** | `@` | **Symbolic Link** | A soft link containing a string pointing to another file or directory path. | `/bin -> usr/bin`, `/lib64 -> usr/lib64` |
| **`c`** | *(none)* | **Character Device** | Provides unbuffered, stream-oriented serial access to physical or virtual hardware (byte-by-byte). | `/dev/tty`, `/dev/null`, `/dev/zero`, `/dev/urandom` |
| **`b`** | *(none)* | **Block Device** | Provides buffered, random access to physical or virtual storage devices in fixed-size blocks. | `/dev/sda`, `/dev/nvme0n1`, `/dev/loop0` |
| **`p`** | `\|` | **Named Pipe (FIFO)** | First-In, First-Out queue used for inter-process communication (IPC) between two independent processes. | Created via `mkfifo /tmp/mypipe` |
| **`s`** | `=` | **Socket** | Bi-directional communication endpoint used for local or network inter-process communication. | `/var/run/docker.sock`, `/run/systemd/private` |

---

### 2. Identifying File Types via `ls -l`

The very first character of the 10-character permission string in `ls -l` indicates the file type:

```text
-rw-r--r--   1 root root  2800 Nov 18 00:00 passwd         -> '-' = Regular File
drwxr-xr-x   2 root root  4096 Nov 18 00:00 nginx          -> 'd' = Directory
lrwxrwxrwx   1 root root     7 Nov 18 00:00 bin -> usr/bin  -> 'l' = Symbolic Link
crw-rw-rw-   1 root root  1, 3 Nov 18 00:00 null           -> 'c' = Character Device
brw-rw----   1 root disk  8, 0 Nov 18 00:00 sda            -> 'b' = Block Device
prw-r--r--   1 ali  ali      0 Nov 18 00:00 app_pipe       -> 'p' = Named Pipe (FIFO)
srwxrwxr-x   1 root root     0 Nov 18 00:00 docker.sock    -> 's' = Unix Domain Socket
```

---

### 3. File Classification with `ls -F`

The `-F` (or `--classify`) flag appends a one-character symbol to entry names:

| Appended Symbol | File Classification |
| :---: | :--- |
| **`/`** | Directory |
| **`*`** | Executable file (has execute `x` permission) |
| **`@`** | Symbolic link |
| **`\|`** | FIFO / Named pipe |
| **`=`** | Socket |
| *(none)* | Regular non-executable file |

---

### 4. Deep Inspection with `file`

Because file extensions in Linux are purely conventions, the `file` utility determines the genuine format of a file by reading its header **magic bytes**:

```bash
# General syntax
file <filename>

# Inspect multiple files
file /etc/passwd /bin/bash /dev/null /dev/sda

# Output MIME type (standard format for web and API handling)
file -i /bin/bash
# Output: /bin/bash: application/x-pie-executable; charset=binary

# Follow symbolic links and identify the target (dereference)
file -L /bin/sh
```

Common `file` outputs:
- `ASCII text`
- `POSIX shell script, ASCII text executable`
- `ELF 64-bit LSB pie executable, x86-64`
- `gzip compressed data`
- `JPEG image data, JFIF standard 1.01`

---

## ⚠️ Gotchas & Pro-Tips

- 🚨 **Extensions don't make executables:** Renaming `script.sh` to `script.jpg` does NOT fool Linux. The kernel checks file permissions (`chmod +x`) and the shebang/ELF header. Running `./script.jpg` will still execute the shell script.
- 💡 **Character vs Block Devices:** Character devices (`c`) transfer data character-by-character without caching (ideal for mice, keyboards, terminal screens). Block devices (`b`) transfer fixed chunks (usually 512 or 4096 bytes) through the OS buffer cache (ideal for SSDs and hard disks).
- 💡 **Pipes block until both ends connect:** If you create a FIFO with `mkfifo /tmp/p` and run `cat /tmp/p`, `cat` will hang indefinitely until another process writes to `/tmp/p` (`echo "hello" > /tmp/p`).

---

## 💡 Notes

<!-- Add your own notes here as you watch the video -->
