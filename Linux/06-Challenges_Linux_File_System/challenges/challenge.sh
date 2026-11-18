#!/bin/bash
# ============================================================
# challenge.sh — Module 06: The Linux File System Challenges
# DevOp Camp ZTM
# ============================================================
# Instructions:
#   Fill in each TODO section with your solution.
#   Run: bash challenge.sh
#   Reference solutions are commented out at the bottom.
# ============================================================

set -uo pipefail
SANDBOX="$HOME/challenge_fs_$(date +%s)"
mkdir -p "$SANDBOX"
cd "$SANDBOX"
echo "Working in sandbox: $SANDBOX"
echo ""

# ===========================================================
# SET A — Paths, ls, Timestamps, File Types, Viewing
# ===========================================================

echo "=========================================="
echo "  SET A — Paths, ls, Timestamps, Viewing"
echo "=========================================="

# A1: Navigate and list
echo ""
echo "--- A1: pwd, cd, ls ---"
# TODO: Print current dir, go to /var/log, ls sorted by time, return home
# YOUR CODE HERE:


# A2: ls with multiple flags on /etc
echo ""
echo "--- A2: ls h* files in /etc ---"
# TODO: List files starting with 'h' in /etc with hidden, human sizes, inodes
# YOUR CODE HERE:


# A3: Timestamps
echo ""
echo "--- A3: Timestamps (atime, mtime, ctime) ---"
touch "$SANDBOX/testfile.txt"
# TODO: stat the file, access it, modify it, change permissions - observe timestamps
# YOUR CODE HERE:


# A4: File types
echo ""
echo "--- A4: Identify file types ---"
# TODO: Create a regular file, directory, symlink. Verify with ls -F and file
# YOUR CODE HERE:


# A5: Viewing files
echo ""
echo "--- A5: cat, less, tail ---"
# TODO: cat /etc/passwd with line numbers
# YOUR CODE HERE:


# A6: Extract lines 10-15 from /etc/passwd
echo ""
echo "--- A6: Lines 10-15 of /etc/passwd ---"
# TODO: Use head + tail pipeline
# YOUR CODE HERE:


# ===========================================================
# SET B — cp, mv, rm, shred
# ===========================================================

echo ""
echo "=========================================="
echo "  SET B — cp, mv, rm, shred"
echo "=========================================="

mkdir -p "$SANDBOX/challenge_b/src" "$SANDBOX/challenge_b/backup"

# B1: Create test files
echo ""
echo "--- B1: Create test files ---"
# TODO: Create alpha.txt, beta.txt, gamma.txt in src/ with content
# YOUR CODE HERE:


# B2: Copy preserving attributes
echo ""
echo "--- B2: cp preserving timestamps ---"
# TODO: cp alpha.txt to backup/ with -p flag, verify with stat
# YOUR CODE HERE:


# B3: Copy directory with archive flag
echo ""
echo "--- B3: cp -a directory ---"
# TODO: cp -a src/ to backup/src_copy/
# YOUR CODE HERE:


# B4: mv (rename and move)
echo ""
echo "--- B4: mv (rename + move) ---"
# TODO: rename beta.txt to beta_v2.txt, move gamma.txt to backup/
# YOUR CODE HERE:


# B5: rm and rmdir
echo ""
echo "--- B5: rm -i and rmdir ---"
# TODO: rm -i alpha.txt (you'll need to handle the prompt), rm -r empty dirs
# YOUR CODE HERE:


# B6: shred
echo ""
echo "--- B6: shred secure deletion ---"
echo "fake_password=abc123" > "$SANDBOX/sensitive.txt"
# TODO: shred -uvn 5 sensitive.txt
# YOUR CODE HERE:


# ===========================================================
# SET C — locate, find
# ===========================================================

echo ""
echo "=========================================="
echo "  SET C — locate, find"
echo "=========================================="

# C1: locate and which/whereis
echo ""
echo "--- C1: locate, which, whereis ---"
# TODO: locate nginx.conf; which python3; whereis python3
# YOUR CODE HERE:


# C2: find directories modified today
echo ""
echo "--- C2: find dirs in /etc modified last 1 day ---"
# TODO: find /etc -type d -mtime -1
# YOUR CODE HERE:


# C3: find large files and ls them
echo ""
echo "--- C3: find files > 1MB in /var/log ---"
# TODO: find /var/log -type f -size +1M -exec ls -lh {} \;
# YOUR CODE HERE:


# C4: find .sh files and make executable
echo ""
echo "--- C4: find .sh files and chmod +x ---"
# TODO: find ~ -name "*.sh" -exec chmod +x {} \;
# YOUR CODE HERE:


# C5: find empty files in /tmp and delete
echo ""
echo "--- C5: find and delete empty files in /tmp ---"
# TODO: find /tmp -maxdepth 1 -type f -empty -exec rm -v {} \;
# YOUR CODE HERE:


# C6: find + xargs vs -exec for grep
echo ""
echo "--- C6: grep inside /etc/*.conf ---"
# TODO: find /etc -name "*.conf" | xargs grep -l "root" 2>/dev/null
# YOUR CODE HERE:


# ===========================================================
# SET D — tar, ln
# ===========================================================

echo ""
echo "=========================================="
echo "  SET D — tar, ln"
echo "=========================================="

# D1: Create and archive
echo ""
echo "--- D1: tar create archive ---"
mkdir -p "$SANDBOX/project/docs"
echo "app code" > "$SANDBOX/project/app.sh"
echo "config" > "$SANDBOX/project/config.txt"
echo "docs content" > "$SANDBOX/project/docs/guide.txt"
# TODO: tar -czvf project_backup.tar.gz project/ && tar -tzvf project_backup.tar.gz
# YOUR CODE HERE:


# D2: Extract archive
echo ""
echo "--- D2: tar extract ---"
mkdir -p "$SANDBOX/restored"
# TODO: tar -xzvf project_backup.tar.gz -C restored/
# YOUR CODE HERE:


# D3: Hard link
echo ""
echo "--- D3: Hard links ---"
echo "Important data" > "$SANDBOX/original.txt"
# TODO: ln original.txt hardlink.txt; ls -li both; modify hardlink; rm original; cat hardlink
# YOUR CODE HERE:


# D4: Symlink
echo ""
echo "--- D4: Symlinks ---"
# TODO: ln -s /etc link_to_etc; ls link_to_etc/; rm link_to_etc; verify /etc intact
# YOUR CODE HERE:


# D5: Dangling symlink
echo ""
echo "--- D5: Dangling symlink ---"
echo "target content" > "$SANDBOX/target.txt"
# TODO: ln -s target.txt dangling_link; rm target.txt; ls -l dangling_link; find -xtype l
# YOUR CODE HERE:


echo ""
echo "=========================================="
echo "  All challenges complete!"
echo "  Sandbox directory: $SANDBOX"
echo "=========================================="

# ===========================================================
# REFERENCE SOLUTIONS (commented out)
# ===========================================================

# --- A1 ---
# pwd; cd /var/log; ls -lt; cd ~

# --- A2 ---
# ls -liha /etc/h*

# --- A3 ---
# touch testfile.txt
# stat testfile.txt
# cat testfile.txt       # triggers atime update
# stat testfile.txt
# echo "modify" >> testfile.txt    # updates mtime AND ctime
# stat testfile.txt
# chmod 644 testfile.txt           # updates ctime only
# stat testfile.txt

# --- A4 ---
# touch regular.txt; mkdir mydir; ln -s regular.txt mylink
# ls -F regular.txt mydir mylink
# file regular.txt mydir mylink

# --- A5 ---
# cat -n /etc/passwd
# less /var/log/syslog   (then /error, q to quit)
# tail -f /var/log/syslog

# --- A6 ---
# head -15 /etc/passwd | tail -6

# --- B1 ---
# echo "alpha content" > src/alpha.txt
# echo "beta content" > src/beta.txt
# echo "gamma content" > src/gamma.txt

# --- B2 ---
# cp -p src/alpha.txt backup/
# stat src/alpha.txt backup/alpha.txt

# --- B3 ---
# cp -a src/ backup/src_copy/

# --- B4 ---
# mv src/beta.txt src/beta_v2.txt
# mv src/gamma.txt backup/

# --- B5 ---
# rm -i src/alpha.txt
# rm -rf backup/src_copy/

# --- B6 ---
# shred -uvn 5 sensitive.txt

# --- C1 ---
# locate nginx.conf
# which python3
# whereis python3

# --- C2 ---
# find /etc -type d -mtime -1

# --- C3 ---
# find /var/log -type f -size +1M -exec ls -lh {} \;

# --- C4 ---
# find ~ -name "*.sh" -exec chmod +x {} \;

# --- C5 ---
# find /tmp -maxdepth 1 -type f -empty -exec rm -v {} \;

# --- C6 ---
# find /etc -name "*.conf" | xargs grep -l "root" 2>/dev/null
# find /etc -name "*.conf" -exec grep -l "root" {} \;

# --- D1 ---
# tar -czvf project_backup.tar.gz project/
# tar -tzvf project_backup.tar.gz

# --- D2 ---
# tar -xzvf project_backup.tar.gz -C restored/

# --- D3 ---
# ln original.txt hardlink.txt
# ls -li original.txt hardlink.txt
# echo "added via hardlink" >> hardlink.txt
# cat original.txt
# rm original.txt
# cat hardlink.txt

# --- D4 ---
# ln -s /etc link_to_etc
# ls link_to_etc/
# rm link_to_etc
# ls /etc | head -3   # /etc still intact

# --- D5 ---
# ln -s "$SANDBOX/target.txt" dangling_link
# rm "$SANDBOX/target.txt"
# ls -l dangling_link
# find "$SANDBOX" -xtype l
