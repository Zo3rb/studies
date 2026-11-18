#!/bin/bash
# ============================================================
# practice.sh — Finding Files Part 2: find
# Module 05, Lesson 21 | DevOp Camp ZTM
# ============================================================
# Run this script to practice the find utility with real tests.
# Usage: bash practice.sh
# ============================================================

set -euo pipefail

echo "============================================================"
echo "  Lesson 21: Finding Files Part 2 (find)"
echo "============================================================"

SANDBOX="/tmp/find_practice_$$"
mkdir -p "$SANDBOX"/{configs,logs/archive,scripts,docs/manuals}

# Create test files with distinct attributes
touch "$SANDBOX/configs/app.conf"
touch "$SANDBOX/configs/APP.CONF"
touch "$SANDBOX/configs/database.ini"
touch "$SANDBOX/docs/README.md"
touch "$SANDBOX/docs/manuals/guide.txt"
touch "$SANDBOX/empty_file.txt"
mkdir "$SANDBOX/empty_dir"

# Generate files of specific sizes
dd if=/dev/zero of="$SANDBOX/logs/archive/large.log" bs=1M count=3 status=none
dd if=/dev/zero of="$SANDBOX/logs/app.log" bs=100k count=1 status=none

# Create an executable script
cat << 'EOF' > "$SANDBOX/scripts/deploy.sh"
#!/bin/bash
echo "Deploying..."
EOF
chmod 755 "$SANDBOX/scripts/deploy.sh"

# 1. Matching by Name (-name vs -iname)
echo ""
echo "--- 1. Matching by Name: -name vs -iname ---"
echo "Case-sensitive search for 'app.conf' (-name):"
find "$SANDBOX" -name "app.conf"

echo ""
echo "Case-insensitive search for 'app.conf' (-iname):"
find "$SANDBOX" -iname "app.conf"

# 2. Matching by Type (-type)
echo ""
echo "--- 2. Filtering by Type (-type f / -type d) ---"
echo "All directories under sandbox (-type d):"
find "$SANDBOX" -type d

echo ""
echo "All regular files under sandbox (-type f):"
find "$SANDBOX" -type f | sort

# 3. Limiting Depth (-maxdepth and -mindepth)
echo ""
echo "--- 3. Limiting Recursion Depth ---"
echo "Files/dirs at depth 1 only (-maxdepth 1):"
find "$SANDBOX" -maxdepth 1

echo ""
echo "Files/dirs at depth >= 2 (-mindepth 2):"
find "$SANDBOX" -mindepth 2 | sort

# 4. Filtering by Size (-size)
echo ""
echo "--- 4. Filtering by File Size ---"
echo "Files larger than 2MB (-size +2M):"
find "$SANDBOX" -type f -size +2M -exec ls -lh {} +

echo ""
echo "Files smaller than 50KB (-size -50k):"
find "$SANDBOX" -type f -size -50k | sort

# 5. Finding Empty Files and Directories
echo ""
echo "--- 5. Finding Empty Items (-empty) ---"
echo "Empty files:"
find "$SANDBOX" -type f -empty

echo ""
echo "Empty directories:"
find "$SANDBOX" -type d -empty

# 6. Finding by Permissions (-perm)
echo ""
echo "--- 6. Finding by Permissions (-perm) ---"
echo "Files with exact 755 permissions:"
find "$SANDBOX" -type f -perm 755

echo ""
echo "Files with executable bit set for user (-perm -u=x):"
find "$SANDBOX" -type f -perm -u=x

# 7. Boolean Operators (-and, -or, !)
echo ""
echo "--- 7. Boolean Logic (-or, !) ---"
echo "Files ending in .conf OR .ini:"
find "$SANDBOX" -type f \( -name "*.conf" -o -name "*.ini" \)

echo ""
echo "All files that do NOT end in .txt (! -name '*.txt'):"
find "$SANDBOX" -type f ! -name "*.txt" | sort

# Clean up
rm -rf "$SANDBOX"
echo ""
echo "Cleaned up sandbox: $SANDBOX"

echo ""
echo "============================================================"
echo "  Done! Lesson 21 practice completed successfully."
echo "============================================================"
