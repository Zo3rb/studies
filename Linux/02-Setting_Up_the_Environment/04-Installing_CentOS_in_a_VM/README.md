# 📖 Lesson: Installing CentOS in a VM

> **Course Video:** `Installing CentOS in a VM.mp4`
> **Module:** 02 — Setting Up the Environment

---

## 🎯 What This Lesson Covers
Installing CentOS (RHEL-based) inside a VM — the enterprise Linux standard used by many production servers.

---

## 📝 Key Concepts

### CentOS vs Ubuntu — Quick Comparison

| | Ubuntu | CentOS |
| :--- | :--- | :--- |
| **Family** | Debian | Red Hat (RHEL clone) |
| **Package manager** | `apt` | `yum` (CentOS 7) / `dnf` (CentOS 8+) |
| **Package format** | `.deb` | `.rpm` |
| **Config style** | `/etc/default/` | `/etc/sysconfig/` |
| **Service manager** | `systemd` | `systemd` (CentOS 7+) |
| **Firewall** | `ufw` | `firewalld` |
| **User prompt** | `$` (user) / `#` (root) | Same |

### CentOS Setup Notes
- CentOS 7: still widely used in enterprise
- CentOS Stream: rolling release (replaces CentOS 8)
- Rocky Linux / AlmaLinux: community CentOS replacements (RHEL-compatible)

### Key Post-Install Commands
```bash
# CentOS 7
cat /etc/centos-release         # confirm version
yum update                      # update packages

# CentOS 8 / Stream
dnf update                      # update packages
```

---

## 💡 Notes
<!-- Add your own notes here as you watch the video -->
