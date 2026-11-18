# 📖 Lesson: Find and Exec (`-exec`, `-ok`, `xargs`)

> **Course Video:** `22 - Find and Exec/Find and Exec.mp4`  
> **Module:** 05 — The Linux File System

---

## 🎯 What This Lesson Covers

- Taking automated action on search results using `find ... -exec`.
- The `{}` placeholder and the difference between `\;` (one-by-one) and `+` (batched).
- Interactive execution prompts using `-ok`.
- The native `-delete` action and its safety precautions.
- Combining `find` with `xargs` using null delimiters (`-print0` and `-0`).
- Performance comparison: `-exec ... \;` vs `-exec ... +` vs `xargs`.
- Practical production patterns: bulk permission fixing, archiving, log deletion, and configuration search.

---

## 📝 Key Concepts

### 1. The `-exec` Action Syntax

`find` is not just a query tool; it can directly manipulate matched files via the `-exec` action.

```bash
find <path> <criteria> -exec <command> {} \;
# OR
find <path> <criteria> -exec <command> {} +
```

- **`{}` (Curly Braces):** Replaced by the path of each matched file.
- **`\;` (Escaped Semicolon):** Marks the end of the `-exec` command. It executes the command **separately for each individual file** found. (e.g., 500 files = 500 process forks).
- **`+` (Plus Sign):** Batches multiple filenames into a **single command invocation**, passing them all as multiple arguments (e.g., `chmod 644 file1 file2 file3 ...`). Significantly faster!

```
-exec command {} \;   -->  fork/exec cmd file1
                           fork/exec cmd file2
                           fork/exec cmd file3

-exec command {} +    -->  fork/exec cmd file1 file2 file3
```

---

### 2. Syntax Comparison: `\;` vs `+` vs `-ok` vs `xargs`

| Method | Behavior | Process Invocations | Best For |
| :--- | :--- | :--- | :--- |
| `-exec cmd {} \;` | Runs `cmd` once per file | $N$ processes for $N$ files | Commands requiring single-argument targets (e.g., `mv file dir/`) |
| `-exec cmd {} +` | Groups arguments together | Minimal processes (respects `ARG_MAX`) | High-performance bulk actions (`chmod`, `chown`, `rm`) |
| `-ok cmd {} \;` | Prompts for confirmation before each run | Interactive user confirmation ($y/n$) | High-risk destructive tasks (manual deletion) |
| `find -print0 \| xargs -0 cmd` | Streams null-delimited paths into xargs | Batched processes | Pipelining with complex secondary processing |
| `-delete` | Directly unlinks files using system call | 0 fork processes (internal C syscall) | Fastest deletion of files/empty dirs |

---

### 3. Practical Production Workflows

#### 1. Web Root Permission Standardization
In production web servers (e.g., Nginx, Apache), standard security dictates directories must be `755` (`drwxr-xr-x`) and files `644` (`-rw-r--r--`):
```bash
# Fix all directory permissions in bulk:
find /var/www/html -type d -exec chmod 755 {} +

# Fix all regular file permissions in bulk:
find /var/www/html -type f -exec chmod 644 {} +
```

#### 2. Log Pruning and Archival
```bash
# Safely remove .log files older than 30 days:
find /var/log/myapp -type f -name "*.log" -mtime +30 -delete

# Compress .log files older than 7 days that are not already gzipped:
find /var/log/myapp -type f -name "*.log" ! -name "*.gz" -mtime +7 -exec gzip {} +
```

#### 3. Finding and Copying Files into a Target Directory
```bash
# Using the -t (target directory) option of cp:
find /etc -maxdepth 2 -name "*.conf" -exec cp -t /backup/configs/ {} +
```

#### 4. Safe Filename Handling with Spaces (`xargs -0`)
If filenames contain spaces, newlines, or quotes, standard piping breaks. Using null-byte separators (`-print0` and `-0`) guarantees 100% reliability:
```bash
find /data -type f -name "*.mp3" -print0 | xargs -0 -I{} cp {} /music_backup/
```

---

## ⚠️ Gotchas & Pro-Tips

- 🚨 **The `-delete` Pitfall:** `-delete` turns on `-depth` automatically (processes directory contents before directory itself). Always test your find query with `-print` **BEFORE** replacing `-print` with `-delete` or `-exec rm -f {} +`!
- 🚨 **`{}` placement in `-exec ... +`:** With `+`, `{}` must be the **last** argument before `+`. You cannot run `-exec cp {} /backup/ +` because `+` expects filenames appended at the very end. Use `cp -t /backup/ {} +` instead.
- 💡 **Process Fork Overhead:** For 10,000 files, `-exec rm {} \;` calls the `rm` binary 10,000 times, causing huge CPU and context-switch overhead. `-exec rm {} +` executes `rm` in just 2 or 3 batched invocations, completing in milliseconds.

---

## 💡 Notes

<!-- Add your own notes here as you watch the video -->
