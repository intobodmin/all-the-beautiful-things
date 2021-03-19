#!/bin/bash

ROOT=${1:-../}
HTTP="/"
OUTPUT="../media-list.html" 
declare -a arr=("sound" "images")

echo $ROOT

IFS=$'\n'
i=0
echo "<ul>" > $OUTPUT
for filepath in "${arr[@]}"; do 
  path=`basename "$filepath"`
  echo "  <li>$path</li>" >> $OUTPUT
  echo "  <ul>" >> $OUTPUT
  echo "${ROOT}${filepath}"
  for i in `find "$ROOT/$filepath" -maxdepth 1 -mindepth 1 -type f | sort`; do
    file=`basename "$i"`
    echo "    <li><a href=\"/$path/$file\">$file</a></li>" >> $OUTPUT
  done
  echo "  </ul>" >> $OUTPUT
done
echo "</ul>" >> $OUTPUT

unset IFS
