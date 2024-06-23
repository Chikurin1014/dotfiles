# dotfiles

**dotfiles** used by [Chikurin1014](https://github.com/Chikurin1014)

## `main` branch

### Environment requirements

- Use **Curl**
- Use **Git**
- Use **Nix**
- Use **Home Manager** (requires **Nix**)

#### Installation of Nix and Home Manager (Only if needed)

If you haven't installed **Nix** and **Home Manager**, you need to install it.

You can install **Nix** by running:

```shell
sh <(curl -L https://nixos.org/nix/install) --daemon
```

```shell
# You need to run only if you installed in `single-user` mode.
$ . "$HOME/.nix-profile/etc/profile.d/nix.sh"
```

Add NixPkgs channel by running:

```shell
nix-channel --add https://nixos.org/channels/nixpkgs-unstable nixpkgs
nix-channel --update
```

You can install **Home Manager** by running:

```shell
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update
nix-shell '<home-manager>' -A install
```

### Installatioin

You may already have `~/.config/home-manager` directory, so remove/archive it.

```shell
HM="$HOME/.config/home-manager" && [ -d "$HM" ] && mv "$HM" "$HM.bak"
```

Then clone `main` branch of this repository to `~/.config/home-manager`.

```shell
git clone git@github.com:Chikurin1014/dotfiles.git $HOME/.config/home-manager -b main
```

Initialize & update the submodules.

```shell
git submodule init && git submodule update
```

### Packages you need to install manually

- [WezTerm](https://wezfurlong.org/wezterm/installation.html)
- [FirgeNerd Font](https://github.com/yuru7/Firge/releases)

### Usage

Just run:

```shell
home-manager switch
```

## `minimal` branch

Look out for `README.md` in [`minimal`](https://github.com/Chikurin1014/dotfiles/tree/minimal) branch.
