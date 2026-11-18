# 📖 Lesson: Copying Files and Directories (cp)

> **Course Video:** `13 - Copying Files and Directories (cp)/Copying Files and Directories (cp).mp4`  
> **Module:** 05 — The Linux File System

---

## 🎯 What This Lesson Covers

- Fundamentals of copying files and directories using `cp`.
- Core flags: `-r` (recursive), `-i` (interactive), `-v` (verbose), `-p` (preserve), `-a` (archive).
- Safe copy strategies: `-n` (no-clobber) and `-b` (automatic backup).
- Synchronizing changes with `-u` (update mode).
- Wildcards and directory copying behavior.

---

## 📝 Key Concepts

### 1. Basic `cp` Syntax

```bash
# Copy single file to a new filename
cp source.txt destination.txt

# Copy single file into an existing directory
cp source.txt /path/to/directory/

# Copy multiple files into a target directory (target MUST be a directory!)
cp file1.txt file2.txt file3.txt /path/to/directory/
```

---

### 2. Comprehensive `cp` Flag Reference

| Flag | Long Option | Purpose & Behavior |
| :--- | :--- | :--- |
| **`-r`** / **`-R`** | `--recursive` | **Recursive:** Required when copying directories. Copies directories and all sub-elements down the tree. |
| **`-v`** | `--verbose` | **Verbose:** Explains what is being copied by printing each source and destination (`'src' -> 'dst'`). |
| **`-i`** | `--interactive` | **Interactive:** Prompts for confirmation (`y/n`) before overwriting any existing destination file. |
| **`-n`** | `--no-clobber` | **No Clobber:** Never overwrites an existing file; silently skips existing files. Overrides `-i`. |
| **`-p`** | `--preserve` | **Preserve:** Preserves original file mode (permissions), ownership (if root), and timestamps (`mtime` and `atime`). |
| **`-a`** | `--archive` | **Archive:** Powerful mega-flag equivalent to `-dR --preserve=all`. Recursively copies directories, preserves symlinks as symlinks (does not dereference), and preserves all permissions, timestamps, extended attributes, and ownership. |
| **`-u`** | `--update` | **Update:** Copies only when the source file is strictly newer than the destination file, or when destination is missing. |
| **`-b`** | `--backup` | **Backup:** Creates a backup copy (e.g. `dest.txt~`) of any destination file before overwriting it. |
| **`-l`** | `--link` | **Hard Link:** Creates hard links instead of copying actual file data blocks on disk. Instantaneous. |
| **`-s`** | `--symbolic-link` | **Symbolic Link:** Creates soft links instead of copying data blocks. |

---

### 3. The Power of `cp -a` (Archive Mode)

Standard `cp -r` has severe drawbacks for system administration:
1. It assigns current user ownership to all copied files.
2. It resets timestamps to current time.
3. It dereferences symlinks (copies the target file instead of the link, causing duplicate data or broken loops).

`cp -a` solves all three issues:
```bash
# Production-standard backup command:
cp -a /etc /var/backups/etc_backup_$(date +%F)
```
Every permission bit, symbolic link, and timestamp is cloned with byte-for-byte fidelity.

---

### 4. Wildcards with `cp`

```bash
# Copy all .log files to an archive directory
cp *.log /var/log/archive/

# Copy all files starting with "report_" and ending in 2026
cp report_*2026.csv /tmp/reports/

# Copy all single-digit test files (test_1.txt, test_2.txt)
cp test_?.txt /tmp/tests/
```

---

## ⚠️ Gotchas & Pro-Tips

- 🚨 **Silent Overwrite Danger:** By default, if the destination file exists and is writable, `cp` will overwrite it **silently without any confirmation prompt!**
  - In interactive shells, many distributions set `alias cp='cp -i'`.
  - In shell scripts, aliases are disabled by default, meaning `cp` will overwrite existing files silently. Always use `cp -i` or `cp -n` if data loss is a risk.
- 💡 **Trailing slash subtleties:**
  - `cp -r dir1 dir2`: If `dir2` exists, `dir1` becomes a subdirectory inside `dir2` (`dir2/dir1`).
  - If `dir2` does NOT exist, `dir1` is copied and named `dir2`.
- 💡 **Quick file backup shortcut:**
  ```bash
  cp nginx.conf{,.bak}
  # Expands to: cp nginx.conf nginx.conf.bak
  ```

---

## 💡 Notes

<!-- Add your own notes here as you watch the video -->
