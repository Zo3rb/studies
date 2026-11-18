# 📖 Lesson: Creating Files and Directories (touch, mkdir)

> **Course Video:** `12 - Creating Files and Directories (touch, mkdir)/Creating Files and Directories (touch, mkdir).mp4`  
> **Module:** 05 — The Linux File System

---

## 🎯 What This Lesson Covers

- Creating empty files and setting initial timestamps with `touch`.
- Bulk file creation using bash **brace expansion**.
- Creating directories and complex nested hierarchies with `mkdir`.
- Critical `mkdir` flags: `-p` (parents), `-v` (verbose), `-m` (mode/permissions).
- Creating fixed-size dummy files using `truncate` and `dd`.

---

## 📝 Key Concepts

### 1. Creating Files with `touch` and Redirection

| Method | Command Syntax | Description |
| :--- | :--- | :--- |
| **Basic creation** | `touch notes.txt` | Creates an empty file (0 bytes) if it doesn't exist; updates timestamps if it does. |
| **Multiple files** | `touch f1.txt f2.txt f3.txt` | Creates all specified files in one execution. |
| **Brace expansion** | `touch file_{1..5}.txt` | Creates `file_1.txt` through `file_5.txt` automatically. |
| **No-create flag** | `touch -c file.txt` | Only updates timestamps if the file already exists; will **not** create a new file. |
| **Explicit time** | `touch -t 202601011200 file.txt` | Sets modification and access time to Jan 1, 2026 12:00. |
| **Shell redirection** | `> empty.txt` | Fast shell built-in to create an empty 0-byte file (or truncate an existing file). |
| **With content** | `echo "initial" > file.txt` | Creates file and writes text into it. |

---

### 2. Creating Directories with `mkdir`

The `mkdir` (**m**a**k**e **dir**ectory) command creates new directory entries.

| Command Syntax | Flag | Action & Significance |
| :--- | :---: | :--- |
| `mkdir mydir` | *(none)* | Creates a single directory inside the current working directory. Fails if parent doesn't exist or directory already exists. |
| `mkdir dir1 dir2 dir3` | *(none)* | Creates multiple directories simultaneously. |
| `mkdir -p a/b/c/d` | **`-p`** (`--parents`) | **Create parent directories as needed.** Idempotent: no error if existing, creates all missing intermediate parents. |
| `mkdir -v mydir` | **`-v`** (`--verbose`) | Prints a diagnostic message for every created directory. |
| `mkdir -m 700 secret` | **`-m`** (`--mode`) | Sets octal permissions directly at creation time (avoids needing a subsequent `chmod`). |

---

### 3. Rapid Scaffolding with Brace Expansion

Combining `mkdir -p` with bash brace expansion `{...}` allows you to scaffold full project directory trees in a single command line:

```bash
# Create complete project structure in one line
mkdir -p my_project/{src/{components,utils},tests,docs,config,build}
```

Visualized with `tree my_project`:
```text
my_project
├── build
├── config
├── docs
├── src
│   ├── components
│   └── utils
└── tests
```

---

### 4. Creating Fixed-Size Files for Testing

In DevOps testing (such as testing disk space alerts, log rotation, or network throughput), you often need files of specific sizes:

```bash
# Instant sparse file of 100 Megabytes (consumes minimal actual disk blocks)
truncate -s 100M test_100m.bin

# Allocate 10 Megabytes of real binary zeros
dd if=/dev/zero of=test_10m.bin bs=1M count=10
```

---

## ⚠️ Gotchas & Pro-Tips

- 🚨 **`mkdir` without `-p` breaks scripts:** If your script runs `mkdir /opt/app/logs` on a machine where `/opt/app` does not exist yet, the command fails with `No such file or directory` and crashes the script. **Always use `mkdir -p` in shell scripts and automation (Ansible, Dockerfiles, CI/CD)**.
- 💡 **Idempotency with `-p`:** Running `mkdir -p mydir` when `mydir` already exists does nothing and returns exit code `0` (success). Without `-p`, it returns exit code `1` (`File exists`).
- 💡 **Truncating an existing file:** Be careful with `> filename`. If `filename` already exists and has 10GB of data, running `> filename` instantly truncates it to 0 bytes without warning!

---

## 💡 Notes

<!-- Add your own notes here as you watch the video -->
