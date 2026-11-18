# 📖 Lesson: Moving and Renaming Files and Directories (mv)

> **Course Video:** `14 - Moving and Renaming Files and Directories (mv)/Moving and Renaming Files and Directories (mv).mp4`  
> **Module:** 05 — The Linux File System

---

## 🎯 What This Lesson Covers

- How `mv` works under the hood (same-filesystem inode relinking vs. cross-filesystem data transfer).
- Renaming files and directories.
- Moving files and nested directories (and why `mv` does **not** need `-r`).
- Safety and automation flags: `-i`, `-n`, `-v`, `-u`, `-b`.
- Batch renaming multiple files using bash shell parameter expansion.

---

## 📝 Key Concepts

### 1. How `mv` Operates Under the Hood

In Unix/Linux, **moving** and **renaming** are fundamentally the same operation:

| Scenario | Mechanism | Performance |
| :--- | :--- | :--- |
| **Within the Same Filesystem / Partition** | Linux simply updates the filename entry in the directory file and points it to the existing inode. **Zero data blocks are copied or moved on disk.** | **Instantaneous** (even for a 500GB file). Inode number remains identical. |
| **Across Different Filesystems / Mount Points** | Data blocks must physically be copied to the target filesystem, and upon successful write, the source file is deleted (unlinked). | Dependent on file size and disk/network I/O. Inode number changes. |

---

### 2. Core `mv` Syntax

```bash
# 1. Renaming a file in the same directory
mv old_report.txt new_report.txt

# 2. Moving a file into another directory
mv document.pdf /home/username/Documents/

# 3. Moving AND renaming simultaneously
mv draft.txt /home/username/Documents/final_version.txt

# 4. Moving multiple files into a directory (last argument MUST be a directory!)
mv file1.txt file2.txt file3.txt /tmp/archive/

# 5. Moving or renaming a directory (No recursive -r flag needed!)
mv project_v1 project_v2
mv /tmp/downloads/project /opt/services/
```

> [!NOTE]
> Unlike `cp` and `rm`, **`mv` does NOT need `-r` or `-R` to move directories**. `mv` handles directories automatically.

---

### 3. Comprehensive `mv` Flag Reference

| Flag | Long Option | Purpose & Behavior |
| :--- | :--- | :--- |
| **`-i`** | `--interactive` | **Interactive:** Prompts before overwriting any existing destination file. |
| **`-n`** | `--no-clobber` | **No Clobber:** Never overwrites an existing file. Silently skips existing destinations. Overrides `-i`. |
| **`-v`** | `--verbose` | **Verbose:** Explains what is being done by printing each move (`'src' -> 'dst'`). |
| **`-u`** | `--update` | **Update:** Moves only if the source file is newer than the destination or destination is missing. |
| **`-b`** | `--backup` | **Backup:** Automatically creates a backup (`file~`) of any destination file before overwriting. |
| **`-f`** | `--force` | **Force:** Overwrite destination without prompting (default behavior unless aliased). |

---

### 4. Batch Renaming with Bash Loops

Linux does not have a native built-in batch rename flag in standard POSIX `mv`, but bash parameter expansion `${var%suffix}` makes batch renaming trivial:

```bash
# Rename all .txt files to .bak
for file in *.txt; do
    mv -v "$file" "${file%.txt}.bak"
done

# Prepend a date prefix to all .log files
for log in *.log; do
    mv -v "$log" "2026-11-18_$log"
done
```

---

## ⚠️ Gotchas & Pro-Tips

- 🚨 **Accidental Overwrite:** If you run `mv file1.txt file2.txt` and `file2.txt` already exists, `file2.txt` is **destroyed immediately without warning!** Use `mv -i` in interactive shells or `mv -n` in scripts where preservation is critical.
- 🚨 **Missing Destination Directory Mistake:** If you run `mv file1.txt file2.txt /tmp/my_folder` and `/tmp/my_folder` does NOT exist, `mv` will error: `target '/tmp/my_folder' is not a directory`. Always ensure the destination directory exists first with `mkdir -p`.
- 💡 **Atomic Inode Rename:** Renaming a file on the same filesystem is an atomic filesystem operation. If another process is actively reading or writing to the file, it will not experience I/O errors during the rename.

---

## 💡 Notes

<!-- Add your own notes here as you watch the video -->
