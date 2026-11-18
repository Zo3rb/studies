#!/bin/bash
# ============================================================
# practice.sh — Viewing Files with head, tail, and watch
# Module 05, Lesson 10 | DevOp Camp ZTM
# ============================================================
# Run this script to test and observe:
# - head (-n, -c, negative offsets)
# - tail (-n, +N, byte offsets)
# - Extracting specific line ranges with pipelines
# - Real-time file following (tail -f / -F)
# - Monitoring command patterns with watch
# Usage: bash practice.sh
# ============================================================

set -euo pipefail

echo "============================================================"
echo "  Lesson 10: Viewing Files with head, tail, and watch"
echo "============================================================"

# Prepare a dedicated testing sandbox
SANDBOX="/tmp/sandbox_headtail_$$"
mkdir -p "$SANDBOX"
DATA_FILE="$SANDBOX/data.txt"

# Generate 50 numbered lines
for i in $(seq 1 50); do
    echo "Line $(printf "%02d" $i): Linux system administration lesson 10" >> "$DATA_FILE"
done

# 1. head demonstrations
echo ""
echo "--- 1. Testing head (First 5 lines) ---"
head -n 5 "$DATA_FILE"

echo ""
echo "--- Testing head negative offset (All except last 45 lines) ---"
head -n -45 "$DATA_FILE"

echo ""
echo "--- Testing head byte count (First 20 bytes) ---"
head -c 20 "$DATA_FILE"
echo ""

# 2. tail demonstrations
echo ""
echo "--- 2. Testing tail (Last 5 lines) ---"
tail -n 5 "$DATA_FILE"

echo ""
echo "--- Testing tail starting offset (From line 46 to end) ---"
tail -n +46 "$DATA_FILE"

# 3. Pipeline Slicing
echo ""
echo "--- 3. Extracting Exact Line Range: Lines 20 through 24 ---"
echo "Pipeline: head -n 24 | tail -n 5"
head -n 24 "$DATA_FILE" | tail -n 5

# 4. Live Streaming with tail -f (Automated Demonstration)
echo ""
echo "--- 4. Live Streaming Demonstration (tail -f) ---"
LIVE_LOG="$SANDBOX/live_stream.log"
touch "$LIVE_LOG"

echo "Starting background tail process..."
tail -f "$LIVE_LOG" &
TAIL_PID=$!

sleep 0.5
echo "[STREAM] Event 1: User login at $(date +%T)" >> "$LIVE_LOG"
sleep 0.5
echo "[STREAM] Event 2: Database connection opened at $(date +%T)" >> "$LIVE_LOG"
sleep 0.5
echo "[STREAM] Event 3: Transaction committed at $(date +%T)" >> "$LIVE_LOG"
sleep 0.5

# Terminate background tail cleanly
kill "$TAIL_PID" 2>/dev/null || true
wait "$TAIL_PID" 2>/dev/null || true
echo "Live stream tail process stopped."

# 5. Monitoring Commands with watch
echo ""
echo "--- 5. Repeating Commands with watch ---"
echo "watch is installed at: $(command -v watch || echo 'not found')"
echo "Example commands to test interactively in your terminal:"
echo "  watch -n 1 'head -n 5 /proc/loadavg'"
echo "  watch -d -n 2 'free -h'"
echo "  watch -t 'uptime'"

# Clean up
rm -rf "$SANDBOX"
echo ""
echo "Sandbox cleaned up successfully."

echo ""
echo "============================================================"
echo "  Done! Lesson 10 practice completed successfully."
echo "============================================================"
