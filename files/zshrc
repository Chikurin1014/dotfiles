# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Source files in ~/.zsh
DOTZSH_DIR="${HOME}/.zsh"
if [ -d $DOTZSH_DIR ] && [ -r $DOTZSH_DIR ] && [ -x $DOTZSH_DIR ]; then
    for file in ${DOTZSH_DIR}/**/*.zsh; do
        [ -r $file ] && source $file
    done
fi

# Run if espup (embedded-rust package for esp32) is installed
ESPUP_SRC=`which "espup"`
[ -n $ESPUP_SRC ] && [ $ESPUP_SRC != "espup not found" ] && source $HOME/export-esp.sh

source ~/.cargo/env

SHELDON_SRC=`which "sheldon"`
[ -n $SHELDON_SRC ] && [ $SHELDON_SRC != "sheldon not found" ] && eval "$(sheldon source)"

LSD_SRC=`which "lsd"`
[ -n $LSD_SRC ] && [ $LSD_SRC != "lsd not found" ] && alias ls='lsd'

