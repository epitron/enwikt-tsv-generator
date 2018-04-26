#!/bin/bash
URL="https://dumps.wikimedia.org/enwiktionary/"

curl --silent $URL | \
  grep -oE '(20[0-9]{6})' | \
  sort | \
  uniq | \
  tail -n1
