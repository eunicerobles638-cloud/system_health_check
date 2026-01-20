#!/bin/bash

echo "=========================================="
echo "=====      PERM DISK DASHBOARD       ====="
echo "=========================================="
echo "Date: $(date)"
echo ""

# --- PART 1: STORAGE CHECK ---
echo "[ 📊 STORAGE STATUS ]"
USAGE=$(df /data | grep /data | awk '{print $5}' | sed 's/%//')
echo "Current Usage: $USAGE%"

if [ "$USAGE" -gt 85 ]; then
    echo "STATUS: 🚨 WARNING - Storage is almost full!"
else
    echo "STATUS: ✅ HEALTHY - Plenty of storage left."
fi

echo ""

# --- PART 2: SECURITY AUDIT ---
echo "[ 🔐 SECURITY AUDIT: My_projects ]"
cd My_projects
for f in *; do
    if [ -f "$f" ]; then
        VAL=$(stat -c "%a" "$f")
        if [ "$VAL" == "755" ] || [ "$VAL" == "700" ]; then
            echo "PASS: $f ($VAL)"
        else
            echo "WARN: $f ($VAL) - Unsafe Permission"
        fi
    fi
done
cd ..

echo ""
echo "=========================================="
echo "           AUDIT COMPLETE                "
echo "=========================================="

