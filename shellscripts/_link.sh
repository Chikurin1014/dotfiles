#!/usr/bin/env bash

FILES=$(cat "$SRC_DIR/json/link.json" | jq -rc '.[]')

# SRC_DIR=$(cd $(dirname $BASH_SOURCE) && pwd)

# functions
function check_dest() {
    if   [ -L "$1" ]; then
        echo "link-exists ${1}"
    elif [ -f "$1" ]; then
        echo "file-exists ${1}"
    else
        echo "not-exists ${1}"
    fi
}

function resolve_dest() {
    STATUS=$1
    FILE=$2
    if [[ "$STATUS" = "link-exists" ]]; then
        echo "Unlink $FILE"
        unlink "$FILE"
    elif [[ "$STATUS" = "file-exists" ]]; then
        echo "Move $FILE to $FILE.old (if $FILE.old already exists, remove old one)"
        [[ -e "$FILE.old" ]] && rm "$FILE.old"
        mv "$FILE" "$FILE.old"
    fi
}

# link files
echo "Resolving old links and files..."
echo "$FILES" | while read file; do
    echo "$file"
    [[ ! -n "$file" ]] && continue
    DEST="$HOME/$(echo "$file" | jq -r ".dest")"
    DEST_D=`dirname "$DEST"`
    mkdir -p "$DEST_D"
    resolve_dest $(check_dest "$DEST")
done
echo ""

echo "Creating new links..."

echo "$FILES" | while read file; do
    [[ ! -n "$file" ]] && continue
    SRC="$SRC_DIR/files/$(echo "$file" | jq -r ".src")"
    DEST="$HOME/$(echo "$file" | jq -r ".dest")"

    echo "$SRC"
    echo " -> $DEST"
    echo ""
    ln -s "$SRC" "$DEST"
done

echo ""
