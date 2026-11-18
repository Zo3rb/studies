# 📖 Lesson: Hard Links and the Inode Structure

> **Course Video:** `32 - Hard Links and the Inode Structure`
> **Module:** 05 — The Linux File System

---

## 🎯 What This Lesson Covers
What inodes are, how the Linux filesystem tracks files using them, and how hard links exploit the inode structure to create multiple directory entries pointing to the same data.

---

## 📝 Key Concepts

### What is an Inode?
An **inode** (index node) is a data structure that stores **metadata** about a file — everything *except* its name and data content:

| Inode stores | Inode does NOT store |
| :--- | :--- |
| File type | File name |
| Permissions | File content |
| Owner (UID/GID) | Directory path |
| File size | |
| Timestamps (atime/mtime/ctime) | |
| **Link count** (number of hard links) | |
| Pointers to data blocks on disk | |

```
Filesystem:
  Directory entry: "myfile.txt"  →  inode #12345
  Inode #12345:  permissions, owner, size, timestamps, → data blocks
  Data blocks:   [actual file content bytes]
```

**View inode number:**
```bash
ls -i filename          # show inode number
ls -li                  # long format with inode
stat filename           # full inode metadata
```

### Hard Links

A **hard link** is an additional **directory entry** pointing to the **same inode** (and therefore the same data blocks).

```bash
ln original.txt hardlink.txt    # create hard link
```

**Key properties:**
- Same inode number as the original
- Same file size, permissions, timestamps
- **Link count increases by 1**
- Deleting one entry does NOT delete the data — data persists until link count reaches 0
- Cannot cross filesystem boundaries (must be on same partition)
- Cannot link to directories (normally)

### Link Count
```bash
stat filename | grep "Links:"
ls -l filename   # 2nd column = link count
```
- New file: link count = **1**
- After `ln file hardlink`: link count = **2**
- After `rm file`: link count = **1** (data still exists via hardlink)
- After `rm hardlink`: link count = **0** → data blocks freed

### Diagram
```
  "original.txt"  ──┐
                    ├──→  inode #5001  ──→  data blocks
  "hardlink.txt"  ──┘
                        (link count = 2)
```

---

## ⚠️ Gotchas
- When you `cp` a file, you get a **new inode** — it's a true copy
- When you `mv` a file (same filesystem), the **inode stays the same** — just the directory entry changes
- Directories always have a minimum link count of **2** (`dir` itself + `.` inside it)

---

## 💡 Notes
<!-- Add your own notes here as you watch the video -->
