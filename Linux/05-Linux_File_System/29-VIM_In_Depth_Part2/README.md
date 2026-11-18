# 📖 Lesson: The VIM Editor In Depth — Part 2

> **Course Video:** `29 - The VIM Editor In Depth - Part 2`
> **Module:** 05 — The Linux File System

---

## 🎯 What This Lesson Covers
Advanced VIM: Visual mode, global find & replace (substitution), split windows, tabs, and essential `.vimrc` settings.

---

## 📝 Key Concepts

### Visual Mode — Selecting Text

| Key | Selection Type |
| :--- | :--- |
| `v` | Character-wise visual mode |
| `V` | Line-wise visual mode |
| `Ctrl+V` | Block visual mode (column select) |

After selecting, you can:
- `d` — delete selection
- `y` — yank (copy) selection
- `c` — change (delete + enter Insert)
- `>` / `<` — indent / de-indent
- `:` — apply a command to the selection

### Find & Replace (Substitution)

```vim
:s/old/new/          " Replace first on current line
:s/old/new/g         " Replace all on current line
:%s/old/new/g        " Replace all in entire file
:%s/old/new/gc       " Replace all, with confirmation (y/n/a/q)
:5,10s/old/new/g     " Replace in lines 5-10
```

Flags:
| Flag | Meaning |
| :--- | :--- |
| `g` | Global (all occurrences on line) |
| `c` | Confirm each replacement |
| `i` | Case-insensitive |
| `I` | Case-sensitive |

### Split Windows

| Command | Action |
| :--- | :--- |
| `:sp filename` | Horizontal split |
| `:vsp filename` | Vertical split |
| `Ctrl+W h/j/k/l` | Move between splits |
| `Ctrl+W =` | Make all splits equal size |
| `Ctrl+W +/-` | Resize split |
| `:q` | Close current split |

### Tabs

| Command | Action |
| :--- | :--- |
| `:tabnew filename` | Open file in new tab |
| `gt` | Next tab |
| `gT` | Previous tab |
| `:tabclose` | Close current tab |
| `:tabs` | List all tabs |

### Useful `.vimrc` Settings

```vim
set number          " Show line numbers
set relativenumber  " Relative line numbers
set hlsearch        " Highlight search results
set incsearch       " Incremental search (search as you type)
set autoindent      " Auto-indent new lines
set expandtab       " Use spaces instead of tabs
set tabstop=4       " Tab width = 4 spaces
set shiftwidth=4    " Indent width = 4 spaces
set mouse=a         " Enable mouse support
set wrap            " Wrap long lines
syntax on           " Enable syntax highlighting
colorscheme desert  " Set color scheme
```

Apply settings without restarting: `:source ~/.vimrc`

---

## ⚠️ Gotchas
- `:%s/foo/bar/g` is case-sensitive by default — add `i` flag for case-insensitive
- Block visual mode (`Ctrl+V`) is incredibly powerful for column editing — practice it
- Always have a `.vimrc` — raw VIM is uncomfortable; configured VIM is a joy

---

## 💡 Notes
<!-- Add your own notes here as you watch the video -->
