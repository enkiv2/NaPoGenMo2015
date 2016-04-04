#!/usr/bin/env zsh
# Usage: echo "word" | $0 file1 file2 ... filen
# Produces an acrostic of "word" with lines from files passed to argv

sed 's/\(.\)/\1\n/g' | grep '^[A-Za-z]' |  while read x ; do
	cat "$@" 2>/dev/null | sed 's/^[ 0-9]*//' | grep -i "^$x" | shuf -n 1 | sed 's/^\(.\)/(\1) /'
done

