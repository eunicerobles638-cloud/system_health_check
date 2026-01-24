#!/bin/bash
# "===== PERMISION AUDIT START ====="
cd My_projects
for f in *; do
    if [ -f "$f" ]; then
        VAL=$(stat -c "%a" "$f")
        if [ "$VAL" == "755" ] || [ "$VAL" == "700" ]; then
              echo "PASS: $f ($VAL) - OK"
                             else
                                  echo "WARN: $f ($VAL) - NEEDS REVIEW"
                                                       fi
                                                   fi
                                               done
