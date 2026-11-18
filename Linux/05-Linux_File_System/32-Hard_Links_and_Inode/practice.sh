#!/bin/bash
# ============================================================
# practice.sh — Hard Links and the Inode Structure
# Module 05, Lesson 32 | DevOp Camp ZTM
# ============================================================
set -euo pipefail
SANDBOX=$(mktemp -d)
trap "rm -rf $SANDBOX" EXIT
cd "$SANDBOX"

echo "========================================"
echo "  Hard Links & Inodes — Practice"
echo "========================================"

# 1. Create a file and inspect its inode
echo ""
echo "--- [1] Create file and inspect inode ---"
echo "Hello, I am the original file." > original.txt
echo "Inode number and link count:"
ls -li original.txt
echo ""
echo "stat output:"
stat original.txt

# 2. Create a hard link
echo ""
echo "--- [2] Create hard link: ln original.txt hardlink.txt ---"
ln original.txt hardlink.txt
echo "Both entries now:"
ls -li original.txt hardlink.txt
echo ""
echo "⬆️  Notice: SAME inode number, link count is now 2"

# 3. Prove they share the same data
echo ""
echo "--- [3] Modifying hardlink also changes original ---"
echo "Extra line added via hardlink." >> hardlink.txt
echo "original.txt contents:"
cat original.txt
echo "(Both files show the same content because they ARE the same inode)"

# 4. Delete original — data still accessible via hardlink
echo ""
echo "--- [4] rm original.txt — data survives via hardlink ---"
rm original.txt
echo "original.txt deleted. hardlink.txt still readable:"
cat hardlink.txt
echo ""
echo "Link count after deleting original:"
stat hardlink.txt | grep Links

# 5. cp creates a NEW inode
echo ""
echo "--- [5] cp creates a NEW inode (not a hard link) ---"
echo "Copy test" > fileA.txt
cp fileA.txt fileB.txt
echo "fileA and fileB inodes:"
ls -li fileA.txt fileB.txt
echo "⬆️  Different inode numbers → true independent copies"

# 6. Directory link count
echo ""
echo "--- [6] Directory link count ---"
mkdir mydir
echo "New empty dir link count (always starts at 2: dir + . entry):"
ls -ld mydir
mkdir mydir/subdir
echo "After adding subdir (adds .. entry pointing back up), link count becomes 3:"
ls -ld mydir

echo ""
echo "========================================"
echo "  Done!"
echo "========================================"
