#!/bin/sh

grep 'F$' $1 | cut -d'|' -f2 | sort | uniq | sort
