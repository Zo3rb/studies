# 📖 Lesson: Command Redirection in Linux

> **Course Video:** `18 - Command Redirection (_, _, 2_ &_, cut, tee)/Command Redirection (_, _, 2_ &_, cut, tee).mp4`  
> **Module:** 05 — The Linux File System

---

## 🎯 What This Lesson Covers

- The three standard I/O streams and file descriptors: `stdin` (0), `stdout` (1), and `stderr` (2).
- Redirection operators: `>`, `>>`, `<`, `2>`, `2>&1`, `&>`, `/dev/null`.
- Extracting tabular data fields with the `cut` utility (`-d`, `-f`, `-c`).
- Splitting streams to both terminal and disk with `tee` (`-a`).
- Elevating permissions safely on file writes using `sudo tee`.

---

## 📝 Key Concepts

### 1. Standard Streams & File Descriptors

Every process running on a Linux system starts with three standard I/O channels open by default, identified by integer **file descriptors (FDs)**:

| File Descriptor | Stream Name | POSIX Abbreviation | Default Source / Destination |
| :---: | :--- | :--- | :--- |
| **`0`** | Standard Input | `stdin` | Keyboard (terminal input) |
| **`1`** | Standard Output | `stdout` | Terminal screen (normal output) |
| **`2`** | Standard Error | `stderr` | Terminal screen (error / diagnostic messages) |

Because both `stdout` (1) and `stderr` (2) display on the terminal by default, they appear mixed together. Redirection operators allow you to decouple, separate, merge, or discard them.

---

### 2. Redirection Operators Reference

| Syntax | Operator Name | Function | Example |
| :--- | :--- | :--- | :--- |
| `>` or `1>` | Overwrite `stdout` | Truncates file and writes standard output | `ls -la > files.txt` |
| `>>` or `1>>` | Append `stdout` | Appends standard output to existing file | `date >> activity.log` |
| `<` or `0<` | Redirect `stdin` | Reads input from a file instead of keyboard | `mysql db < backup.sql` |
| `2>` | Overwrite `stderr` | Redirects error messages only to a file | `find /etc -name "*.conf" 2> errors.log` |
| `2>>` | Append `stderr` | Appends error messages to a file | `backup.sh 2>> backup_errors.log` |
| `2>&1` | Merge `stderr` into `stdout` | Makes FD 2 point to the same destination as FD 1 | `cmd > all_output.log 2>&1` |
| `&>` or `>&` | Redirect both | Overwrites file with both `stdout` and `stderr` (Bash shortcut) | `system_check.sh &> report.log` |
| `&>>` | Append both | Appends both `stdout` and `stderr` to file | `app.sh &>> app.log` |
| `2> /dev/null` | Discard errors | Suppresses error messages completely into bit bucket | `grep -r "test" /sys 2> /dev/null` |
| `&> /dev/null` | Silent execution | Discards all output (errors and standard output) | `cron_job.sh &> /dev/null` |
| `<< EOF` | Here-Document | Feeds multi-line text block into command's `stdin` | `cat << EOF > file.txt` |
| `<<< "string"` | Here-String | Feeds a single string into command's `stdin` | `bc <<< "10 * 5"` |

---

### 3. The `cut` Utility

The `cut` command extracts sections (columns, fields, or character byte ranges) from each line of input or files.

| Flag | Name | Description | Example |
| :--- | :--- | :--- | :--- |
| `-d` | `--delimiter` | Specify field delimiter (default is TAB) | `cut -d: ...` (colon delimited) |
| `-f` | `--fields` | Select field numbers (1-indexed, comma-separated or ranges) | `cut -f1,3`, `cut -f2-5` |
| `-c` | `--characters` | Select character position ranges | `cut -c1-10` (first 10 chars) |
| `--complement` | Invert selection | Output all fields *except* the selected ones | `cut -d: -f2 --complement` |

#### Common `cut` Examples:
```bash
# Extract usernames from /etc/passwd:
cut -d: -f1 /etc/passwd

# Extract username and shell (fields 1 and 7):
cut -d: -f1,7 /etc/passwd

# Extract the first 8 characters of each line in a log:
cut -c1-8 /var/log/syslog
```

---

### 4. The `tee` Command

`tee` acts like a "T-junction" in plumbing: it takes `stdin` and copies it to **both `stdout` (the screen) AND one or more files simultaneously**.

```
                +---------------------+
stdin --------> |         tee         | --------> stdout (Terminal)
                +---------------------+
                           |
                           v
                     Target File(s)
```

| Command | Behavior |
| :--- | :--- |
| `command \| tee output.txt` | Shows output on screen and overwrites `output.txt` |
| `command \| tee -a output.txt` | Shows output on screen and appends (`-a`) to `output.txt` |
| `echo "1" \| sudo tee /proc/sys/net/ipv4/ip_forward` | Elevates write privileges safely on system files |

#### The `sudo tee` Pattern:
A very common Linux permission issue occurs when trying to redirect with `sudo`:
```bash
# ❌ THIS FAILS WITH "Permission denied":
sudo echo "nameserver 8.8.8.8" > /etc/resolv.conf
```
*Why?* The shell performs the redirection (`>`) before running `sudo`. The shell runs as a regular user, not root, so writing to `/etc/resolv.conf` is denied!

```bash
# ✅ THIS SUCCEEDS:
echo "nameserver 8.8.8.8" | sudo tee /etc/resolv.conf
# Or to append without terminal echo:
echo "192.168.1.50 myserver.local" | sudo tee -a /etc/hosts > /dev/null
```

---

## ⚠️ Gotchas & Pro-Tips

- 🚨 **Redirection Order Matters with `2>&1`:**  
  `command > file 2>&1` works as expected: `file` is opened for `stdout`, then `stderr` is redirected to where `stdout` currently points (`file`).  
  `command 2>&1 > file` **FAILS** to capture errors: `stderr` points to current `stdout` (the terminal screen), and then `stdout` is redirected to `file`. Errors will still leak to your terminal!
- 🚨 **`>` immediately truncates the file:** When running `cat file.txt | tr 'a-z' 'A-Z' > file.txt`, bash truncates `file.txt` to 0 bytes *before* `cat` can read it! The file will be wiped empty. Always write to a temporary file first or use `sponge` (from `moreutils`).
- 💡 **Silent Cron Jobs:** To prevent cron from sending emails every minute, redirect output to `/dev/null`:  
  `* * * * * /opt/scripts/backup.sh > /dev/null 2>&1`

---

## 💡 Notes

<!-- Add your own notes here as you watch the video -->
