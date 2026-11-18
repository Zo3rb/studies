# 📖 Lesson: Things to Do After Installing Ubuntu

> **Course Video:** `Things to Do After Installing Ubuntu.mp4`
> **Module:** 02 — Setting Up the Environment

---

## 🎯 What This Lesson Covers
Essential post-installation steps to get Ubuntu into a clean, updated, ready-to-use state for development and learning.

---

## 📝 Key Steps & Commands

### 1. Update the System
```bash
sudo apt update           # refresh package lists
sudo apt upgrade -y       # upgrade installed packages
sudo apt dist-upgrade -y  # handle dependency changes
sudo apt autoremove -y    # remove orphaned packages
```

### 2. Install VirtualBox Guest Additions (if in VM)
Guest Additions enable: shared clipboard, drag & drop, better display resolution, shared folders.
```bash
sudo apt install virtualbox-guest-utils virtualbox-guest-x11 -y
# Then: Devices → Insert Guest Additions CD → run installer → reboot
```

### 3. Take a Snapshot
Before making major changes → take a **VM snapshot**. This is your safety net — if anything breaks, restore the snapshot.

> In VirtualBox: Machine → Take Snapshot → name it "Clean Install"

### 4. Install Essential Tools
```bash
sudo apt install -y \
    curl \
    wget \
    git \
    vim \
    net-tools \
    htop \
    tree \
    unzip
```

### 5. Configure System Timezone
```bash
timedatectl                          # show current time settings
sudo timedatectl set-timezone Africa/Cairo   # set your timezone
timedatectl list-timezones | grep Africa     # list Africa timezones
```

### 6. Set Up a Non-Root User with sudo (if needed)
```bash
adduser newusername
usermod -aG sudo newusername
```

### 7. Enable Firewall (UFW)
```bash
sudo ufw status
sudo ufw enable
sudo ufw allow ssh      # if you'll use SSH
```

---

## ⚠️ Gotchas
- Always `sudo apt update` BEFORE `apt install` — stale lists cause "package not found" errors
- Don't run everything as root — use `sudo` only when needed
- Snapshots = free insurance, take them often

---

## 💡 Notes
<!-- Add your own notes here as you watch the video -->
