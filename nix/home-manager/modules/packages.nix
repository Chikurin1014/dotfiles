{
  pkgs,
  ...
}:

{
  home.packages = with pkgs; [
    # Nix
    nix-output-monitor
    cachix
    # japanese input system
    ibus-engines.mozc
    # fonts
    firge-nerd
    moralerspace-hw
    # essential tools
    clang # required by tree-sitter
    curl
    git
    tmux
    tree
    unzip
    vim
    wget
    # shell
    zsh
    fish
    # shell tools
    bat
    btop
    dust
    direnv
    difftastic
    eza
    fd
    fzf
    gh
    ghq
    github-copilot-cli
    lazygit
    ripgrep
    sd
    sheldon
    starship
    tealdeer
    yazi
    zellij
    zoxide
    # editor
    helix
    neovim
    neovide
    tree-sitter
    # lsp / formatter / linter
    copilot-language-server
    marksman
    nixd
    nixfmt
    # terminal emulator
    wezterm
    ghostty
    # runtime / package manager
    mise
    rustup
  ];
}
