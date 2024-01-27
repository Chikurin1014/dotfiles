# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

export PATH="$HOME/.local/bin:$PATH"

if [[ $(which sheldon) = "sheldon not found" ]]; then
    DOTZSH_DIR="$HOME/.zsh"
    if [[ -d $DOTZSH_DIR ]] && [[ -r $DOTZSH_DIR ]] && [[ -x $DOTZSH_DIR ]]; then
        for file in ${DOTZSH_DIR}/**/*.zsh; do
            [[ -r $file ]] && source $file
        done
    fi
else
    eval "$(sheldon source)"
fi
