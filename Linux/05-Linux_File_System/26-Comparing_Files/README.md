# 📖 Lesson: Comparing Files

> **Course Video:** `26 - Comparing Files (cmp, diff, sha256)`
> **Module:** 05 — The Linux File System

---

## 🎯 What This Lesson Covers
How to compare files byte-by-byte or line-by-line, detect differences, and verify file integrity using checksums.

---

## 📝 Key Concepts

### `cmp` — Byte-by-Byte Comparison
```bash
cmp file1 file2
```
- Returns nothing if files are **identical**
- Reports the **first difference** (byte number and line number)
- Exit code: `0` = identical, `1` = different, `2` = error

| Flag | Meaning |
| :--- | :--- |
| `cmp -l` | Print all differing bytes |
| `cmp -s` | Silent (just exit code) |
| `cmp -b` | Show differing bytes as printable characters |

### `diff` — Line-by-Line Comparison
```bash
diff file1 file2
```
Output notation:
- `<` lines from file1 (to remove)
- `>` lines from file2 (to add)
- `c` = change, `a` = add, `d` = delete

| Flag | Meaning |
| :--- | :--- |
| `diff -u` | Unified format (used in patches/git diffs) |
| `diff -y` | Side-by-side comparison |
| `diff -i` | Ignore case differences |
| `diff -w` | Ignore whitespace |
| `diff -r` | Recursive (compare directories) |
| `diff -q` | Only say if files differ (quiet) |

### Unified diff format (`-u`) — the standard for patches:
```
--- file1  timestamp
+++ file2  timestamp
@@ -line,count +line,count @@
-removed line
+added line
 unchanged line
```

### Checksums — Verifying File Integrity
```bash
sha256sum file          # generate SHA-256 hash
sha256sum file > file.sha256    # save hash to file
sha256sum -c file.sha256        # verify against saved hash
md5sum file             # MD5 (faster, less secure)
```

**Use case:** Verify a downloaded ISO hasn't been tampered with:
```bash
sha256sum ubuntu.iso
# compare with the hash on the official download page
```

---

## ⚠️ Gotchas
- `cmp` stops at the **first** difference — use `cmp -l` to see all differences
- `diff` output can be confusing — use `diff -u` or `diff -y` for readability
- MD5 is **not cryptographically secure** — use SHA-256 for security-sensitive checks

---

## 💡 Notes
<!-- Add your own notes here as you watch the video -->
