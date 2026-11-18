# 📖 Lesson: The VIM Editor In Depth — Part 1

> **Course Video:** `28 - The VIM Editor In Depth - Part 1`
> **Module:** 05 — The Linux File System

---

## 🎯 What This Lesson Covers
Deep-dive into VIM editing operations: searching within a file, deletion, copy/paste (yank), undo/redo, and the dot repeat command.

---

## 📝 Key Concepts

### Searching in VIM (Normal Mode)

| Command | Action |
| :--- | :--- |
| `/pattern` | Search forward for pattern |
| `?pattern` | Search backward for pattern |
| `n` | Next match (same direction) |
| `N` | Previous match (reverse direction) |
| `*` | Search for word under cursor (forward) |
| `#` | Search for word under cursor (backward) |
| `:noh` | Clear search highlight |
| `:set hlsearch` | Enable search highlighting |

### Deletion Commands (Normal Mode)

| Command | What it deletes |
| :--- | :--- |
| `x` | Character under cursor |
| `X` | Character before cursor |
| `dw` | From cursor to end of word |
| `db` | From cursor to start of word |
| `dd` | Entire current line |
| `D` or `d$` | From cursor to end of line |
| `d0` | From cursor to start of line |
| `dgg` | From cursor to top of file |
| `dG` | From cursor to bottom of file |
| `Ndd` | Delete N lines (e.g. `5dd`) |

> **Tip:** Deleted text goes into VIM's **register** — it can be pasted back with `p`

### Copy (Yank) and Paste

| Command | Action |
| :--- | :--- |
| `yy` or `Y` | Yank (copy) current line |
| `yw` | Yank word |
| `y$` | Yank to end of line |
| `Nyy` | Yank N lines (e.g. `3yy`) |
| `p` | Paste after cursor/below line |
| `P` | Paste before cursor/above line |

### Undo and Redo

| Command | Action |
| :--- | :--- |
| `u` | Undo last change |
| `U` | Undo all changes on current line |
| `Ctrl+R` | Redo (undo the undo) |

### The Dot Command — Repeat Last Change

```
.    ← repeats whatever the last change was
```
Example: `dd` deletes a line → `.` deletes the next line too. Incredibly powerful for repetitive edits.

### Change Commands (delete + enter Insert mode)

| Command | Action |
| :--- | :--- |
| `cw` | Change word |
| `cc` | Change entire line |
| `C` or `c$` | Change to end of line |
| `r` | Replace single character |
| `R` | Replace mode (overwrite) |

---

## ⚠️ Gotchas
- `u` undoes one change at a time — but a single Insert session counts as one change
- `dd` doesn't "delete" to clipboard — it goes to VIM's default register `""`
- Use `"+dd` to delete to the system clipboard (if VIM compiled with `+clipboard`)

---

## 💡 Notes
<!-- Add your own notes here as you watch the video -->
