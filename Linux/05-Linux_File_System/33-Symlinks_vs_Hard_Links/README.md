# 📖 Lesson: Working With Symlinks — Symlinks vs Hard Links

> **Course Video:** `33 - Working With Symlinks. Symlinks vs. Hard Links`
> **Module:** 05 — The Linux File System

---

## 🎯 What This Lesson Covers
Symbolic links (symlinks / soft links) — how they work, how they differ from hard links, and when to use each.

---

## 📝 Key Concepts

### Creating Symlinks

```bash
ln -s target linkname       # create symlink
ln -s /etc/nginx/nginx.conf ~/nginx.conf    # symlink from home to config
ln -s /var/log/app/ ~/logs                 # symlink to directory
```

### How Symlinks Work
A symlink is a **special file** that contains a **path string** pointing to the target. It has its **own inode**, different from the target's inode.

```
"mylink"  ──→  inode #9999  ──→  "/path/to/target"  ──→  actual file
```

The kernel **follows** the symlink transparently when you access it.

### Symlink vs Hard Link — Full Comparison

| Property | Hard Link | Symbolic Link |
| :--- | :--- | :--- |
| Own inode? | No (shares target inode) | **Yes** (new inode) |
| Cross filesystem? | ❌ No | ✅ Yes |
| Works on directories? | ❌ No (normally) | ✅ Yes |
| Survives target deletion? | ✅ Yes (data persists) | ❌ No (dangling link) |
| `ls -l` indicator | No special mark | `l` prefix + `->` |
| Link count on target | Increases by 1 | No change |
| Creation flag | `ln` | `ln -s` |

### Identifying Symlinks

```bash
ls -l link        # shows: lrwxrwxrwx ... mylink -> /target
ls -F link        # shows: mylink@
file link         # shows: symbolic link to /target
readlink link     # shows only the target path
readlink -f link  # shows fully resolved absolute path
```

### Dangling Symlinks
A symlink that points to a **non-existent target** is called a **dangling** (broken) symlink:
```bash
ln -s /nonexistent broken_link
ls -l broken_link         # shows in red on most terminals
cat broken_link           # → No such file or directory
```

Find broken symlinks:
```bash
find /path -xtype l       # find broken symlinks
find /path -type l ! -e   # alternative syntax
```

### Updating a Symlink
```bash
ln -sf /new/target linkname     # -f = force (remove old link first)
```

### Common Real-World Use Cases

| Use Case | Example |
| :--- | :--- |
| Point to config from home | `ln -s /etc/nginx/nginx.conf ~/nginx.conf` |
| Version-agnostic binary | `ln -s python3.11 /usr/local/bin/python3` |
| Shared log directory | `ln -s /var/log/app ~/logs` |
| Alternative binary paths | `/usr/bin/editor -> /etc/alternatives/editor` |

---

## ⚠️ Gotchas
- Use **absolute paths** in symlinks when possible — relative paths break if the link is moved
- `rm symlink` removes the link, NOT the target — `rm -r symlink/` on a symlink to a dir can be dangerous
- `cp -P` copies the symlink itself; `cp` (no flag) copies the target content

---

## 💡 Notes
<!-- Add your own notes here as you watch the video -->
