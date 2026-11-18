# 📖 Lesson: Root vs. Non-Privileged Users

> **Course Video:** `~/Videos/video_courses/DevOp Camp ZTM/3.The Linux Terminal in Depth/10 - root vs. Non-Privileged Users/root vs. Non-Privileged Users.mp4`  
> **Module:** 03 — The Linux Terminal in Depth

---

## 🎯 What This Lesson Covers

The core Unix security architecture and privilege model: understanding the omnipotent `root` superuser (UID 0) versus standard non-privileged user accounts (UID >= 1000). We contrast delegation tools (`sudo`, `sudo -i`, `sudo -s`, `su`, `su -`), master the configuration of `/etc/sudoers` using the mandatory `visudo` safeguard utility, manage authentication credentials with `passwd`, and apply the Principle of Least Privilege in modern DevOps infrastructure.

---

## 📝 Key Concepts

### 1. The Unix Privilege Model: UID 0 vs Everyone Else

In Linux, security permissions and access control are anchored to a numeric **User Identifier (UID)**:

```
+-------------------------------------------------------------------------+
|                    UID 0: The ROOT Superuser                            |
|  - Complete, unrestricted control over the entire operating system      |
|  - Bypasses all standard DAC (Discretionary Access Control) file checks |
|  - Can kill any process, bind privileged ports (< 1024), mount drives   |
|  - Prompt symbol: '#'                                                   |
+-------------------------------------------------------------------------+
                                     │
+------------------------------------+------------------------------------+
│                                    │                                    │
▼                                    ▼                                    ▼
[ System / Service Accounts ]        [ Regular Non-Privileged Users ]     [ Special Accounts ]
UID 1 to 999                         UID 1000+                            nobody (UID 65534)
(daemon, www-data, mysql, sshd)      (ali, john, devops)                  Unprivileged sandbox
Runs background daemons safely       Interactive human logins
No interactive login shell           Restricted to own $HOME
                                     Prompt symbol: '$'
```

---

### 2. Privilege Escalation: `sudo` vs `su`

When an administrator needs root privileges, there are two fundamental approaches:

```
                  ┌─────────────────────────────────────────┐
                  │ How to run administrative tasks?        │
                  └────────────────────┬────────────────────┘
                                       │
                ┌──────────────────────┴──────────────────────┐
                ▼                                             ▼
       [ Temporary Delegation ]                       [ Full User Switch ]
             run: sudo                                      run: su
                │                                             │
   - Authenticates using YOUR password           - Requires the TARGET's password
   - Granular command authorization              - Complete shell replacement
   - Actions logged to /var/log/auth.log         - Unaudited once inside
```

| Dimension | `sudo <command>` | `su` / `su -` |
| :--- | :--- | :--- |
| **Authentication** | Prompts for the **invoking user's** password | Prompts for the **target user's (root's)** password |
| **Principle** | Least Privilege: runs only that single command as root | Full takeover: opens a persistent root shell session |
| **Security Audit** | Every command is logged with timestamp to `/var/log/auth.log` | Shell commands run under `su` are unlogged to syslog |
| **Root Password Needed?**| **No**. Root account can (and should) remain locked | **Yes**. Root account must have an active known password |

---

### 3. Variants of Root Access: `sudo`, `sudo -i`, `sudo -s`, `su -`

| Command | Environment Loaded | Working Directory | Shell Type | Use Case |
| :--- | :--- | :--- | :--- | :--- |
| **`sudo <cmd>`** | User's environment (with secure `secure_path`) | Current working directory | Non-interactive execution of `<cmd>` | **Default standard** for all daily admin tasks |
| **`sudo -i`** | **Target's (root's) full login environment** | `/root` | Interactive login shell (reads `/root/.profile`, `/root/.bashrc`) | Full administrative overhaul, installing major system stacks |
| **`sudo -s`** | User's environment retained, root privileges | Current working directory | Interactive non-login shell | Quick multi-command root task without leaving current folder |
| **`su -`** | Root's full environment | `/root` | True login shell as root | Classic Unix system administration |
| **`su`** (without hyphen) | **Retains calling user's PATH and environment** | Current working directory | Non-login shell | **Dangerous / Deprecated**: causes PATH pollution |

> [!WARNING]
> Always use `su -` instead of plain `su`. Plain `su` retains the unprivileged user's `$PATH`, which can lead to running malicious trojan binaries located in user directories!

---

### 4. The `/etc/sudoers` File and the Golden Rule of `visudo`

Who is allowed to run `sudo`? This policy is defined in `/etc/sudoers` and drop-in files inside `/etc/sudoers.d/`.

#### Sudoers Syntax Anatomy:
```ini
# User / Group     Host = (RunAs_User : RunAs_Group)     Commands
root               ALL=(ALL:ALL)                         ALL
%sudo              ALL=(ALL:ALL)                         ALL
ali                ALL=(ALL)                             NOPASSWD: /usr/bin/systemctl restart nginx
```
- `%sudo`: The `%` prefix indicates a **group**. Any user belonging to the `sudo` group inherits sudo permissions.
- `NOPASSWD`: Permits specific automated actions without prompting for passwords (critical for CI/CD runners).

#### 🚨 THE GOLDEN RULE: NEVER EDIT `/etc/sudoers` DIRECTLY!
- **NEVER** run `nano /etc/sudoers` or `vim /etc/sudoers`.
- If you make a single syntax error (such as a missing colon or misspelled keyword) and save the file, `sudo` will immediately break. You will be permanently locked out of root access on cloud servers!
- **ALWAYS** use:
  ```bash
  sudo visudo
  ```
  `visudo` opens the file in an editor, locks it against concurrent edits, and **strictly validates syntax** upon saving. If there is a syntax error, it refuses to save and presents options: `e` to re-edit or `x` to exit without corrupting the system.

---

### 5. Managing Passwords with `passwd`

The `passwd` utility updates user authentication tokens in `/etc/shadow`:

| Command | Action | Permissions Required |
| :--- | :--- | :--- |
| `passwd` | Changes password for the currently logged-in user | Normal user (must enter current password first) |
| `sudo passwd <user>` | Resets password for `<user>` without asking for old one | Root / Sudo |
| `sudo passwd -l <user>` | **Locks** the account (prepends `!` to password hash in `/etc/shadow`) | Root / Sudo |
| `sudo passwd -u <user>` | **Unlocks** a previously locked account | Root / Sudo |
| `sudo passwd -d <user>` | Deletes password (account has no password) | Root / Sudo |
| `sudo passwd -S <user>` | Displays password status (Locked `L`, Password `P`, No password `NP`) | Root / Sudo |

---

## ⚠️ Gotchas & Pro Tips

1. **Why Ubuntu Locks the Root Account by Default**:
   - Ubuntu ships with the `root` account locked (`!` in `/etc/shadow`). Root has no password!
   - This prevents brute-force SSH attacks against `root`.
   - The first user account created during OS installation is automatically added to the `sudo` group.
2. **The 15-Minute Sudo Grace Period**:
   - Once you enter your password for `sudo`, the kernel caches your credential ticket for 15 minutes by default (`timestamp_timeout=15`).
   - To immediately invalidate the cached ticket (e.g. before walking away from your desk):
     ```bash
     sudo -k
     ```
3. **Prompt Indicators**:
   - Terminal prompt ending in `$` = Non-privileged user.
   - Terminal prompt ending in `#` = Superuser (`root`).

---

## 💡 Notes

<!-- Add your own personal notes, observations, and questions here -->
