# dotfiles

**dotfiles** used by [Chikurin1014](https://github.com/Chikurin1014)

## `main` branch

### Environment requirements for installation

- Use **Curl**
- Use **Git**
- Use **Nix**

#### Installation of Nix and Home Manager (Only if needed)

If you haven't installed **Nix** and **Home Manager**, you need to install it.

To install **Nix**, follow the instructions on the [NixOS website](https://nixos.org/download/)
or [Determinate Nix](https://docs.determinate.systems/determinate-nix#getting-started).

### Installatioin

Clone `main` branch of this repository to `~/.config/home-manager`.

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

Run in the root of the repository:

```shell
nix run home-manager -- switch .?submodules=1
```

## `minimal` branch

Look out for `README.md` in [`minimal`](https://github.com/Chikurin1014/dotfiles/tree/minimal) branch.
