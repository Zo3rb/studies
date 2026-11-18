#!/bin/bash
# ============================================================
# practice.sh — Absolute vs Relative Paths
# Module 05, Lesson 02 | DevOp Camp ZTM
# ============================================================
# Run this script to practice navigating Linux directory paths:
# - pwd (logical vs physical)
# - Absolute vs relative path navigation
# - Special symbols (., .., ~, -)
# - Visualizing directory hierarchies with tree
# Usage: bash practice.sh
# ============================================================

set -euo pipefail

echo "============================================================"
echo "  Lesson 02: Absolute vs Relative Paths & Navigation"
echo "============================================================"

# Setup a clean sandbox directory structure
BASE_DIR="/tmp/sandbox_paths_$$"
mkdir -p "$BASE_DIR/project/src/components"
mkdir -p "$BASE_DIR/project/tests"
mkdir -p "$BASE_DIR/project/docs"
touch "$BASE_DIR/project/README.md"
touch "$BASE_DIR/project/src/main.py"
touch "$BASE_DIR/project/src/components/button.py"
touch "$BASE_DIR/project/tests/test_main.py"

# Symlink to test pwd -P
ln -s "$BASE_DIR/project/src" "$BASE_DIR/project/link_to_src"

echo ""
echo "--- 1. Current Working Directory (pwd vs pwd -P) ---"
ORIG_DIR=$(pwd)
echo "Original directory: $ORIG_DIR"

cd "$BASE_DIR/project/link_to_src"
echo "Entered symlinked directory:"
echo "  pwd (logical):  $(pwd)"
echo "  pwd -P (physical): $(pwd -P)"

# 2. Visualizing with tree
echo ""
echo "--- 2. Visualizing Directory Tree (tree) ---"
tree -F "$BASE_DIR/project"

# 3. Absolute Path Navigation
echo ""
echo "--- 3. Absolute Path Navigation ---"
echo "Jumping to absolute path $BASE_DIR/project/docs:"
cd "$BASE_DIR/project/docs"
pwd

# 4. Relative Path Navigation with . and ..
echo ""
echo "--- 4. Relative Path Navigation (. and ..) ---"
echo "Moving up to parent directory (cd ..):"
cd ..
pwd

echo "Moving to sibling directory relative to current (cd src/components):"
cd src/components
pwd

echo "Moving up two levels (cd ../..):"
cd ../..
pwd

# 5. Fast Toggling with cd -
echo ""
echo "--- 5. Previous Directory Toggling (cd -) ---"
cd "$BASE_DIR/project/tests"
echo "Current: $(pwd)"
cd "$BASE_DIR/project/docs"
echo "Current: $(pwd)"
echo "Toggling back with 'cd -':"
cd -
echo "Back in: $(pwd)"

# 6. Home Directory Shortcuts (~ and ~root)
echo ""
echo "--- 6. Home Directory Expansions (~ and ~username) ---"
echo "Current user home (~): $HOME"
echo "Root user home (~root): $(eval echo ~root)"

# Return to original directory and clean up
cd "$ORIG_DIR"
rm -rf "$BASE_DIR"
echo ""
echo "Sandbox cleaned up successfully."

echo ""
echo "============================================================"
echo "  Done! Lesson 02 practice completed successfully."
echo "============================================================"
