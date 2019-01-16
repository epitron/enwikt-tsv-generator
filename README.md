# Wiktionary TSV generator

## Summary

These scripts convert the Wikipedia Dictionary into a TSV file for easy use in your favorite dictionary-reqiuring projects.

It works by downloading a big XML dump (about 500MB) from Wikipedia's dump server, and then Python 2 scripts convert it to gzipped TSV files (one for the English Wiktionary, and one for All Languages), eg:

```
tsv/wikt-defs-20180220-all.tsv.gz
tsv/wikt-defs-20180220-en.tsv.gz
```

## Usage

1. Make sure `curl` and `Python 2` are installed.
2. Run `./download.sh` (results will be placed in the "xml/" directory; you can run it again to resume the download if it aborts)
3. Run `./create.sh` (results will be placed in the "tsv/" directory)

## Lineage

This is a fork of a [fork](https://github.com/ConradIrwin/p_enwikt/) of Conrad Irwin's [Wiktionary TSV generator](https://fisheye.toolserver.org/browse/enwikt/). It's no longer running on Wikipedia's TOOL server, so this is the only way to use it at the moment.
