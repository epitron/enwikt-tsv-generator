#!/bin/bash
IN=`ls -tr xml/* | tail -n1`
DATE=`echo $IN | grep -oE '20[0-9]{6}'`

ALL="tsv/enwikt-defs-$DATE-all.tsv"
EN="${ALL/-all/-en}"

COMPRESSOR=`which pigz gzip 2> /dev/null | head -n1`

if [ "$IN" == "" ]; then
  echo "No dumps in the xml/ directory; run download.sh first."
  exit 1
fi

if [ ! -d tsv ]; then
  mkdir tsv
fi

echo "------------------------------------------------------------------"
echo "Dumping $IN"
echo "------------------------------------------------------------------"
if ! python2 lib/create.py $IN $ALL; then exit 1; fi
echo

echo "------------------------------------------------------------------"
echo "Postprocessing"
echo "------------------------------------------------------------------"
echo "* Extracting English wikt..."
if ! grep '^English\b' $ALL > $EN; then exit 1; fi 
echo

for i in $ALL $EN; do
  echo "* GZipping $i..."
  if ! $COMPRESSOR $i; then exit 1; fi
done
echo

echo "* Updating checksums..."
./checksums.sh

echo
echo "------------------------------------------------------------------"
echo "DONE"
echo "------------------------------------------------------------------"
ls -l $ALL.gz $EN.gz
