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
ESPUP_DIR="`which "espup"`"
if [ -n $ESPUP_DIR ]; then
    source $HOME/export-esp.sh
fi

source ~/.cargo/env
eval "$(sheldon source)"
