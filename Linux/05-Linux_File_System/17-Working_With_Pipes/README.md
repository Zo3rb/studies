# 📖 Lesson: Working With Pipes in Linux

> **Course Video:** `17 - Working With Pipes in Linux (_, wc)/Working With Pipes in Linux (_, wc).mp4`  
> **Module:** 05 — The Linux File System

---

## 🎯 What This Lesson Covers

- The pipe operator (`|`) and the fundamental stream architecture of Linux.
- How data flows in memory from the `stdout` of one command into the `stdin` of another.
- The `wc` (word count) command and all its flags (`-l`, `-w`, `-c`, `-m`, `-L`).
- Combining `wc` with pipes for quantitative analysis.
- Multi-stage pipeline construction and real-world system administration examples.
- Pipeline exit statuses, `${PIPESTATUS}`, and `pipefail`.

---

## 📝 Key Concepts

### 1. The Pipe Operator (`|`)

The Unix pipe (`|`) is one of the foundational building blocks of the Unix philosophy: **"Write programs that do one thing and do it well. Write programs to work together."**

A pipe connects the **standard output (`stdout`, File Descriptor 1)** of the command on its left directly to the **standard input (`stdin`, File Descriptor 0)** of the command on its right.

```
+---------------+     stdout (FD 1)     +-------------------+     stdout (FD 1)     +---------------+
|   Command 1   | --------------------> |     Command 2     | --------------------> |   Command 3   |
+---------------+       (in memory)     +-------------------+       (in memory)     +---------------+
                                                ^                                           |
                                                | stdin (FD 0)                              v
                                                                                       Terminal Output
```

#### Why Pipes Are Powerful:
1. **No Intermediate Disk I/O:** Data travels completely in kernel memory buffers (typically 64 KB on modern Linux). No temporary files need to be created, stored, or cleaned up on disk.
2. **Concurrent Execution:** Both commands execute concurrently as separate processes. The receiving command begins processing incoming bytes as soon as the producing command writes them, without waiting for the first command to finish completely.
3. **Composability:** Simple, single-purpose Unix utilities (`grep`, `sort`, `uniq`, `wc`, `cut`, `awk`, `sed`) can be combined into sophisticated data-processing pipelines.

---

### 2. The `wc` (Word Count) Command

`wc` reads files or standard input and computes newline, word, byte, and character counts.

| Flag | Meaning | Description |
| :--- | :--- | :--- |
| `-l` | `--lines` | Count newline characters (`\n`) |
| `-w` | `--words` | Count whitespace-delimited words |
| `-c` | `--bytes` | Count total byte count |
| `-m` | `--chars` | Count character count (accounts for multi-byte UTF-8 characters) |
| `-L` | `--max-line-length` | Display the display width of the longest line |

#### Direct File Usage vs Piped Input:
```bash
# Direct file usage shows the filename:
wc -l /etc/passwd
# Output: 45 /etc/passwd

# Piped input only prints the numeric count (ideal for scripts):
cat /etc/passwd | wc -l
# Output: 45
```

---

### 3. Practical Pipeline Patterns

| Pipeline Pattern | Purpose | Explanation |
| :--- | :--- | :--- |
| `ls -1 /etc \| wc -l` | Count entries in a directory | `ls -1` outputs one filename per line; `wc -l` counts them |
| `cat /etc/passwd \| grep bash \| wc -l` | Count users with bash shell | Filters `/etc/passwd` for "bash", then counts matching lines |
| `ps aux \| grep nginx` | Check running nginx processes | Lists all processes and filters for "nginx" |
| `ps aux \| grep -v "grep" \| grep nginx \| wc -l` | Accurately count nginx processes | Excludes the grep process itself from the count |
| `who \| wc -l` | Count currently logged-in users | Each active user session occupies one line |
| `dmesg \| head -n 20` | Inspect the first 20 boot log lines | Paginates kernel ring buffer output |
| `cut -d: -f7 /etc/passwd \| sort \| uniq -c` | Frequency of default login shells | Extracts shell column, sorts alphabetically, and counts occurrences |
| `df -h \| grep -v "tmpfs" \| sort -k5 -hr` | Sort disk usage by percentage | Excludes virtual memory filesystems and sorts by use percentage |

---

### 4. Advanced Pipeline Mechanics: Exit Codes & `pipefail`

By default in Bash, the exit status of a pipeline (`$?`) is the exit status of the **last command** in the pipeline:
```bash
cat /nonexistent/file | wc -l
# cat fails with exit code 1, but wc succeeds with exit code 0
echo $?
# Output: 0 (masks the error!)
```

#### Best Practices for Production Scripts:
1. **`${PIPESTATUS[@]}`:** An array variable containing the exit status of each command in the most recently executed pipeline.
   ```bash
   cat /nonexistent/file | wc -l
   echo "${PIPESTATUS[0]} ${PIPESTATUS[1]}"
   # Output: 1 0
   ```
2. **`set -o pipefail`:** Forces Bash to return a failure exit code if *any* command in the pipeline fails, rather than just the final command.
   ```bash
   set -o pipefail
   cat /nonexistent/file | wc -l
   echo $?
   # Output: 1 (correctly captures the failure)
   ```

---

## ⚠️ Gotchas & Pro-Tips

- 🚨 **`wc -l` counts newline (`\n`) characters, not visual lines!** If a file contains text on a line without a trailing newline character at the end, `wc -l` will count that file as having one less line than actually visible.
- 💡 **Avoiding Useless Use of `cat` (UUOC):** While `cat file | grep pattern` is common, running `grep pattern file` directly saves a fork and exec overhead. Use pipes when combining multiple transformations.
- 🚨 **The `grep` self-match pitfall:** When running `ps aux | grep nginx`, `grep` itself matches because "nginx" appears in the grep process command line. To eliminate the grep process without extra piping, use a bracket trick:  
  `ps aux | grep "[n]ginx"`  
  *(The regex matches the literal character 'n' followed by 'ginx', but the literal string `[n]ginx` in the process list does not match itself!)*
- 💡 **Pipe buffer size:** Pipes use a circular buffer in kernel memory (default 64KB on Linux). If the reader is slower than the writer, the writer blocks until space is available. This prevents runaway memory consumption.

---

## 💡 Notes

<!-- Add your own notes here as you watch the video -->
