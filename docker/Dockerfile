FROM ubuntu:26.04

ARG UID
ARG GID

ENV USER "ubuntu"
ENV UID ${UID:-1000}
ENV GID ${GID:-1000}
ENV HOME "/home/${USER}"
ENV XDG_CONFIG_HOME "${HOME}/.config"

# Add ~/.local/bin to PATH
RUN mkdir -p "/home/${USER}/.local/bin" && \
    mkdir -p "$XDG_CONFIG_HOME/fish/conf.d" && echo 'fish_add_path ~/.local/bin' > "$XDG_CONFIG_HOME/fish/conf.d/local-bin.fish"

# Install apt packages
RUN apt-get update && \
    apt-get install -y gosu && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y tzdata && \
    apt-get install -y \
        curl gcc git tmux tree unzip vim wget \
        fish bat btop du-dust direnv eza fd-find fzf lazygit ripgrep sd starship tealdeer \
        npm tree-sitter-cli && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Install neovim
RUN curl -fLsS https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz \
        | tar -xzf - -C /opt && \
        ln -s /opt/nvim-linux-x86_64/bin/nvim "/home/$USER/.local/bin/nvim"

# Install yazi
RUN mkdir -p /tmp/yazi && \
        curl -fLsS https://github.com/sxyazi/yazi/releases/latest/download/yazi-x86_64-unknown-linux-gnu.zip -o /tmp/yazi-x86_64-unknown-linux-gnu.zip && \
        unzip /tmp/yazi-x86_64-unknown-linux-gnu.zip -d /opt && \
        ln -s /opt/yazi/yazi-x86_64-unknown-linux-gnu/yazi "/home/$USER/.local/bin/yazi"

# Install zoxide
RUN curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh

RUN chown -R "${UID}:${GID}" "${HOME}"

USER ${UID}:${GID}

# Install mise
RUN curl https://mise.run | sh

# Install difftastic
RUN curl -fLsS https://github.com/Wilfred/difftastic/releases/latest/download/difft-x86_64-unknown-linux-gnu.tar.gz | tar -xzf - -C ~/.local/bin

# Install zellij
RUN curl -fLsS https://github.com/zellij-org/zellij/releases/latest/download/zellij-x86_64-unknown-linux-musl.tar.gz | tar -xzf - -C ~/.local/bin

# Install GitHub Copilot
RUN curl -fLsS https://github.com/github/copilot-cli/releases/download/v0.0.409/copilot-linux-x64.tar.gz -o ~/.local/bin/copilot && \
    chmod +x ~/.local/bin/copilot

# Install sheldon
RUN curl --proto '=https' -fLsS https://rossmacarthur.github.io/install/crate.sh | bash -s -- --repo rossmacarthur/sheldon --to ~/.local/bin

WORKDIR ${HOME}

COPY docker/entrypoint.sh /tmp/entrypoint.sh
RUN chmod +x /tmp/entrypoint.sh
ENTRYPOINT ["/tmp/entrypoint.sh"]
