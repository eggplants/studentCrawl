for i in `ls IDS/s*`;do
  ruby existcheck.rb < $i 2>/dev/null
done
mkdir -p LISTS_MD LISTS
mv LIST_*md LISTS_MD/
mv LIST_* LISTS/
