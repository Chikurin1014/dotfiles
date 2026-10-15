let
  inherit (builtins) fromJSON readFile;
  # Resolve the nixpkgs input of this flake (not a transitive one) from flake.lock
  lock = fromJSON (readFile ../../flake.lock);
  nixpkgsLocked = lock.nodes.${lock.nodes.root.inputs.nixpkgs}.locked;
  nixpkgsSrc = fetchTarball {
    url = "https://github.com/${nixpkgsLocked.owner}/${nixpkgsLocked.repo}/archive/${nixpkgsLocked.rev}.tar.gz";
    sha256 = nixpkgsLocked.narHash;
  };
in
{
  pkgs ? import nixpkgsSrc { },
  lib ? pkgs.lib,
}:

let
  repository-url = "https://github.com/yuru7/Firge";
in
pkgs.stdenvNoCC.mkDerivation rec {
  pname = "firge-nerd-font";
  version = "0.3.0";

  src = pkgs.fetchzip {
    url = "${repository-url}/releases/download/v${version}/FirgeNerd_v${version}.zip";
    hash = "sha256-Zb95RroGitkOetmLPa4r8EsIKnKiYw7pAlVg6j9lgoc=";
  };

  installPhase = ''
    runHook preInstall
    install -Dm644 *.ttf -t $out/share/fonts/firge-nerd
    runHook postInstall
  '';

  meta = {
    description = "Fira Mono と源真ゴシックを合成したプログラミングフォント Firge (ファージ)";
    homepage = repository-url;
    license = lib.licenses.ofl;
    platforms = lib.platforms.all;
  };
}
