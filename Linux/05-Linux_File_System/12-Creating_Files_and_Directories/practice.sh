#!/bin/bash
# ============================================================
# practice.sh — Creating Files and Directories (touch, mkdir)
# Module 05, Lesson 12 | DevOp Camp ZTM
# ============================================================
# Run this script to test all methods of creating files and dirs:
# - touch (single, multiple, brace expansion, timestamps, -c)
# - Shell redirection (> empty.txt)
# - mkdir (-p, -v, -m)
# - Scaffolding hierarchies with brace expansion
# - Creating sized test files with truncate
# Usage: bash practice.sh
# ============================================================

set -euo pipefail

echo "============================================================"
echo "  Lesson 12: Creating Files and Directories"
echo "============================================================"

# Prepare a dedicated testing sandbox
SANDBOX="/tmp/sandbox_create_$$"
mkdir -p "$SANDBOX"

# 1. Creating Files with touch & Redirection
echo ""
echo "--- 1. Creating Files with touch & Redirection ---"
touch "$SANDBOX/file_single.txt"
touch "$SANDBOX/alpha.txt" "$SANDBOX/beta.txt" "$SANDBOX/gamma.txt"

echo "Creating files via brace expansion: touch log_{1..3}.log"
touch "$SANDBOX/log_"{1..3}".log"

echo "Creating 0-byte file via shell redirection: > empty.txt"
> "$SANDBOX/empty.txt"

ls -l "$SANDBOX"

# 2. Testing touch -c (no-create)
echo ""
echo "--- 2. Testing touch -c (No Create) ---"
touch -c "$SANDBOX/non_existent_file.txt"
if [ ! -f "$SANDBOX/non_existent_file.txt" ]; then
    echo "Confirmed: touch -c did not create non_existent_file.txt."
fi

# 3. Creating Directories with mkdir
echo ""
echo "--- 3. Creating Standard Directories with mkdir ---"
mkdir "$SANDBOX/dir1" "$SANDBOX/dir2"
ls -ld "$SANDBOX/dir1" "$SANDBOX/dir2"

# 4. Nested Directories with mkdir -p and -v
echo ""
echo "--- 4. Creating Nested Paths (mkdir -p -v) ---"
mkdir -pv "$SANDBOX/services/api/v1/auth"

# 5. Advanced Project Scaffolding via Brace Expansion
echo ""
echo "--- 5. Project Hierarchy Scaffolding via Brace Expansion ---"
mkdir -pv "$SANDBOX/web_app"/{src/{controllers,models,views},tests/{unit,e2e},config,logs}

# 6. Setting Permissions at Creation Time with -m
echo ""
echo "--- 6. Setting Permissions at Directory Creation (mkdir -m 700) ---"
mkdir -m 700 "$SANDBOX/secret_vault"
ls -ld "$SANDBOX/secret_vault"

# 7. Creating Sized Test Files with truncate
echo ""
echo "--- 7. Creating a Sized Sparse File (truncate -s 5M) ---"
truncate -s 5M "$SANDBOX/test_5mb.bin"
ls -lh "$SANDBOX/test_5mb.bin"

# 8. Visualizing with tree
echo ""
echo "--- 8. Full Directory Tree Output ---"
tree -F "$SANDBOX"

# Clean up
rm -rf "$SANDBOX"
echo ""
echo "Sandbox cleaned up successfully."

echo ""
echo "============================================================"
echo "  Done! Lesson 12 practice completed successfully."
echo "============================================================"
