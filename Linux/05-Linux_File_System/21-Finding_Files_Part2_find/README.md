# 📖 Lesson: Finding Files and Directories — Part 2 (`find`)

> **Course Video:** `21 - Finding Files and Directories - Part 2 (find)/Finding Files and Directories - Part 2 (find).mp4`  
> **Module:** 05 — The Linux File System

---

## 🎯 What This Lesson Covers

- How `find` traverses live directory trees in real-time.
- Syntax: `find [starting-path] [criteria/tests] [actions]`.
- Filtering by filename (`-name`, `-iname`).
- Filtering by type (`-type f/d/l/s/p/b/c`).
- Filtering by file size (`-size +/-[c/k/M/G]`).
- Filtering by timestamps (`-mtime`, `-mmin`, `-atime`, `-ctime`, `-newer`).
- Filtering by ownership (`-user`, `-group`, `-nouser`, `-nogroup`) and permissions (`-perm`).
- Constraining directory recursion depth (`-maxdepth`, `-mindepth`).
- Boolean logic combinations (`-and`, `-or`, `-not`, `!`).

---

## 📝 Key Concepts

### 1. `find` Command Structure

Unlike `locate` (which checks a static database), `find` **actively walks the directory tree live**. It evaluates every file and directory against a set of criteria tests from left to right.

```bash
find [path...] [expression]
```
- If no path is specified, `find` defaults to the current directory (`.`).
- If no action is specified, `find` defaults to printing matched paths (`-print`).

---

### 2. Comprehensive `find` Options Reference

| Option | Meaning | Description | Example |
| :--- | :--- | :--- | :--- |
| `-name pattern` | Case-sensitive name | Match filename using shell globbing (`*`, `?`, `[]`) | `find /etc -name "*.conf"` |
| `-iname pattern` | Case-insensitive name | Match filename ignoring letter casing | `find ~ -iname "readme*"` |
| `-type [f/d/l/s/p/b/c]` | File type | Match specific file type (`f`=file, `d`=dir, `l`=link) | `find /var -type d` |
| `-size [+ / -]N[c/k/M/G]` | File size filter | `+` (greater than), `-` (less than), exact `N` | `find /var/log -size +50M` |
| `-mtime [+ / -]N` | Modification time (days) | Days since file content last modified | `find /var/log -mtime -7` |
| `-mmin [+ / -]N` | Modification time (mins) | Minutes since content last modified | `find /tmp -mmin -30` |
| `-atime [+ / -]N` | Access time (days) | Days since file was last read/accessed | `find /home -atime +90` |
| `-ctime [+ / -]N` | Metadata change (days) | Days since inode metadata (permissions/owner) changed | `find /etc -ctime -1` |
| `-newer reference_file` | Newer than reference | Files modified more recently than `reference_file` | `find . -newer marker.txt` |
| `-user username` | Owner match | Files owned by specified user (name or UID) | `find /var/www -user www-data` |
| `-group groupname` | Group match | Files owned by specified group (name or GID) | `find /srv -group developers` |
| `-nouser` / `-nogroup` | Orphaned files | Files whose owner/group no longer exists in `/etc/passwd` | `find / -nouser 2>/dev/null` |
| `-perm mode` | Exact permissions | Matches exact octal mode | `find . -perm 644` |
| `-perm -mode` | Minimum permissions | All specified permission bits must be set | `find . -perm -u=x` |
| `-perm /mode` | Any permission bit | Any of the specified permission bits are set | `find . -perm /4000` (SUID) |
| `-maxdepth N` | Max directory depth | Do not descend more than `N` directory levels | `find /etc -maxdepth 1 -name "*.conf"` |
| `-mindepth N` | Min directory depth | Do not apply tests at levels less than `N` (1 skips root of search) | `find . -mindepth 2` |
| `-empty` | Zero-byte / empty | Regular files of size 0 or empty directories | `find /tmp -type f -empty` |

---

### 3. Understanding Size Units & Plus/Minus Modifiers

- `c`: Bytes
- `k`: Kilobytes (1024 bytes)
- `M`: Megabytes (1024 KiB)
- `G`: Gigabytes (1024 MiB)

| Expression | Meaning |
| :--- | :--- |
| `-size 10M` | Exactly 10 MB (rounded up) |
| `-size +10M` | Strictly greater than 10 MB |
| `-size -10M` | Strictly less than 10 MB |

---

### 4. Timestamp Filters Explained (`-mtime` vs `-mmin`)

- `-mtime -3`: Modified **less than 3 days ago** (between 0 and 72 hours ago).
- `-mtime +3`: Modified **more than 3 days ago** (older than 72 hours).
- `-mtime 3`: Modified **exactly 3 days ago** (between 72 and 96 hours ago).
- For sub-day precision (debugging recent changes), use `-mmin` (e.g., `-mmin -60` for last 60 minutes).

---

### 5. Combining Criteria with Boolean Logic

| Operator | Syntax | Description |
| :--- | :--- | :--- |
| **AND** | `expr1 -a expr2` or `expr1 expr2` | Both criteria must evaluate to true (default behavior) |
| **OR** | `expr1 -o expr2` or `expr1 -or expr2` | Either criteria can evaluate to true |
| **NOT** | `! expr` or `-not expr` | Negates the condition |
| **Grouping** | `\( expr1 -o expr2 \) -and expr3` | Parentheses require backslash escaping to protect from shell |

#### Complex Boolean Example:
```bash
# Find all regular files in /var/log that are either .log or .txt AND greater than 1MB:
find /var/log -type f \( -name "*.log" -o -name "*.txt" \) -size +1M
```

---

## ⚠️ Gotchas & Pro-Tips

- 🚨 **Quote Wildcards Always:**  
  `find . -name *.txt` ❌ — If current directory has `a.txt` and `b.txt`, bash expands the wildcard before `find` runs into `find . -name a.txt b.txt`, causing a syntax error!  
  `find . -name "*.txt"` ✅ — Quoting passes the literal `*.txt` to `find` for recursive glob matching.
- 💡 **Placement of `-maxdepth`:** Always place `-maxdepth` and `-mindepth` first before criteria tests to optimize traversal performance.
- 💡 **Permission Denied Cleanup:** Searching from `/` produces hundreds of permission warnings. Clean them up with `2>/dev/null`:  
  `find / -name "myapp.conf" 2>/dev/null`

---

## 💡 Notes

<!-- Add your own notes here as you watch the video -->
