#!/bin/bash
# ============================================================
# practice.sh — Compressing and Archiving (tar, gzip, zip)
# Module 05, Lesson 31 | DevOp Camp ZTM
# ============================================================
set -euo pipefail
SANDBOX=$(mktemp -d)
trap "rm -rf $SANDBOX" EXIT
cd "$SANDBOX"

echo "========================================"
echo "  Archiving & Compression — Practice"
echo "========================================"

# Setup: create sample files and directory
mkdir -p project/src project/docs
echo "main application code" > project/src/app.sh
echo "helper functions" > project/src/utils.sh
echo "README for the project" > project/README.md
echo "user guide document" > project/docs/guide.txt
echo "api reference" > project/docs/api.txt

echo ""
echo "--- Project structure to archive ---"
find project -type f

# 1. Create a plain tar (no compression)
echo ""
echo "--- [1] tar -cvf project.tar project/ ---"
tar -cvf project.tar project/
ls -lh project.tar

# 2. Create gzipped tar
echo ""
echo "--- [2] tar -czvf project.tar.gz project/ ---"
tar -czvf project.tar.gz project/
ls -lh project.tar.gz

# 3. List contents without extracting
echo ""
echo "--- [3] tar -tzvf project.tar.gz (list contents) ---"
tar -tzvf project.tar.gz

# 4. Extract to a new directory
echo ""
echo "--- [4] tar -xzvf project.tar.gz -C extracted/ ---"
mkdir extracted
tar -xzvf project.tar.gz -C extracted/
echo "Extracted files:"
find extracted -type f

# 5. gzip a single file
echo ""
echo "--- [5] gzip -k (keep original) ---"
cp project/README.md readme_copy.md
gzip -kv readme_copy.md
ls -lh readme_copy.md readme_copy.md.gz

# 6. gunzip
echo ""
echo "--- [6] gunzip ---"
gunzip readme_copy.md.gz
ls -lh readme_copy.md

# 7. bzip2
echo ""
echo "--- [7] tar -cjvf project.tar.bz2 (bzip2 compression) ---"
tar -cjvf project.tar.bz2 project/
ls -lh project.tar project.tar.gz project.tar.bz2

echo ""
echo "--- Compression size comparison ---"
printf "%-20s %s\n" "Format" "Size"
printf "%-20s %s\n" "------" "----"
printf "%-20s %s\n" "tar (no compress):" "$(du -sh project.tar | cut -f1)"
printf "%-20s %s\n" "tar.gz (gzip):" "$(du -sh project.tar.gz | cut -f1)"
printf "%-20s %s\n" "tar.bz2 (bzip2):" "$(du -sh project.tar.bz2 | cut -f1)"

echo ""
echo "========================================"
echo "  Done!"
echo "========================================"
