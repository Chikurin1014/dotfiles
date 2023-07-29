#!/bin/bash

FILES="
zshrc                       .zshrc
zsh/completion.zsh          .zsh/completion.zsh
zsh/option.zsh              .zsh/option.zsh
config/sheldon/plugins.toml .config/sheldon/plugins.toml
config/starship.toml        .config/starship.toml
"

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
    if [ "$STATUS" = "link-exists" ]; then
        echo "Unlink \`$FILE\`"
        unlink "$FILE"
    elif [ "$STATUS" = "file-exists" ]; then
        echo "Move \`$FILE\` to \`$FILE.old\` (if \`$FILE.old\` already exists, remove old one)"
        [ -e "$FILE.old" ] && rm "$FILE.old"
        mv "$FILE" "$FILE.old"
    fi
}

SRC_DIR=`cd $(dirname $0) && pwd`
DEST_DIR="$HOME"

echo $SRC_DIR

echo "Resolving old links and files..."
echo "$FILES" | while read file
do
    [ ! -n "$file" ] && continue
    ARGS=(`echo $file`)
    DEST="$DEST_DIR/${ARGS[2]}"
    DEST_D=`dirname "$DEST"`
    mkdir -p "$DEST_D"
    resolve_dest `check_dest "$DEST"`
done
echo ""
echo "Creating new links..."
echo "$FILES" | while read file
do
    [ ! -n "$file" ] && continue
    ARGS=(`echo $file`)
    S="${ARGS[1]}"
    D="${ARGS[2]}"
    SRC="$SRC_DIR/$S"
    DEST="$DEST_DIR/$D"
    ln -sv "$SRC" "$DEST"
done
echo ""
echo "Done"
