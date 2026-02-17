FROM ubuntu:26.04

ARG UNAME="user"
ARG GNAME="user"
ARG UID
ARG GID
ARG DOTFILES_CONTEXT

ENV XDG_CONFIG_HOME="/home/$UNAME/.config"

COPY $DOTFILES_CONTEXT /home/$UNAME/dotfiles

# Install packages
RUN apt-get update && apt-get install -y \
    # essential tools
    curl gcc git tmux tree unzip vim wget \
    # shell
    zsh fish \
    # shell tools
    bat btop du-dust direnv eza fd-find fzf lazygit ripgrep sd starship tealdeer \
    # misc
    npm \
    tree-sitter-cli

# Add non-root user
RUN groupadd --force -g $GID $GNAME && \
    useradd -m -s "$(command -v fish)" -u $UID -g $GID $UNAME

# Set non-root user as a sudoer (deprecated by docker)
# RUN echo "$UNAME ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Add ~/.local/bin to PATH
RUN mkdir -p /home/$UNAME/.local/bin && \
    mkdir -p "$XDG_CONFIG_HOME/fish/conf.d" && echo 'fish_add_path ~/.local/bin' > "$XDG_CONFIG_HOME/fish/conf.d/local-bin.fish"

# Install neovim
RUN curl -fLsS https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz \
    | tar -xzf - -C /opt && \
    ln -s /opt/nvim-linux-x86_64/bin/nvim /home/$UNAME/.local/bin/nvim

# Install yazi
RUN mkdir -p /tmp/yazi && \
    curl -fLsS https://github.com/sxyazi/yazi/releases/latest/download/yazi-x86_64-unknown-linux-gnu.zip -o /tmp/yazi-x86_64-unknown-linux-gnu.zip && \
    unzip /tmp/yazi-x86_64-unknown-linux-gnu.zip -d /opt && \
    ln -s /opt/yazi/yazi-x86_64-unknown-linux-gnu/yazi /home/$UNAME/.local/bin/yazi

RUN chown -R $GID:$UID /home/$UNAME

USER $UNAME

# Install mise
RUN curl https://mise.run | sh 

# Install difftastic
RUN curl -fLsS https://github.com/Wilfred/difftastic/releases/latest/download/difft-x86_64-unknown-linux-gnu.tar.gz | tar -xzf - -C ~/.local/bin

# Install zellij
RUN curl -fLsS https://github.com/zellij-org/zellij/releases/latest/download/zellij-x86_64-unknown-linux-musl.tar.gz | tar -xzf - -C ~/.local/bin

# Install GitHub Copilot
RUN curl -fLsS https://github.com/github/copilot-cli/releases/download/v0.0.409/copilot-linux-x64.tar.gz -o ~/.local/bin/copilot && \
    chmod +x ~/.local/bin/copilot

# Install dotter
RUN curl -fLsS https://github.com/SuperCuber/dotter/releases/download/v0.13.4/dotter-linux-x64-musl -o ~/.local/bin/dotter && \
    chmod +x ~/.local/bin/dotter

# Install sheldon
RUN curl --proto '=https' -fLsS https://rossmacarthur.github.io/install/crate.sh | bash -s -- --repo rossmacarthur/sheldon --to ~/.local/bin

# Install Rust
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y && \
    mkdir -p "$XDG_CONFIG_HOME/fish/conf.d" && echo 'fish_add_path ~/.cargo/bin' > "$XDG_CONFIG_HOME/fish/conf.d/cargo-bin.fish"

WORKDIR /home/$UNAME

CMD ["fish", "-l"]
