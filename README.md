# dotfiles

**dotfiles** used by [Chikurin1014](https://github.com/Chikurin1014)

## `main` branch

### Environment requirements

- Use **Git**
- Use **Nix**
- Use **Home Manager** (requires **Nix**)

### Installatioin

You may already have `~/.config/home-manager` directory, so remove/archive it.

```shell
HOME_MANAGER="$HOME/.config/home-manager" && [ -d "$HOME_MANAGER" ] && mv "$HOME_MANAGER" "$HOME_MANAGER.bak"
```

Then clone `main` branch of this repository to `~/.config/home-manager`

```shell
git clone -b main git@github.com:Chikurin1014/dotfiles.git $HOME/.config/home-manager
```

### Usage

Just run:

```shell
home-manager switch
```

## `minimal` branch

Look out for `README.md` in [`minimal`](https://github.com/Chikurin1014/dotfiles/tree/minimal) branch.
