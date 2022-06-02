#!/bin/bash

set -eu
shopt -s nullglob

while getopts d:s: flag
do
    case "${flag}" in
        d) dict_filename=${OPTARG};;
        s) sources=${OPTARG};;
    esac
done

# aspell repeatedly modifies the personal dictionary for some reason,
# so we should use a copy of our dictionary.
dict_path="/tmp/dictionary.txt"

# List (default) mode: scan all files, report errors.
declare -i retval=0

cp "$dict_filename" "$dict_path"

if [ ! -f $dict_path ]; then
    retval=1
    exit "$retval"
fi

for fname in "${sources[@]}"; do
    command=$(aspell --mode=tex --master=hr --ignore 2 --personal="$dict_path" list < "$fname")
    echo "Spellcheck found $(echo "$command" | wc -w) misspellings"
    if [[ -n "$command" ]]; then
        for error in $command; do
            # FIXME: find more correct way to get line number
            # (ideally from aspell). Now it can make some false positives,
            # because it is just a grep.
            grep --with-filename --line-number --color=always "$error" "$fname"
        done
    fi
done
exit "$retval"
