{
  config,
  pkgs,
}:

let
  inherit (pkgs) firge-nerd;
in
with pkgs;
[
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
  # github-copilot-cli
  gh-copilot
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
  bash-language-server
  vscode-langservers-extracted
  lua-language-server
  marksman
  nixd
  nixfmt-rfc-style
  taplo
  yaml-language-server
  # terminal emulator
  wezterm
  ghostty
  # runtime / package manager
  mise
  rustup
  nodePackages.npm
]
