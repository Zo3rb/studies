# 📖 Lesson: Compressing and Archiving Files and Directories

> **Course Video:** `31 - Compressing and Archiving Files and Directories (tar, gzip)`
> **Module:** 05 — The Linux File System

---

## 🎯 What This Lesson Covers
Creating archives and compressing files using `tar`, `gzip`, `bzip2`, and `zip`. Essential for backups, transferring files, and saving disk space.

---

## 📝 Key Concepts

### `tar` — Tape Archive (the workhorse)

`tar` bundles files together into a single `.tar` file. Combined with a compression tool, it produces `.tar.gz`, `.tar.bz2`, etc.

**Core flags:**

| Flag | Meaning |
| :--- | :--- |
| `-c` | **C**reate a new archive |
| `-x` | E**x**tract from archive |
| `-t` | Lis**t** contents (without extracting) |
| `-v` | **V**erbose (show files being processed) |
| `-f` | **F**ile — specify archive filename (always last before filename) |
| `-z` | Compress with **gzip** (`.tar.gz`) |
| `-j` | Compress with **bzip2** (`.tar.bz2`) |
| `-J` | Compress with **xz** (`.tar.xz`) |
| `-C` | Extract to a specific directory |
| `--exclude` | Exclude files/patterns |

**Common patterns:**

```bash
# Create
tar -cvf archive.tar file1 file2 dir/        # bundle only
tar -czvf archive.tar.gz dir/                # bundle + gzip
tar -cjvf archive.tar.bz2 dir/              # bundle + bzip2

# Extract
tar -xvf archive.tar                         # extract here
tar -xzvf archive.tar.gz                    # extract gzip
tar -xvf archive.tar.gz -C /target/dir/    # extract to directory

# List (inspect without extracting)
tar -tvf archive.tar
tar -tzvf archive.tar.gz

# Exclude patterns
tar -czvf backup.tar.gz /home/user/ --exclude="*.log" --exclude=".cache"
```

### `gzip` / `gunzip` — Compress Individual Files

```bash
gzip file.txt           # compress → file.txt.gz (original removed)
gzip -k file.txt        # keep original (-k = keep)
gzip -v file.txt        # verbose (show compression ratio)
gzip -9 file.txt        # maximum compression (slower)
gzip -1 file.txt        # fastest compression (less compression)
gunzip file.txt.gz      # decompress
gzip -d file.txt.gz     # decompress (same as gunzip)
zcat file.txt.gz        # view contents without decompressing
```

### `zip` / `unzip`

```bash
zip archive.zip file1 file2         # zip files
zip -r archive.zip directory/       # zip directory recursively
zip -e archive.zip files            # encrypt with password
unzip archive.zip                   # extract
unzip archive.zip -d /target/       # extract to directory
unzip -l archive.zip                # list contents
```

### Compression Comparison

| Format | Extension | Speed | Ratio | Cross-platform |
| :--- | :--- | :--- | :--- | :--- |
| gzip | `.tar.gz` | Fast | Good | ✅ |
| bzip2 | `.tar.bz2` | Slower | Better | ✅ |
| xz | `.tar.xz` | Slowest | Best | ✅ |
| zip | `.zip` | Fast | Good | ✅ Windows |

---

## ⚠️ Gotchas
- `-f` must come **right before** the archive filename: `tar -czvf archive.tar.gz dir/`
- `gzip` **removes** the original by default — use `-k` to keep it
- `tar` extracts to the **current directory** by default — use `-C` to control destination
- Always use `-v` when learning — silence can hide errors

---

## 💡 Notes
<!-- Add your own notes here as you watch the video -->
