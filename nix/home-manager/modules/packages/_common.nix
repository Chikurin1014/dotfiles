{
  pkgs,
  # Wrapper for GUI applications (e.g. nixGL)
  wrapGL ? (pkg: pkg),
}:

with pkgs;
[
  # Nix
  cachix
  # essential tools
  clang # required by tree-sitter
  curl
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
  (wrapGL neovide)
  tree-sitter
  # lsp / formatter / linter
  copilot-language-server
  markdown-oxide
  nixd
  nixfmt
]
