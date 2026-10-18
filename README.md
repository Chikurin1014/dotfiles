# dotfiles

**dotfiles** used by [Chikurin1014](https://github.com/Chikurin1014)

## Environment requirements for installation

- **Git**
- **Nix** (**recommended**, optional; not on Windows)

The deployment scripts ([`deploy.sh`](./deploy.sh) on Linux / macOS, [`deploy.ps1`](./deploy.ps1) on Windows) select a deployment tool:

- **Nix** \
If Nix (or Home Manager) is installed, Home Manager deploys the dotfiles and installs the packages.

- **Dotter** \
Otherwise, [Dotter](https://github.com/SuperCuber/dotter) deploys the dotfiles.
If Dotter is not installed, the scripts download the Dotter binary pinned in [`.dotter/manifest.toml`](./.dotter/manifest.toml) into `.dotter/bin/` and check its SHA-256.
Then they install [mise](https://mise.jdx.dev/) if it is not installed, and run `mise install` for the tools in its global configuration.
On Windows, `deploy.ps1` also installs [Scoop](https://scoop.sh/) if it is not installed, and the packages in [`scoop.json`](./scoop.json).

> [!NOTE]
> `.dotter/manifest.toml` is updated by a pull request from the [`Update Dotter`](./.github/workflows/update-dotter.yml) workflow when Dotter is released.

### Installation of Nix (optional)

If you haven't installed **Nix**, you can install it by following the instructions below.

- [NixOS website](https://nixos.org/download/)
- [Determinate Nix](https://docs.determinate.systems/determinate-nix#getting-started)

## Installation

### 1. Clone this repository to home directory

```shell
cd ~
git clone --recurse-submodules git@github.com:Chikurin1014/dotfiles.git
cd dotfiles
```

> [!NOTE]
> You may need to change the values in [`user.toml`](./user.toml), which are read by Nix and Dotter templates:
>
> ```toml
> # user.toml
>
> username = "<your-user-name>"
> editor = "<your-favorite-editor>"
>
> [git]
> name = "<your-git-user-name>"
> email = "<your-git-user-email>"
> ```

### 2. Run the deployment script

- **Linux / macOS**

  ```shell
  ./deploy.sh
  ```

  > [!NOTE]
  > `deploy.sh` initializes git submodules which are not initialized yet.
  > With Nix, Nix 2.27 or later is required, since the flake reads the `nvim-config` git submodule (`inputs.self.submodules`).

  > [!NOTE]
  > On Linux distributions other than NixOS (not on WSL), Nix uses the `<your-user-name>@generic-linux` configuration
  > (`home-manager switch --flake .#<your-user-name>@generic-linux`).
  > To make GPU drivers available to GUI applications installed by Nix, run the following command once after the first deployment
  > (and again when Home Manager warns that the drivers require an update):
  >
  > ```shell
  > sudo "$(command -v non-nixos-gpu-setup)"
  > ```

  > [!NOTE]
  > Without Nix, `deploy.sh` creates `.dotter/local.toml` for Unix if it does not exist:
  >
  > ```toml
  > includes = [".dotter/unix.toml"]
  > packages = ["default", "unix"]
  > ```

- **Windows**

  Run the following command in PowerShell **as a normal user** (Scoop refuses to be installed by an administrator).
  It also works on Windows PowerShell 5.1, which is the only PowerShell on a fresh Windows.

  ```powershell
  powershell -ExecutionPolicy Bypass -File deploy.ps1
  ```

  > [!NOTE]
  > Creating symbolic links needs administrator rights or [Developer Mode](https://learn.microsoft.com/windows/advanced-settings/developer-mode).
  > Without Developer Mode, `deploy.ps1` runs Dotter as administrator (a UAC prompt appears).

  > [!NOTE]
  > `deploy.ps1` creates `.dotter/local.toml` for Windows if it does not exist:
  >
  > ```toml
  > includes = [".dotter/windows.toml"]
  > packages = ["default", "windows"]
  > ```
  >
  > When you run `dotter deploy` by yourself, run it in the root of this repository,
  > since some templates read [`user.toml`](./user.toml) by a path relative to it.

## NixOS configurations

This flake also provides NixOS configurations (see [`nix/nixos`](./nix/nixos)):

| Host | Description |
| --- | --- |
| `ChNix-WSL` | NixOS on WSL ([NixOS-WSL](https://github.com/nix-community/NixOS-WSL)) |
| `ChNix` | NixOS on a physical machine (UEFI) |

Apply a configuration by running:

```shell
sudo nixos-rebuild switch --flake .#<host>
```

### `ChNix` (physical machine)

#### Hardware configuration

[`nix/nixos/modules/hardware-configuration.nix`](./nix/nixos/modules/hardware-configuration.nix) is a **placeholder**.
It assumes a UEFI machine whose partitions are labeled `nixos` (root, ext4) and `boot` (ESP, vfat).
Replace it with the one generated on the target machine before building:

```shell
# On an installed system
nixos-generate-config --show-hardware-config > nix/nixos/modules/hardware-configuration.nix

# From the NixOS installer (the target system is mounted on /mnt)
nixos-generate-config --root /mnt --show-hardware-config > nix/nixos/modules/hardware-configuration.nix
```

> [!NOTE]
> Nix flakes only see files tracked by Git, so run `git add` after replacing the file.

#### User password

The user account is created **without a password** since no password (hash) is stored in this repository.
Set it as root after installation:

```shell
# From the NixOS installer, after `nixos-install --flake .#ChNix` (before rebooting)
nixos-enter --root /mnt -c 'passwd <your-user-name>'

# On an installed system
sudo passwd <your-user-name>
```

> [!NOTE]
> `nixos-install` asks for the root password at the end of the installation.
> The password set by `passwd` is kept across rebuilds (`users.mutableUsers` is `true` by default).

## Usage

### Deploying dotfiles

After the installation, you can use the following command to deploy the dotfiles (in *fish* or *nushell*):

```shell
deploy-dotfiles
```

### Installing packages

- **Nix**

  Run:

  ```shell
  deploy-dotfiles
  ```

- **Dotter**

  The deployment scripts install the tools managed by mise ([`files/config/mise/config.toml`](./files/config/mise/config.toml)).
  On Linux / macOS, you need to install the other packages manually.

  Check the [`nix/home-manager/modules/packages/_common.nix`](./nix/home-manager/modules/packages/_common.nix) file for the list of packages to install.

  - Example for Debian/Ubuntu

    ```shell
    sudo apt update && sudo apt upgrade -y
    sudo apt install -y \
        build-essential \
        ...
    ```

> [!NOTE]
> On Windows, `deploy.ps1` installs the packages in `scoop.json` with [Scoop](https://scoop.sh/) (`scoop import scoop.json`).
>
> `scoop.json` is maintained by hand, not by `scoop export`, which also writes volatile fields such as versions and timestamps.
> To add a package, add its `Name` and `Source` (the bucket name) to `apps`.
> The bucket must also be listed in `buckets` of the same file, since `scoop import` treats an unknown `Source` as the name of an app.
>
> You should install Firge Nerd Font **manually** from [Releases · yuru7/Firge](https://github.com/yuru7/Firge/releases).

To install the tools added to the mise configuration later, run the following command:

```shell
mise install
```

### Neovim configuration

The Neovim configuration is managed in [`nvim-config`](https://github.com/Chikurin1014/nvim-config),
which is included as a git submodule and used by all deployment tools.

- **Trying changes**: edit the files in `nvim-config/` and run `deploy-dotfiles`.
  With **Nix**, uncommitted changes in the submodule are also applied,
  but new files must be added to Git first (`git -C nvim-config add <file>`).
  With **Dotter**, the files are symlinked, so changes are applied immediately.
- **Updating**: update the submodule and commit it (Dependabot also opens pull requests for it):

  ```shell
  git submodule update --remote nvim-config
  git add nvim-config
  git commit
  ```

### SSH agent (Linux)

The `ssh-agent` systemd user service is deployed to `~/.config/systemd/user/ssh-agent.service`.
It is enabled automatically with **Nix**. With **Dotter**, enable it manually:

```shell
systemctl --user enable --now ssh-agent
```

> [!NOTE]
> The service does not start on WSL. See [SSH agent (WSL)](#ssh-agent-wsl).

### SSH agent (Windows)

Use the ssh-agent service (OpenSSH Authentication Agent) of Windows.
It is **disabled** by default, so enable and start it once with administrator privileges:

```powershell
sudo powershell -NoProfile -Command "Set-Service ssh-agent -StartupType Automatic; Start-Service ssh-agent"
```

Then add your key once. The Windows ssh-agent keeps added keys across reboots:

```powershell
ssh-add $env:USERPROFILE\.ssh\id_ed25519
ssh-add -l
```

> [!NOTE]
> The ssh bundled with Git for Windows cannot talk with the ssh-agent service.
> `~/.config/git/windows.gitconfig` (deployed by Dotter) sets `core.sshCommand` to use Windows OpenSSH (`C:/Windows/System32/OpenSSH/ssh.exe`) instead.

### SSH agent (WSL)

On WSL, the ssh-agent service of Windows is used via [wsl2-ssh-agent](https://github.com/mame/wsl2-ssh-agent),
so the same keys are available on both Windows and WSL.
`ChNix-WSL` enables it by `wsl.ssh-agent.enable` of NixOS-WSL, which also sets `SSH_AUTH_SOCK`.
On other WSL distributions, install it by following [its README](https://github.com/mame/wsl2-ssh-agent#how-to-use).

1. Set up the ssh-agent service on Windows and add your key (see [SSH agent (Windows)](#ssh-agent-windows)).
2. Apply the NixOS configuration and restart WSL (`wsl --shutdown` on Windows).
3. Check that the keys added on Windows are listed:

   ```shell
   ssh-add -l
   ```

> [!NOTE]
> Private keys are not needed in WSL.
> If you use `IdentitiesOnly yes` in `~/.ssh/config`, set `IdentityFile` to the **public** key (e.g. `~/.ssh/id_ed25519.pub`)
> so that ssh can pick the corresponding key from the agent.

> [!TIP]
> If it does not work, check the logs with `journalctl --user -u wsl2-ssh-agent`.

## Docker container

You can use docker container with running

```shell
docker compose run playground
```

> [!NOTE]
> The user in the container uses UID/GID 1000 by default.
> If the UID/GID of your host user differ, set them in `.env` (not tracked by git):
>
> ```shell
> printf 'UID=%s\nGID=%s\n' "$(id -u)" "$(id -g)" > .env
> ```

> [!NOTE]
> The container runs `deploy.sh` on the first start, which deploys the dotfiles with Dotter.
> Since this repository is mounted into the container, Dotter there uses `.dotter/local.toml`, `.dotter/cache.toml` and `.dotter/bin/` of the host.
> If you deploy with Dotter on the host too (e.g. a Windows host), the container overwrites the cache of the host.

## Development

Example of workspace settings (Neovim):
```lua
-- .nvim.lua

vim.lsp.enable({
    'bashls',
    'emmylua_ls',
    'fish_lsp',
    'taplo',
    'jsonls',
    'yamlls'
})
```
