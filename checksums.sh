#!/bin/bash
for i in tsv/*.gz; do
  sumfile="$i.sha256"
  if [ -f "$sumfile" ]; then
    echo "# $sumfile exists"
  else
    echo "* $sumfile"
    sha256sum "$i" > "$sumfile"
  fi
done
