#!/bin/sh
START=$(date +%s)

mkdir -p LISTS_MD LISTS
for i in `ls IDS`;do
  ruby existcheck.rb < "./IDS/${i}" # 2>/dev/null
done

date +%Y-%m-%d_%H:%M:%S>>log

END=$(date +%s)
echo "===>>>ALL FINISHED. TIME IS:$((END-START)) sec."
