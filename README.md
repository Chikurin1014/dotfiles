# dotfiles

**dotfiles** used by [Chikurin1014](https://github.com/Chikurin1014)

## Environment requirements for installation

- **Git**
- **Nix** (**recommended**, optional)
- **Dotter** (optional)

> [!NOTE]
> You can choose a deployment tool from **Nix**, **Dotter** or nothing. If you don't use any external tool, you will use the shellscripts in [`sl-maker-for-dotfiles`](https://github.com/Chikurin1014/sl-maker-for-dotfiles), which is a repository hosted by me.

> [!NOTE]
> If you use **Nix**, you can deploy the dotfiles and install packages with a single command. If you use **Dotter** or nothing, you need to install packages manually.

### Installation of Nix (optional)

If you haven't installed **Nix**, you can install it by following the instructions below.

- [NixOS website](https://nixos.org/download/)
- [Determinate Nix](https://docs.determinate.systems/determinate-nix#getting-started)

### Installation of Dotter (optional)

If you don't use **Nix**, you can use **Dotter** to manage your dotfiles. You can install it by following the instructions below.

- [Dotter Wiki](https://github.com/SuperCuber/dotter/wiki)

## Installation

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

If you use **Nix**, you need to deploy configuration files with the following command at the first time:

```shell
nix run home-manager -- switch --flake . -b bak
```

> [!NOTE]
> You can skip this step if you don't use **Nix** but use **Dotter** or nothing.

## Usage

### Deploying dotfiles

After the installation, you can use the following command to deploy the dotfiles (in zsh):

```shell
deploy-dotfiles
```

### Installing packages

#### Using Nix

Just run:

```shell
deploy-packages
```

#### Using Dotter or nothing

You need to install packages manually.

Check the `home-manager/home/packages.nix` file for the list of packages to install.

##### Exapmple for Debian/Ubuntu

```shell
sudo apt update && sudo apt upgrade -y
sudo apt install -y \
    build-essential \
    ...
```
