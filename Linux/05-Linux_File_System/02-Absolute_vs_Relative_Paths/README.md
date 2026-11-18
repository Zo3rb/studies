# 📖 Lesson: Absolute vs Relative Paths

> **Course Video:** `2- Absolute vs. Relative Paths. Walking through the File System (pwd, cd, tree)/Absolute vs. Relative Paths. Walking through the File System (pwd, cd, tree).mp4`  
> **Module:** 05 — The Linux File System

---

## 🎯 What This Lesson Covers

- Understanding the fundamental difference between **Absolute Paths** and **Relative Paths**.
- Special navigation symbols: `.`, `..`, `~`, and `-`.
- Primary navigation and inspection commands: `pwd`, `cd`, and `tree`.
- Real-world filesystem walking patterns and command options.

---

## 📝 Key Concepts

### 1. Absolute vs. Relative Paths

Every file or directory in Linux is accessed via a path string.

| Path Type | Starting Point | Characteristics | Examples |
| :--- | :--- | :--- | :--- |
| **Absolute Path** | Always starts with root (`/`) | Unambiguous; points to the exact same location regardless of your current directory. | `/var/log/syslog`<br>`/etc/nginx/nginx.conf`<br>`/home/ali/projects` |
| **Relative Path** | Starts from your **Current Working Directory (CWD)** | Depends on where you currently stand; does **not** begin with `/`. | `projects/notes.txt`<br>`./script.sh`<br>`../sibling_dir/app.py` |

```
                       / (root)
                     /   \
                  home    var
                  /         \
                ali         log
               /   \          \
          Desktop  notes      syslog
            /
        project
```

- If you are inside `/home/username/Desktop/project`:
  - Absolute path to `syslog`: `/var/log/syslog`
  - Relative path to `notes`: `../../notes`
  - Relative path to parent (`Desktop`): `..`

---

### 2. Special Directory Shortcuts

| Shortcut | Meaning | Behavior / Equivalent |
| :--- | :--- | :--- |
| **`.`** | Current Working Directory | Used when executing local scripts (`./run.sh`) or specifying current target (`cp /tmp/file .`). |
| **`..`** | Parent Directory | One level above current directory (`cd ..`, `cat ../config.json`). |
| **`../..`** | Grandparent Directory | Two levels above current directory. |
| **`~`** | Current User's Home Directory | Expands to `$HOME` (e.g., `/home/username`). |
| **`~username`** | Specific User's Home Directory | Expands to that user's home (e.g., `~root` expands to `/root`). |
| **`-`** | Previous Working Directory | Flips back to the directory you were in immediately prior (`$OLDPWD`). |

---

### 3. Command Reference

#### `pwd` — Print Working Directory
Displays the absolute path of the directory you are currently located in.

| Option | Meaning | Explanation |
| :--- | :--- | :--- |
| *(none)* | Logical path | Displays current path, following symbolic links (default). |
| **`-L`** | Logical | Print the environment's current working directory, including symlinks. |
| **`-P`** | Physical | Resolve all symbolic links and display the physical on-disk path. |

#### `cd` — Change Directory
Changes the shell's current working directory.

| Command Syntax | Destination |
| :--- | :--- |
| `cd` or `cd ~` | Navigate directly to user's home directory (`$HOME`). |
| `cd /absolute/path` | Jump directly to specified absolute path. |
| `cd relative/path` | Navigate relative to current directory. |
| `cd ..` | Move up one level to parent directory. |
| `cd ../..` | Move up two directory levels. |
| `cd -` | Switch back to the previous working directory (`$OLDPWD`) and print its path. |

#### `tree` — Visualize Directory Hierarchies
Displays directory contents in an indented tree diagram.

| Flag | Meaning | Explanation |
| :--- | :--- | :--- |
| **`-L <level>`** | Level depth | Limit recursion depth to `<level>` directories deep (e.g., `tree -L 2`). |
| **`-d`** | Directories only | List only directories; do not display files. |
| **`-a`** | All files | Include hidden files (dotfiles). |
| **`-F`** | File type indicators | Append `/` for directories, `*` for executables, `@` for symlinks. |
| **`-p`** | Permissions | Print file permission strings alongside file names. |
| **`-h`** | Human-readable size | Print file size in KB, MB, GB format. |

---

## 💻 Command Examples

```bash
# Check where you are (logical vs physical path)
pwd
pwd -P

# Navigate to /etc, then back to previous directory
cd /etc
pwd
cd -
pwd

# Navigate using relative path
cd ./01-Filesystem_Hierarchy_Standard
cd ..

# View directory structure 2 levels deep
tree -L 2 -d /etc
```

---

## ⚠️ Gotchas & Pro-Tips

- 🚨 **The `./` requirement for scripts:** Unlike DOS/Windows, Linux does NOT include the current directory (`.`) in `$PATH` for security reasons (to prevent executing malicious binaries like a spoofed `ls`). To run a script in your current directory, you MUST prefix it with `./`: `./myscript.sh`.
- 💡 **Fast toggling with `cd -`:** When performing operations between two distant directories (e.g. `/var/log/nginx` and `/etc/nginx/conf.d`), use `cd -` to toggle back and forth instantly without typing paths.
- 💡 **Path autocomplete:** Always use the `Tab` key! Pressing `Tab` once autocompletes unambiguous directory names; pressing `Tab` twice displays all possible path matches. This eliminates typing errors.

---

## 💡 Notes

<!-- Add your own notes here as you watch the video -->
