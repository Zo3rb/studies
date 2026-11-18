# 📖 Lesson: Viewing Files — Part 2 (less, more)

> **Course Video:** `9 - Viewing Files - Part 2  (less, more)/Viewing Files - Part 2  (less, more).mp4`  
> **Module:** 05 — The Linux File System

---

## 🎯 What This Lesson Covers

- Terminal pagers: what they are and why they are necessary for large files.
- The differences between the legacy `more` and the modern `less` utility.
- Complete navigation keyboard shortcuts inside `less`.
- Essential command-line flags for `less` (`-N`, `-S`, `-i`, `+F`, `+<line>`).

---

## 📝 Key Concepts

### 1. What is a Terminal Pager?

When you run `cat` on a large file (such as a 50,000-line system log), `cat` dumps all 50,000 lines into your terminal at once. Your terminal buffer overflows, you lose the top lines, and the process wastes CPU and memory.

A **pager** is an interactive viewer that displays file content one screenful (page) at a time, allowing you to scroll, jump, and search interactively without loading the entire file into RAM.

---

### 2. `more` vs. `less` — "Less is More"

The Unix aphorism *"less is more"* stems from `less` being designed as a superior, backward-compatible replacement for the earlier `more` pager:

| Feature | `more` (Legacy) | `less` (Modern) |
| :--- | :--- | :--- |
| **Scrolling Direction** | Primarily forward only (early versions) | **Bidirectional:** freely scroll forward and backward |
| **File Loading** | Reads entire file into buffer | **Lazy loading:** starts immediately without waiting to read huge gigabyte files |
| **Navigation** | Primitive line-by-line | Rich Vi-like key bindings (`j`, `k`, `g`, `G`, `/`, `n`) |
| **Search** | Forward search only | Bidirectional regex search (`/` forward, `?` backward) |
| **Live Log Following** | Not supported | Supported via `+F` (similar to `tail -f`) |
| **Memory Consumption** | High on large files | Minimal and constant |

---

### 3. Interactive Key Bindings Inside `less`

Once inside `less <file>`, use these keystrokes to navigate:

| Key / Shortcut | Navigation Action |
| :--- | :--- |
| **`Space`** or **`f`** or **`Ctrl+F`** | Scroll **forward one full screen** |
| **`b`** or **`Ctrl+B`** | Scroll **backward one full screen** |
| **`d`** or **`Ctrl+D`** | Scroll **forward half a screen** |
| **`u`** or **`Ctrl+U`** | Scroll **backward half a screen** |
| **`Enter`** or **`j`** or **`Down Arrow`** | Scroll **down one line** |
| **`k`** or **`Up Arrow`** | Scroll **up one line** |
| **`g`** | Jump to the **very beginning** of the file (line 1) |
| **`G`** | Jump to the **very end** of the file (last line) |
| **`<number>g`** (e.g. `50g`) | Jump directly to line number `<number>` |
| **`/pattern`** | **Search forward** for `pattern` (press `Enter` to search) |
| **`?pattern`** | **Search backward** for `pattern` |
| **`n`** | Repeat search for **next** occurrence |
| **`N`** | Repeat search for **previous** occurrence (opposite direction) |
| **`h`** | Display interactive help menu of all available keys |
| **`q`** | **Quit** and return to the shell prompt |

---

### 4. Powerful `less` Command-Line Flags

```bash
# Display absolute line numbers alongside each line
less -N /var/log/syslog

# Truncate / chop long lines instead of wrapping them to next line
# (Use Left and Right arrow keys to scroll horizontally!)
less -S /var/log/nginx/access.log

# Case-insensitive search if search term contains only lowercase letters
less -i document.txt

# Start reading directly at line 150
less +150 /etc/ssh/sshd_config

# Open file and immediately search and jump to the first occurrence of "ERROR"
less +/ERROR /var/log/syslog

# Follow mode: live stream appending log lines (press Ctrl+C to stop following and enter normal scrolling!)
less +F /var/log/syslog
```

---

## ⚠️ Gotchas & Pro-Tips

- 💡 **Exiting `less`:** If you are stuck inside `less`, `man`, or `git log` (all use `less` as the default `$PAGER`), simply press **`q`**. Do not press `Ctrl+C` or `Ctrl+Z`.
- 💡 **`less +F` vs `tail -f`:** `less +F` is superior to `tail -f` for monitoring active log files. When a sudden crash happens, in `tail -f` the error scrolls off screen immediately. In `less +F`, press `Ctrl+C` to freeze live following, scroll up backwards (`k` / `b`) to read the stack trace, and press `Shift+F` to resume following!
- 💡 **Horizontal Scrolling with `-S`:** When viewing wide CSV files or database dump logs, standard terminals wrap long lines into an unreadable mess. Always run `less -S` so each line stays on a single horizontal row.

---

## 💡 Notes

<!-- Add your own notes here as you watch the video -->
