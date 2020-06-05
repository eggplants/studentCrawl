#!/bin/sh
START="$(date +%s)"
today="$(LANG='en_EN' date +%y-%m-%d)"
mkdir -p "LISTS_MD/${today}" "LISTS/${today}"

for i in IDS/*;do
  ruby existcheck.rb < "${i}" # 2>/dev/null
done

cat LISTS/${today}/LIST_s* > "LISTS/${today}/LIST_ALL"
LANG='en_EN' date +%Y-%m-%d_%H:%M:%S >> log
END="$(date +%s)"
echo "===>>>ALL FINISHED. TIME IS:$((END-START)) sec."
