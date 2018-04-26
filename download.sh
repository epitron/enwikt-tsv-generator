#!/bin/bash
LATEST=`lib/latest_dump.sh`
URL="https://dumps.wikimedia.org/enwiktionary/$LATEST/enwiktionary-$LATEST-pages-articles.xml.bz2"

if [ ! -d xml ]; then
  mkdir xml
fi

pushd xml > /dev/null
echo "--------------------------------------"
echo "  Downloading latest dump ($LATEST)"
echo "--------------------------------------"
echo "  $URL"
echo
curl -O -C - $URL
popd > /dev/null

