# 📖 Lesson: The Basics of VIM Text Editor

> **Course Video:** `27 - The Basics of VIM Text Editor`
> **Module:** 05 — The Linux File System

---

## 🎯 What This Lesson Covers
Introduction to VIM — the most ubiquitous text editor on Linux servers. VIM is modal, meaning keystrokes mean different things depending on the current mode.

---

## 📝 Key Concepts

### VIM Modes

| Mode | How to Enter | Indicator | Purpose |
| :--- | :--- | :--- | :--- |
| **Normal** | `Esc` (default on open) | — | Navigation, commands |
| **Insert** | `i`, `I`, `a`, `A`, `o`, `O` | `-- INSERT --` | Typing text |
| **Visual** | `v` (char), `V` (line), `Ctrl+V` (block) | `-- VISUAL --` | Select text |
| **Command** | `:` from Normal | `:` at bottom | Save, quit, search/replace |

### Opening & Closing VIM

```bash
vim filename        # open/create file
vim +N filename     # open at line N
vim +/pattern file  # open at first match of pattern
```

| Command | Action |
| :--- | :--- |
| `:w` | Save (write) |
| `:q` | Quit (fails if unsaved changes) |
| `:wq` or `:x` | Save and quit |
| `:q!` | Quit WITHOUT saving (force) |
| `:w filename` | Save as new filename |
| `ZZ` | Save and quit (Normal mode shortcut) |
| `ZQ` | Quit without saving (Normal mode shortcut) |

### Entering Insert Mode

| Key | Where cursor inserts |
| :--- | :--- |
| `i` | Before cursor |
| `I` | Beginning of line |
| `a` | After cursor |
| `A` | End of line |
| `o` | New line below |
| `O` | New line above |

### Basic Navigation (Normal Mode)

| Key | Movement |
| :--- | :--- |
| `h` | Left |
| `j` | Down |
| `k` | Up |
| `l` | Right |
| `w` | Next word start |
| `b` | Previous word start |
| `e` | Next word end |
| `0` | Beginning of line |
| `$` | End of line |
| `gg` | Top of file |
| `G` | Bottom of file |
| `NG` | Go to line N |
| `Ctrl+F` | Page down |
| `Ctrl+B` | Page up |

---

## ⚠️ Gotchas
- Always press `Esc` first if you're unsure what mode you're in — multiple `Esc` presses are safe
- `:q!` discards ALL unsaved changes — no undo
- VIM is on nearly every Linux server; learning it is non-negotiable for DevOps

---

## 💡 Notes
<!-- Add your own notes here as you watch the video -->
