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
  nixd
  nixfmt-rfc-style
  nix-output-monitor
  cachix
  # japanese input system
  ibus-engines.mozc
  # fonts
  firge-nerd
  moralerspace-hw
  # essential tools
  curl
  gcc # required by tree-sitter
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
  neovim
  neovide
  tree-sitter
  # terminal emulator
  wezterm
  (config.lib.nixGL.wrap ghostty)
  # runtime / package manager
  mise
  rustup
  nodePackages.npm
]
