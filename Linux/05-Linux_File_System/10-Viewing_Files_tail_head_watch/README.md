# 📖 Lesson: Viewing Files — Part 3 (head, tail, watch)

> **Course Video:** `10 - Viewing Files - Part 3  (tail, head, watch)/Viewing Files - Part 3  (tail, head, watch).mp4`  
> **Module:** 05 — The Linux File System

---

## 🎯 What This Lesson Covers

- Peeking at file headers with `head` (`-n`, `-c`, negative offsets).
- Inspecting file footers and live streaming with `tail` (`-n`, `+N`, `-f`, `-F`).
- Extracting exact line ranges by combining `head` and `tail`.
- Repeating and monitoring commands over time with `watch` (`-n`, `-d`, `-t`).
- Handling log rotation safely in production environments.

---

## 📝 Key Concepts

### 1. The `head` Command

`head` prints the beginning (first lines or bytes) of one or more files to standard output. By default, it prints the first **10 lines**.

| Command Syntax | Action & Behavior |
| :--- | :--- |
| `head file.txt` | Print the first 10 lines. |
| `head -n 5 file.txt` | Print the first **5 lines**. |
| `head -n -15 file.txt` | Print **all lines except the last 15 lines** of the file. |
| `head -c 100 file.txt` | Print the first **100 bytes** of the file. |
| `head -q -n 5 file1 file2` | Quiet mode: suppress file header banners when multiple files are passed. |

---

### 2. The `tail` Command

`tail` prints the end (last lines or bytes) of files. By default, it prints the last **10 lines**.

| Command Syntax | Action & Behavior |
| :--- | :--- |
| `tail file.txt` | Print the last 10 lines. |
| `tail -n 20 file.txt` | Print the last **20 lines**. |
| `tail -n +50 file.txt` | Print lines starting **from line 50 through to the end** of the file. |
| `tail -c 512 file.txt` | Print the last **512 bytes**. |
| `tail -f file.txt` | **Follow mode:** Continuously monitor and print new lines as they are appended in real-time. |
| `tail -F file.txt` | **Follow & Retry mode:** Follows by filename, automatically reopening if the file is recreated or rotated. |

---

### 3. Critical Production Concept: `tail -f` vs. `tail -F`

In production Linux servers, utilities like `logrotate` compress and rotate active logs at midnight (e.g. `access.log` becomes `access.log.1`, and a brand new empty `access.log` is created).

```
               tail -f access.log
                     |
       (Tracks underlying Inode 1001)
                     |
       [Logrotate renames file to access.log.1]
                     |
  🚨 tail -f STOPS receiving new logs! (Still stuck on old inode)

------------------------------------------------------------------

               tail -F access.log
                     |
       (Tracks filename "access.log" and retries)
                     |
       [Logrotate renames file to access.log.1]
       [New access.log created with Inode 2002]
                     |
  ✅ tail -F detects file rename, reopens "access.log", and keeps streaming!
```

> [!IMPORTANT]
> **Always use `tail -F` (capital F)** when monitoring live server logs in production!

---

### 4. Extracting Arbitrary Line Ranges

You can slice any specific range of lines by combining `head` and `tail` in a pipe:

```bash
# Example: Extract exactly lines 20 through 25 from a file
head -n 25 file.txt | tail -n 6
```
*Logic:* `head -n 25` captures the first 25 lines; `tail -n 6` then takes the bottom 6 lines of that slice (lines 20, 21, 22, 23, 24, 25).

---

### 5. Periodically Repeating Commands with `watch`

The `watch` utility executes a program periodically and displays the output full-screen, allowing you to observe how output changes over time.

| Command Syntax | Explanation |
| :--- | :--- |
| `watch command` | Runs `command` every **2.0 seconds** (default). |
| `watch -n 1 command` | Runs `command` every **1 second**. |
| `watch -n 0.5 command` | Runs `command` every **500 milliseconds**. |
| `watch -d command` | **Highlights differences** between successive updates in inverse video. |
| `watch -t command` | Turns off the top header banner (shows only command output). |

Practical sysadmin examples:
```bash
# Monitor disk space usage every 2 seconds
watch -d df -h

# Monitor system memory every 1 second
watch -n 1 free -m

# Monitor directory file count as a background process writes files
watch -n 1 "ls -1 /tmp/downloads | wc -l"
```

---

## ⚠️ Gotchas & Pro-Tips

- 🚨 **Stopping `tail -f` or `watch`:** Both commands run indefinitely in the foreground. Press **`Ctrl+C`** to send `SIGINT` and return to the bash prompt.
- 💡 **Multiple files with `tail`:** Running `tail -f /var/log/nginx/access.log /var/log/nginx/error.log` monitors both files simultaneously in a single terminal, prefixing new lines with the filename banner.
- 💡 **Checking exit status with `watch -g`:** Adding `-g` makes `watch` exit as soon as the output of the command changes.

---

## 💡 Notes

<!-- Add your own notes here as you watch the video -->
