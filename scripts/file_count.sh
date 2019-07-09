#!/bin/bash

# Find number of files in given dir, current one if no command-line
# arg supplied

# $# is command-line args array, equals 0 when empty
if [[ $# -eq 0 ]]; then
  n=`ls | wc -l`
  echo "Number of files: $n"; exit 0
fi

if [[ -d "$1" ]]; then
  n=`ls $1 | wc -l`
  echo "$1: $n files"; exit 0
else
  echo "$1 is not a directory" >&2; exit 1
fi
