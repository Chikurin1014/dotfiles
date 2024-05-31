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
HM="$HOME/.config/home-manager" && [ -d "$HM" ] && mv "$HM" "$HM.bak"
```

Then clone `main` branch of this repository to `~/.config/home-manager`

```shell
git clone git@github.com:Chikurin1014/dotfiles.git $HOME/.config/home-manager -b main
```

### Usage

Just run:

```shell
home-manager switch
```

## `minimal` branch

Look out for `README.md` in [`minimal`](https://github.com/Chikurin1014/dotfiles/tree/minimal) branch.
