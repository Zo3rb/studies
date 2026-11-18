# 📖 Lesson: Installing Ubuntu in a VM

> **Course Video:** `Installing Ubuntu in a VM.mp4`
> **Module:** 02 — Setting Up the Environment

---

## 🎯 What This Lesson Covers
Step-by-step installation of Ubuntu Linux inside a Virtual Machine using VirtualBox or VMware.

---

## 📝 Key Concepts

### What is a Virtual Machine (VM)?
A **VM** is a software-emulated computer that runs inside your real (host) machine. It lets you run Linux without replacing your existing OS.

- **Hypervisor Type 2 (hosted):** VirtualBox, VMware Workstation — runs on top of Windows/macOS
- **Hypervisor Type 1 (bare metal):** ESXi, Hyper-V — runs directly on hardware (used in production)

### VM Setup Checklist

| Step | Action |
| :--- | :--- |
| 1 | Download **VirtualBox** (free) from virtualbox.org |
| 2 | Download **Ubuntu ISO** (LTS version recommended) |
| 3 | Create new VM: Name → Linux → Ubuntu (64-bit) |
| 4 | RAM: min **2 GB** (4 GB recommended) |
| 5 | Disk: min **20 GB** (dynamically allocated) |
| 6 | Attach ISO to optical drive → Boot → Install Ubuntu |
| 7 | Choose "Minimal Installation" + "Install third-party software" |
| 8 | Set username/password (remember it!) |
| 9 | Reboot → remove ISO |

### Ubuntu LTS vs Regular
- **LTS (Long Term Support):** Supported 5 years — use for servers and stable work
- **Regular:** Supported 9 months — latest features, bleeding edge

### Key Post-Boot Checks
```bash
uname -a          # confirm kernel version
lsb_release -a    # confirm Ubuntu version
sudo apt update   # verify internet + apt works
```

---

## 💡 Notes
<!-- Add your own notes here as you watch the video -->
