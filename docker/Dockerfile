FROM --platform=amd64 ubuntu:26.04

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

# Install packages by apt
RUN apt-get update && \
    apt-get install -y gosu && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y tzdata && \
    apt-get install -y \
    build-essential curl git tmux tree unzip vim wget \
    fish && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

RUN chown -R "${UID}:${GID}" "${HOME}"

USER ${UID}:${GID}

# Install mise
RUN curl https://mise.run | sh

RUN curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.appimage && \
    chmod u+x nvim-linux-x86_64.appimage && \
    mv nvim-linux-x86_64.appimage ${HOME}/.local/bin/nvim

# Install packages by mise
RUN ${HOME}/.local/bin/mise install --yes

WORKDIR ${HOME}

COPY docker/entrypoint.sh /tmp/entrypoint.sh
RUN chmod +x /tmp/entrypoint.sh
ENTRYPOINT ["/tmp/entrypoint.sh"]
