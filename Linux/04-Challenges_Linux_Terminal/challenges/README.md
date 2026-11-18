# 🎯 Terminal Mastery Challenges

> **Course Resource:** `The Linux Terminal.pdf`  
> **Course Directory:** `~/Videos/video_courses/DevOp Camp ZTM/4.Challenges - The Linux Terminal/`  
> **Module:** 04 — Challenges: The Linux Terminal (Practical Assessment for Module 03)

---

## 📌 Overview

This challenge suite provides practical, hands-on tasks designed to evaluate and reinforce your command-line fluency from **Module 03 — The Linux Terminal in Depth**. A professional Linux engineer must be capable of quickly discovering flags, understanding how the shell resolves commands, navigating shell history with precision, protecting sensitive credentials, configuring operational timestamps, and safely crossing administrative privilege boundaries.

Complete these 10 tasks in your terminal. You can use the accompanying skeleton script [`challenge.sh`](./challenge.sh) to test and verify your implementations.

---

## 📋 The 10 Challenge Tasks

| # | Challenge Task | Core Utility / Concept | Primary Objective |
| :-: | :--- | :--- | :--- |
| **01** | Reveal hidden files | `man ls` | Discover flags (`-a`, `-A`) to view dotfiles |
| **02** | Command classification | `type cd` | Identify command nature (builtin vs executable) |
| **03** | Search command index | `apropos copy` | Search manual descriptions for related utilities |
| **04** | History event expansion | `!n` | Re-run past commands using event designators |
| **05** | Hidden history execution | `HISTCONTROL` | Execute a command without recording it in history |
| **06** | Forensic timestamping | `HISTTIMEFORMAT` | Enable date and time stamps in command history |
| **07** | Root user switching | `su -` / `whoami` | Switch to root, verify identity, and safely exit |
| **08** | Audited privilege execution | `sudo` | Execute single commands with superuser authority |
| **09** | Credential management | `passwd` | Inspect and update account authentication tokens |
| **10** | Interactive history search | `Ctrl + R` | Rapidly recall commands using incremental search |

---

## 🛠️ Detailed Task Instructions & Theory

### 1. Use `man` pages to find the flag that makes `ls` show hidden files

In Unix-like systems, any file or directory whose filename begins with a dot (`.`) is considered a "hidden" file or dotfile (e.g., `.bashrc`, `.profile`, `.ssh/`). The default `ls` command suppresses these files from standard output.

#### Command Reference

| Command / Key | Description |
| :--- | :--- |
| `man ls` | Opens the manual page for the `ls` utility |
| `/hidden` | Searches forward in the pager (`less`) for the keyword "hidden" |
| `n` / `N` | Jumps to next / previous match in the manual page |
| `q` | Quits the manual page viewer |
| `ls -a`, `ls --all` | Lists all entries, including hidden files, `.`, and `..` |
| `ls -A`, `ls --almost-all` | Lists all entries including hidden files, but omits `.` and `..` |

#### Key Flags Identified

```bash
# View all files including hidden files, current directory (.), and parent directory (..)
ls -a

# View all files including hidden files, excluding implied (.) and (..)
ls -A
```

---

### 2. Find what type of command `cd` is using `type`

The Bash shell categorizes commands into distinct types: **aliases**, **reserved shell keywords**, **shell builtins**, **functions**, and **external executable files**. Understanding how a command is interpreted is critical for debugging path and execution issues.

#### Command Reference

| Command | Output / Purpose |
| :--- | :--- |
| `type cd` | `cd is a shell builtin` |
| `type -t cd` | Prints only the type keyword: `builtin` |
| `type -a cd` | Shows all interpretations of `cd` across aliases, functions, and `$PATH` |
| `type -a ls` | Frequently shows `ls is aliased to 'ls --color=auto'` and `/usr/bin/ls` |

#### Architectural Insight: Why MUST `cd` be a builtin?

When Linux runs an external binary (e.g., `/usr/bin/grep`), the parent shell executes the `fork()` system call to create an isolated child process, followed by `execve()`. If `cd` were an external binary, the child process would change its own working directory and immediately terminate—leaving the parent shell's working directory completely untouched. Therefore, `cd` must execute within the memory space of the running shell itself.

---

### 3. Use `apropos` to find commands related to 'copy'

When you know the task you want to perform but cannot remember the exact utility name, `apropos` searches the `whatis` database (the one-line summary descriptions of all installed manual pages).

#### Command Reference

| Command | Description |
| :--- | :--- |
| `apropos copy` | Searches all manual summaries for the term "copy" |
| `man -k copy` | Equivalent synonym for `apropos copy` |
| `apropos -s 1 copy` | Restricts results strictly to Section 1 (User Commands) |
| `apropos -r '^copy'` | Performs a regular expression search matching descriptions starting with "copy" |
| `sudo mandb` | Re-indexes the manual page database (essential after installing new packages) |

#### Common Results

- `cp (1)` — copy files and directories
- `dd (1)` — convert and copy a file
- `install (1)` — copy files and set attributes
- `scp (1)` — secure copy (remote file copy program over SSH)
- `rsync (1)` — fast, versatile remote and local file-copying tool

---

### 4. Run a previous command from history using `!n`

Bash incorporates history event expansion (inherited from the C Shell / `csh`). The exclamation mark (`!`) serves as the history expansion character.

#### Command Reference

| Expansion | Description |
| :--- | :--- |
| `history` | Prints numbered list of past commands |
| `!n` | Re-executes the command numbered `n` from the `history` output |
| `!-n` | Re-executes the command executed `n` steps ago (e.g., `!-2`) |
| `!!` | Re-executes the immediate last command (equivalent to `!-1`) |
| `!string` | Re-executes the most recent command starting with `string` (e.g., `!curl`) |
| `!?string?` | Re-executes the most recent command containing `string` |
| `^old^new^` | Re-executes previous command, substituting `old` with `new` |

#### Example Walkthrough

```bash
$ history | tail -n 5
  498  ip addr show
  499  cat /etc/os-release
  500  df -h
  501  uname -r
  502  whoami

$ !500
df -h
Filesystem      Size  Used Avail Use% Mounted on
/dev/sda1        50G   12G   36G  25% /
```

---

### 5. Run a command without it appearing in history

To prevent sensitive commands (such as passing plain-text passwords, secret API keys, or temporary credentials via environment variables) from persisting in `~/.bash_history`, Bash provides the `HISTCONTROL` setting.

#### Command Reference

| Setting / Action | Mechanism |
| :--- | :--- |
| `HISTCONTROL=ignorespace` | Ignores commands prefixed with one or more leading spaces |
| `HISTCONTROL=ignoredups` | Ignores consecutive duplicate commands |
| `HISTCONTROL=ignoreboth` | Combines `ignorespace` and `ignoredups` (default on Ubuntu) |
| ` command_name` | Running any command with a leading space avoids the history buffer |
| `set +o history` | Temporarily halts history recording for the current shell |
| `set -o history` | Resumes history recording for the current shell |
| `history -d <number>` | Deletes an existing record by line number from the current session |

#### Practical Verification

```bash
# Verify HISTCONTROL includes ignorespace or ignoreboth
echo "$HISTCONTROL"

# Execute sensitive command with a leading space
 export SECRET_API_KEY="AIzaSyA_sample_key_987654"

# Verify the secret command is absent from history
history | tail -n 3
```

---

### 6. Set `HISTTIMEFORMAT` and verify timestamps appear

By default, Bash history only displays the command index number and the command text. For production systems, security forensics, and operational accountability, timestamps are vital.

#### Command Reference

| Command / Variable | Purpose |
| :--- | :--- |
| `export HISTTIMEFORMAT="%F %T "` | Sets timestamp format to `YYYY-MM-DD HH:MM:SS ` |
| `export HISTTIMEFORMAT="%d/%m/%Y %H:%M:%S "` | Sets timestamp format using Day/Month/Year |
| `history 10` | Displays the last 10 commands with timestamps included |
| `~/.bashrc` | Add the `export` line here to make timestamps persistent across sessions |

#### Under the Hood: Timestamp Storage

When `HISTTIMEFORMAT` is active, Bash writes a Unix epoch timestamp (seconds since January 1, 1970) preceded by a hash symbol (`#`) into `~/.bash_history`:

```text
#1700001234
ls -la /var/log
#1700001240
systemctl status nginx
```

---

### 7. Switch to root using `su` and verify with `whoami`, then exit

The `su` (substitute user) utility allows you to switch to another user account (defaulting to `root` if no username is supplied).

#### Command Reference

| Command | Description |
| :--- | :--- |
| `su` | Switches to root, but **retains** the caller's environment, directory, and PATH |
| `su -`, `su -l`, `su --login` | Switches to root with a **clean login shell** (sets root's `$HOME`, `$PATH`, environment) |
| `whoami` | Displays the effective username (`root`) |
| `id` | Displays detailed numeric IDs: `uid=0(root) gid=0(root) groups=0(root)` |
| `exit` / `Ctrl+D` | Terminates the root session and returns to the unprivileged shell |

> [!WARNING]
> **Ubuntu Root Behavior:**  
> On Ubuntu, the root account is disabled by default for direct password login (it has no assigned password in `/etc/shadow`). Direct `su -` requires knowing the root password. In modern Ubuntu administration, use `sudo su -` or `sudo -i` to initialize a root login shell using your sudo password.

---

### 8. Use `sudo` to run a command as root

The `sudo` (Superuser Do) tool provides controlled, audited privilege escalation. Unlike `su`, users authenticate using their **own password**, and every invocation is logged to `/var/log/auth.log` (or systemd journal).

#### Command Reference

| Command | Description |
| :--- | :--- |
| `sudo <command>` | Executes a single command with root privileges |
| `sudo whoami` | Verifies execution as root (returns `root`) |
| `sudo -l` | Lists privileges and allowed commands defined for your user in `/etc/sudoers` |
| `sudo -i` | Opens an interactive login shell as root |
| `sudo -k` | Invalidates cached credentials (forces password prompt on next sudo) |

#### Architectural Comparison: `su` vs `sudo`

| Feature | `su` / `su -` | `sudo` |
| :--- | :--- | :--- |
| **Authentication** | Requires the target account's (root's) password | Requires the invoking user's own password |
| **Granularity** | All-or-nothing root shell access | Per-command privilege assignment via `/etc/sudoers` |
| **Audit Trail** | Shell session opened, individual commands not logged by default | Every command invocation is logged with timestamp and user |
| **Best Practice** | Discouraged on modern distributed/cloud environments | Standard enterprise and DevOps security posture |

---

### 9. Change your user password with `passwd`

The `passwd` utility updates user authentication tokens. It interacts with `/etc/shadow` through the PAM (Pluggable Authentication Modules) framework.

#### Command Reference

| Command | Permissions | Description |
| :--- | :--- | :--- |
| `passwd` | Regular user | Updates your own user password (requires current password first) |
| `sudo passwd <username>` | Root / Sudoer | Changes any user's password (does not require old password) |
| `passwd -S` | Regular user | Checks password status (P = active password, L = locked, NP = no password) |
| `sudo passwd -l <username>` | Root / Sudoer | Locks an account by prepending `!` to the hash in `/etc/shadow` |
| `sudo passwd -u <username>` | Root / Sudoer | Unlocks a previously locked account |
| `sudo passwd -e <username>` | Root / Sudoer | Expires password immediately, forcing change upon next login |

#### Deep Dive: How can an unprivileged user modify `/etc/shadow`?

The `/etc/shadow` file has `-rw-r----- 1 root shadow` permissions—unreadable and unwritable by regular users. However, `/usr/bin/passwd` possesses the **SUID (Set User ID)** permission bit (`-rwsr-xr-x`). When executed by an ordinary user, the binary runs with the effective privileges of the file's owner (`root`), allowing it to securely update `/etc/shadow` after validating credentials.

---

### 10. Use `Ctrl + R` to find a previous command in history

GNU Readline powers interactive command-line editing in Bash. Instead of repeatedly pressing the Up Arrow, `Ctrl + R` activates reverse incremental searching.

#### Navigation Workflow

1. Press **`Ctrl + R`**. The prompt switches to: `(reverse-i-search)`': `
2. Type any substring of the command you want to recall (e.g., `apt`, `docker`, `systemctl`).
3. As you type, Bash instantly displays the most recent matching command.
4. Press **`Ctrl + R` again** to cycle backward to earlier matches matching the same search query.
5. Choose how to handle the match:
   - Press **`Enter`**: Executes the recalled command immediately.
   - Press **`Right Arrow`** or **`Tab`** or **`Ctrl + E`**: Selects the command and places the cursor at the end of the line, allowing you to edit flags or arguments before running.
   - Press **`Ctrl + G`** or **`Ctrl + C`**: Cancels search and restores your empty prompt.

#### Readline Power Shortcuts Cheat Sheet

| Shortcut | Action |
| :--- | :--- |
| `Ctrl + R` | Reverse incremental search through command history |
| `Ctrl + A` | Move cursor to start of line |
| `Ctrl + E` | Move cursor to end of line |
| `Ctrl + U` | Cut (delete) from cursor to beginning of line |
| `Ctrl + K` | Cut (delete) from cursor to end of line |
| `Ctrl + W` | Cut the word immediately preceding the cursor |
| `Ctrl + Y` | Paste (yank) the last text cut with `Ctrl+U`, `Ctrl+K`, or `Ctrl+W` |
| `Ctrl + L` | Clear terminal screen without losing current input line |

---

## 💡 Gotchas & Pro Tips

> [!TIP]
> **Escaping History Expansion in Double Quotes:**  
> In Bash interactive shells, exclamation marks inside double quotes trigger history expansion (e.g., `echo "Hello World!"` can fail with `bash: !": event not found`). Use single quotes (`echo 'Hello World!'`) or escape the exclamation mark with a backslash (`echo "Hello World\!"`).

> [!NOTE]
> **In-Memory vs On-Disk History:**  
> History commands typed in an open terminal remain in memory during the active session. They are appended to `~/.bash_history` only when the shell exits normally. To manually synchronize history between active terminals:
> - `history -a` (append current session history to file)
> - `history -r` (read history file into current session)
> - `history -w` (write entire history list to file)

> [!WARNING]
> **Environment Leakage with `su` vs `su -`:**  
> Running plain `su` retains the unprivileged user's `$PATH`, `$HOME`, and aliases. This can cause administrative tasks to fail or pose a security risk if an unprivileged directory precedes `/usr/sbin` in `$PATH`. Always use `su -` or `sudo -i` for administrative tasks requiring a clean environment.

---

## 💡 Notes

<!-- Document your personal findings, shortcut preferences, and VM-specific observations below -->

