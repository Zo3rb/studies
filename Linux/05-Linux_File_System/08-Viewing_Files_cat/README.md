# 📖 Lesson: Viewing Files — Part 1 (cat)

> **Course Video:** `8 - Viewing Files - Part 1 (cat)/Viewing Files - Part 1 (cat).mp4`  
> **Module:** 05 — The Linux File System

---

## 🎯 What This Lesson Covers

- The origin and primary purpose of `cat` (**conCATenate**).
- Reading, viewing, and concatenating multiple files.
- Essential `cat` flags: `-n`, `-b`, `-s`, `-E`, `-T`, `-A`.
- Creating and appending to files using redirection and heredocs (`cat > file`, `cat >> file`).
- Viewing file lines in reverse order using `tac`.

---

## 📝 Key Concepts

### 1. What is `cat`?

The `cat` utility is one of the foundational Unix utilities. Its name stands for **concatenate**. While commonly used simply to display a file's content on the terminal screen, its core purpose is reading sequential data from standard input or files and streaming it to standard output.

```bash
# Print a single file to standard output
cat /etc/hosts

# Concatenate multiple files into one new destination file
cat header.txt body.txt footer.txt > document.html
```

---

### 2. Comprehensive `cat` Flag Reference

| Flag | Long Option | Purpose & Behavior |
| :--- | :--- | :--- |
| **`-n`** | `--number` | Number all output lines, starting from line 1. |
| **`-b`** | `--number-nonblank` | Number non-empty output lines only (skips blank lines). Overrides `-n`. |
| **`-s`** | `--squeeze-blank` | Suppresses repeated adjacent empty output lines into a single blank line. Great for cleaning up spaced configs. |
| **`-E`** | `--show-ends` | Displays a `$` symbol at the end of each line (reveals trailing whitespace and Windows `\r` endings). |
| **`-T`** | `--show-tabs` | Displays TAB characters as `^I` (essential for debugging Makefile or Python indentation bugs). |
| **`-A`** | `--show-all` | Equivalent to `-vET`. Displays non-printing characters, tabs as `^I`, and line ends as `$`. |

---

### 3. Creating & Appending Files with `cat`

`cat` can act as a quick, lightweight text editor without launching a heavy editor:

#### Creating a New File (`cat > file`)
```bash
cat > notes.txt
Type your lines of text here.
Press Enter after each line.
# Press Ctrl+D to send EOF (End of File) and save
```

#### Appending to an Existing File (`cat >> file`)
```bash
cat >> notes.txt
This line will be appended to the bottom.
# Press Ctrl+D to save
```

#### Heredocs in Automated Scripts
In shell scripts, interactive `Ctrl+D` is impossible. Use Here-Documents (**heredocs**):
```bash
cat << 'EOF' > /tmp/app.conf
# Application Configuration
server_name = "production"
port = 8080
threads = 4
EOF
```

---

### 4. Reverse Output with `tac`

`tac` is literally `cat` spelled backwards. It reads files or standard input and outputs each line in **reverse order** (the last line is printed first, and the first line is printed last).

```bash
# cat prints top to bottom (lines 1 to 5)
cat numbered.txt

# tac prints bottom to top (lines 5 down to 1)
tac numbered.txt
```

> [!TIP]
> `tac` is invaluable for viewing log files when you want to read recent chronological events from the bottom up without reversing each line's internal character order.

---

## ⚠️ Gotchas & Pro-Tips

- 🚨 **The "Useless Use of Cat" (UUOC):** In shell pipelines, avoid `cat file.txt | grep pattern` or `cat file.txt | wc -l`. Most Unix utilities take filenames directly: `grep pattern file.txt` or `wc -l < file.txt`. Using `cat` unnecessarily spawns an extra subshell process and consumes unnecessary I/O.
- 🚨 **Binary file terminal corruption:** Never run `cat /bin/bash` or `cat image.jpg` on your terminal! The binary control characters will corrupt your shell's font glyphs and terminal driver. If this happens accidentally, type `reset` and press Enter to restore normal terminal behavior.
- 💡 **Detecting Windows CRLF line endings:** If a bash script created on Windows fails with `\r: command not found`, run `cat -A script.sh`. If you see `^M$` at the end of lines, convert it with `dos2unix script.sh`.

---

## 💡 Notes

<!-- Add your own notes here as you watch the video -->
