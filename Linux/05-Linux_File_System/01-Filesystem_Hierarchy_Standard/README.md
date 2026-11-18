# 📖 Lesson: The Filesystem Hierarchy Standard (FHS)

> **Course Video:** `1 - The Filesystem Hierarchy Standard ( FHS)/The Filesystem Hierarchy Standard ( FHS).mp4`  
> **Module:** 05 — The Linux File System

---

## 🎯 What This Lesson Covers

- What the **Filesystem Hierarchy Standard (FHS)** is and why it exists.
- The standard Linux directory structure and the exact purpose of every root directory.
- The modern **UsrMerge** architecture (`/bin` → `/usr/bin`, `/lib` → `/usr/lib`).
- Key administrative commands: `ls /`, `ls /etc`, `ls /var/log`.

---

## 📝 Key Concepts

### 1. What is the Filesystem Hierarchy Standard (FHS)?

The **Filesystem Hierarchy Standard (FHS)** is an open standard maintained by the Linux Foundation that specifies the directory structure and directory contents in Linux distributions.

Without FHS:
- Software installers would place configuration files, executables, and libraries in arbitrary locations.
- System administrators would struggle to locate logs, configs, or system binaries when moving between distributions.

With FHS:
- Any Linux tool or admin knows that machine-local configuration files reside in `/etc`, logs in `/var/log`, and device nodes in `/dev`.

---

### 2. Comprehensive FHS Directory Reference

| Directory | Purpose | Typical Contents / Examples |
| :--- | :--- | :--- |
| **`/`** | **Root Directory** — The top-level ancestor of every directory and file in the entire filesystem. | Contains all mounted filesystems and foundational directories. |
| **`/bin`** | **Essential User Binaries** — Commands essential for single-user mode and system recovery before `/usr` is mounted. | `bash`, `cat`, `cp`, `ls`, `mv`, `rm` *(Symlinked to `/usr/bin` on modern Ubuntu/Debian)*. |
| **`/sbin`** | **Essential System Binaries** — Administrative tools primarily intended for `root` for boot, repair, and recovery. | `fdisk`, `fsck`, `init`, `reboot`, `iptables` *(Symlinked to `/usr/sbin` on modern Ubuntu/Debian)*. |
| **`/etc`** | **Host-Specific System Configurations** — Static configuration files for the operating system and installed services. Contains no binaries. | `/etc/passwd`, `/etc/fstab`, `/etc/hosts`, `/etc/shadow`, `/etc/ssh/sshd_config`, `/etc/network/`. |
| **`/home`** | **User Home Directories** — Personal workspaces, documents, and user-level configs (dotfiles). | `/home/alice/`, `/home/bob/`, `~/.bashrc`. |
| **`/root`** | **Root User Home Directory** — The private home directory of the superuser (`root`), kept on the root partition separate from `/home`. | Root's bash history, scripts, SSH keys (`/root/.ssh`). |
| **`/var`** | **Variable Data** — Data that changes dynamically during system operation (logs, caches, mail spools, transient database files). | `/var/log` (system & daemon logs), `/var/cache` (APT caches), `/var/spool` (print/mail queues), `/var/run` (PID files). |
| **`/tmp`** | **Temporary Files** — Volatile storage accessible by all users and programs. Often mounted as `tmpfs` (RAM) and wiped on reboot. | Temporary build artifacts, session sockets, installer temp files. |
| **`/usr`** | **User Programs & Read-Only Data** — Secondary hierarchy containing sharable, read-only user utilities and applications. | `/usr/bin` (user commands), `/usr/sbin` (admin tools), `/usr/lib` (libraries), `/usr/share` (man pages, documentation). |
| **`/lib`** | **Shared Libraries & Kernel Modules** — Shared library files (`.so`) needed by binaries in `/bin` and `/sbin`. | `libc.so.*`, `/lib/modules/<kernel-version>/` *(Symlinked to `/usr/lib`)*. |
| **`/dev`** | **Device Nodes** — Special character and block device files providing userland access to hardware and pseudo-devices. | `/dev/sda` (disk), `/dev/null` (null sink), `/dev/zero`, `/dev/urandom`, `/dev/tty` (terminal). Managed by `udev`. |
| **`/proc`** | **Process Information Virtual Filesystem** — An in-memory pseudofilesystem exposing live kernel state, system hardware, and processes. | `/proc/cpuinfo`, `/proc/meminfo`, `/proc/uptime`, `/proc/<PID>/` (status of running PID). |
| **`/sys`** | **Hardware & Device Model Virtual Filesystem** — Kernel object filesystem (`sysfs`) exposing device drivers, buses, power states, and tunables. | `/sys/class/net/`, `/sys/block/`, `/sys/devices/`. |
| **`/mnt`** | **Temporary Mount Points** — Standard directory where sysadmins manually mount transient filesystems (external drives, NFS shares). | `/mnt/backup`, `/mnt/usb`. |
| **`/media`** | **Removable Media Mount Points** — Automatic mount location for removable storage devices (CD-ROMs, USB flash drives, memory cards). | `/media/ali/KINGSTON/`. |
| **`/opt`** | **Optional / Third-Party Software** — Self-contained, add-on vendor software packages that do not follow standard distribution packaging. | `/opt/google/chrome`, `/opt/gitlab`, `/opt/containerd`. |
| **`/boot`** | **Boot Loader Files** — Static files required to boot the Linux operating system (kernel images, initramfs, GRUB configs). | `vmlinuz-*` (kernel), `initrd.img-*`, `/boot/grub/grub.cfg`. |
| **`/srv`** | **Site-Specific Data** — Data for services served by the system (e.g., web server data, FTP root). | `/srv/www`, `/srv/ftp`. |
| **`/run`** | **Runtime Variable Data** — Run-time information describing system state since last boot (PIDs, lockfiles, IPC sockets). | `/run/systemd/`, `/run/user/1000/`. Mounted as `tmpfs`. |

---

### 3. Modern Ubuntu & Debian: The UsrMerge Architecture

In historical Unix, `/bin`, `/sbin`, and `/lib` lived on the small root partition while `/usr` was mounted from a secondary hard disk over NFS.

In modern Linux (Debian 12+, Ubuntu 20.04+), this separation is obsolete:
- `/bin` is a symbolic link to `/usr/bin`
- `/sbin` is a symbolic link to `/usr/sbin`
- `/lib` is a symbolic link to `/usr/lib`
- `/lib64` is a symbolic link to `/usr/lib64`

You can verify this on your system with `ls -ld /bin /sbin /lib`:
```bash
lrwxrwxrwx 1 root root 7 Oct 27 00:39 /bin -> usr/bin
lrwxrwxrwx 1 root root 8 Oct 27 00:39 /sbin -> usr/sbin
lrwxrwxrwx 1 root root 7 Oct 27 00:39 /lib -> usr/lib
```

---

### 4. Essential FHS Navigation Commands

```bash
# List top-level root directories
ls -la /

# Inspect system-wide configuration files
ls -la /etc

# Inspect system and service logs
ls -la /var/log

# Inspect device files
ls -la /dev

# Inspect kernel process table and system parameters
ls -la /proc
```

---

## ⚠️ Gotchas & Pro-Tips

- 🚨 **Never edit `/proc` or `/sys` files on disk:** Files inside `/proc` and `/sys` consume 0 bytes of physical hard drive space. They are dynamic windows generated by the Linux kernel in RAM. Modifying some values can alter running kernel parameters immediately (e.g., `echo 1 > /proc/sys/net/ipv4/ip_forward`).
- 💡 **Where do logs go?** Always start troubleshooting in `/var/log` (`/var/log/syslog`, `/var/log/auth.log`, `/var/log/dmesg`, `/var/log/nginx`).
- 💡 **Where do user configurations live?** System-wide default configs are in `/etc/` (e.g. `/etc/bash.bashrc`), but user-specific overrides live in `~/.` (e.g. `~/.bashrc`). The user configuration always overrides the system configuration.

---

## 💡 Notes

<!-- Add your own notes here as you watch the video -->
