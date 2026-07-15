function fisher-install-plugins
    fisher install decors/fish-ghq
    fisher install jorgebucaran/autopair.fish
    fisher install kidonng/nix.fish
    fisher install PatrickF1/fzf.fish
end

if status --is-interactive && not functions -q fisher
    curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher

    fisher-install-plugins
end
