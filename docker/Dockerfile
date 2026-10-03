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

# Install neovim
RUN curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz && \
    tar -xzf nvim-linux-x86_64.tar.gz -C /opt && \
    ln -s /opt/nvim-linux-x86_64/bin/nvim ${HOME}/.local/bin/nvim

RUN chown -R "${UID}:${GID}" "${HOME}"

USER ${UID}:${GID}

# Install mise
RUN curl https://mise.run | sh

# Install packages by mise
RUN mkdir -p ${HOME}/.config/mise
COPY files/config/mise/config.toml ${HOME}/.config/mise/config.toml
RUN ${HOME}/.local/bin/mise install --yes

WORKDIR ${HOME}

COPY --chmod=0755 docker/entrypoint.sh /opt/entrypoint.sh

ENTRYPOINT ["/opt/entrypoint.sh"]
