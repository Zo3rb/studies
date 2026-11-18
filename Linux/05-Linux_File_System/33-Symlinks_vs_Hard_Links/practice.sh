#!/bin/bash
# ============================================================
# practice.sh — Symlinks vs Hard Links
# Module 05, Lesson 33 | DevOp Camp ZTM
# ============================================================
set -euo pipefail
SANDBOX=$(mktemp -d)
trap "rm -rf $SANDBOX" EXIT
cd "$SANDBOX"

echo "========================================"
echo "  Symlinks vs Hard Links — Practice"
echo "========================================"

# Setup original file
echo "I am the original target file." > original.txt

# 1. Create a symlink
echo ""
echo "--- [1] Create symlink: ln -s original.txt symlink.txt ---"
ln -s "$SANDBOX/original.txt" symlink.txt
echo "ls -l symlink.txt:"
ls -l symlink.txt
echo ""
echo "file symlink.txt:"
file symlink.txt
echo ""
echo "readlink symlink.txt:"
readlink symlink.txt

# 2. Compare inodes
echo ""
echo "--- [2] Inode comparison ---"
echo "original.txt:"
ls -li original.txt
echo "symlink.txt:"
ls -li symlink.txt
echo "⬆️  Different inode numbers — symlink has its own inode"

# 3. Symlink to directory
echo ""
echo "--- [3] Symlink to a directory ---"
mkdir realdir
echo "file1" > realdir/file1.txt
echo "file2" > realdir/file2.txt
ln -s "$SANDBOX/realdir" dirlink
echo "Contents via dirlink:"
ls dirlink/

# 4. Dangling (broken) symlink
echo ""
echo "--- [4] Dangling symlink ---"
ln -s /this/does/not/exist broken_link
echo "ls -l broken_link:"
ls -l broken_link
echo "Trying to read broken link:"
cat broken_link 2>&1 || true
echo ""
echo "Finding broken symlinks with find -xtype l:"
find "$SANDBOX" -xtype l

# 5. What happens when target is deleted
echo ""
echo "--- [5] Deleting target breaks the symlink ---"
ln -s "$SANDBOX/original.txt" live_link
echo "Before deletion — live_link readable: $(cat live_link)"
rm original.txt
echo "After deletion — live_link:"
cat live_link 2>&1 || echo "❌ Broken! Target no longer exists."

# 6. Hard link survives target deletion (contrast)
echo ""
echo "--- [6] Hard link survives target deletion ---"
echo "Hard link test content" > hardtarget.txt
ln hardtarget.txt hardlink.txt
rm hardtarget.txt
echo "hardlink.txt still readable: $(cat hardlink.txt)"

echo ""
echo "========================================"
echo "  Summary:"
echo "  Symlink → new inode, points to PATH → breaks if target deleted"
echo "  Hard link → same inode → survives target deletion"
echo "========================================"
