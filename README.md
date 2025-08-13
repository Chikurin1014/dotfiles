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

Clone `main` branch of this repository to home directory.

```shell
cd ~
git clone git@github.com:Chikurin1014/dotfiles.git -b main
```

Initialize & update the submodules.

```shell
cd dotfiles
git submodule init && git submodule update
```

At the first time, run the following command at the root of this repository:

```shell
nix run home-manager -- switch --flake .?submodules=1 -b old
```

### Usage

After you run the first-time command (`nix run home-manager ..`), you can use the following command to apply the configuration:

```shell
deploy-dotfiles
```

## `minimal` branch

Look out for `README.md` in [`minimal`](https://github.com/Chikurin1014/dotfiles/tree/minimal) branch.

