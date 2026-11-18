#!/bin/bash
# ============================================================
# practice.sh — Comparing Files (cmp, diff, sha256sum)
# Module 05, Lesson 26 | DevOp Camp ZTM
# ============================================================
set -euo pipefail
SANDBOX=$(mktemp -d)
trap "rm -rf $SANDBOX" EXIT
cd "$SANDBOX"

echo "========================================"
echo "  Comparing Files — Practice"
echo "========================================"

# 1. Create test files
echo "line1" > file1.txt
echo "line1" > file2.txt
echo "line2" >> file1.txt
echo "line2 modified" >> file2.txt
echo "line3" >> file1.txt

echo ""
echo "--- file1.txt ---"
cat file1.txt
echo ""
echo "--- file2.txt ---"
cat file2.txt

# 2. cmp
echo ""
echo "--- cmp file1 file2 ---"
cmp file1.txt file2.txt || true
echo ""
echo "--- cmp -l (all differences) ---"
cmp -l file1.txt file2.txt || true
echo ""
echo "--- cmp identical files ---"
cp file1.txt file3.txt
cmp -s file1.txt file3.txt && echo "Files are IDENTICAL" || echo "Files DIFFER"

# 3. diff
echo ""
echo "--- diff (default) ---"
diff file1.txt file2.txt || true
echo ""
echo "--- diff -u (unified / patch format) ---"
diff -u file1.txt file2.txt || true
echo ""
echo "--- diff -y (side by side) ---"
diff -y file1.txt file2.txt || true
echo ""
echo "--- diff -q (quiet) ---"
diff -q file1.txt file2.txt || true

# 4. sha256sum
echo ""
echo "--- sha256sum (integrity check) ---"
sha256sum file1.txt
sha256sum file1.txt > file1.sha256
echo "Saved hash to file1.sha256:"
cat file1.sha256
echo ""
echo "Verifying integrity..."
sha256sum -c file1.sha256 && echo "✅ File integrity OK"

echo ""
echo "========================================"
echo "  Done!"
echo "========================================"
