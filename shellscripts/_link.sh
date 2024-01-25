#!/usr/bin/env bash

FILES="
zshrc                       .zshrc
zsh/completion.zsh          .zsh/completion.zsh
zsh/option.zsh              .zsh/option.zsh
zsh/style.zsh               .zsh/style.zsh
config/sheldon/plugins.toml .config/sheldon/plugins.toml
config/starship.toml        .config/starship.toml
config/lsd/colors.yaml      .config/lsd/colors.yaml
config/lsd/config.yaml      .config/lsd/config.yaml
config/lsd/icons.yaml       .config/lsd/icons.yaml
tmux.conf                   .tmux.conf
"

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
    if [ "$STATUS" = "link-exists" ]; then
        echo "Unlink $FILE"
        unlink "$FILE"
    elif [ "$STATUS" = "file-exists" ]; then
        echo "Move $FILE to $FILE.old (if $FILE.old already exists, remove old one)"
        [ -e "$FILE.old" ] && rm "$FILE.old"
        mv "$FILE" "$FILE.old"
    fi
}

# link files
echo "Resolving old links and files..."
echo "$FILES" | while read file
do
    [ ! -n "$file" ] && continue
    ARGS=(`echo $file`)

    DEST="$HOME/${ARGS[1]}"
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

    SRC="$SRC_DIR/files/${ARGS[0]}"
    DEST="$HOME/${ARGS[1]}"

    echo "$SRC"
    echo " -> $DEST"
    echo ""
    ln -s "$SRC" "$DEST"
done
echo ""
