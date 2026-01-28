# dotfiles

**dotfiles** used by [Chikurin1014](https://github.com/Chikurin1014)

## Environment requirements for installation

- **Git**
- **Nix** (**recommended**, optional)
- **Dotter** (optional)

You can choose a deployment tool to manage your dotfiles. The following tools are available:

- **Nix** \
You can deploy the dotfiles and install packages with a single command

- **Dotter** \
You need to install packages manually.

- **Nothing** \
You don't need any external tools (expect git), but you use the shellscripts in [`sl-maker-for-dotfiles`](https://github.com/Chikurin1014/sl-maker-for-dotfiles), which is a repository hosted by [Chikurin1014](https://github.com/Chikurin1014). You need to install packages manually.

> [!NOTE]
> If you are using Windows, you should use **Dotter**

### Installation of Nix (optional)

If you haven't installed **Nix**, you can install it by following the instructions below.

- [NixOS website](https://nixos.org/download/)
- [Determinate Nix](https://docs.determinate.systems/determinate-nix#getting-started)

### Installation of Dotter (optional)

If you don't use **Nix**, you can use **Dotter** to manage your dotfiles. You can install it by following the instructions below.

- [Dotter Wiki](https://github.com/SuperCuber/dotter/wiki)

## Installation

### 1. Clone this repository to home directory

```shell
cd ~
git clone git@github.com:Chikurin1014/dotfiles.git
cd dotfiles
```

### 2. Set up a deployment tool

- **Nix**

  Run:

  ```shell
  nix run home-manager -- switch --flake . -b bak
  ```

  > [!NOTE]
  > You may also need to change the values in [`.env`](.env):
  >
  > ```nix
  > # .env
  >
  > USER="<your-user-name>"
  > GIT_USER_NAME="<your-git-user-name>"
  > GIT_USER_EMAIL="<your-git-user-email>"
  > EDITOR="<your-favorite-editor>"
  > ```

- **Dotter**

  Create `.dotter/local.toml` and add the following content:

  ```toml
  includes = []
  packages = ["default"]
  ```

  > [!NOTE]
  > On Windows, `.dotter/local.toml` should be like below:
  >
  > ```toml
  > includes = [".dotter/windows.toml"]
  > packages = ["default", "wsl", "latex", "lazygit", "nushell"]
  > ```

- **Nothing**

  Initialize and update submodules to use [sl-maker-for-dotfiles](https://github.com/Chikurin1014/sl-maker-for-dotfiles):

  ```shell
  git submodule init && git submodule update
  ```

## Usage

### Deploying dotfiles

After the installation, you can use the following command to deploy the dotfiles (in *zsh* or *nushell*):

```shell
deploy-dotfiles
```

### Installing packages

- **Nix**

  Run:

  ```shell
  deploy-dotfiles
  ```

- **Dotter** or **Nothing**

  You need to install packages manually.

  Check the [`home-manager/home/packages.nix`](https://github.com/Chikurin1014/dotfiles/blob/main/home-manager/home/packages.nix) file for the list of packages to install.

  - Example for Debian/Ubuntu

    ```shell
    sudo apt update && sudo apt upgrade -y
    sudo apt install -y \
        build-essential \
        ...
    ```

> [!NOTE]
> On Windows, you can use [Scoop](https://scoop.sh/) to install packages:
>
> ```shell
> scoop import scoop.json
> ```
>
> You should install Firge Nerd Font **manually** from [Releases · yuru7/Firge](https://github.com/yuru7/Firge/releases).

After installing packages, you can install language runtimes by the following command:

```shell
mise install
```
