let
  inherit (builtins) fromJSON readFile;
  inputInfo = (fromJSON (readFile ../flake.lock)).nodes.nixpkgs;
  flakeInput = rec {
    inherit (inputInfo.locked) rev narHash;
    outPath = fetchTarball {
      url = "https://github.com/${inputInfo.owner}/${inputInfo.repo}/archive/${rev}.tar.gz";
      sha256 = narHash;
    };
  };
in
{ pkgs ? flakeInput, lib ? pkgs.lib }:

let
  repository-url = "https://github.com/yuru7/Firge";
in
pkgs.stdenvNoCC.mkDerivation rec {
  pname = "firge-nerd-font";
  version = "0.2.0";

  src = pkgs.fetchzip {
    url = "${repository-url}/releases/download/v${version}/FirgeNerd_v${version}.zip";
    hash = "sha256-KZHTWGJCE8bPdcKGRYV92hGArgY7uvZ+v75vz0I7Oqg=";
  };

  installPhase = ''
    runHook preInstall
    install -Dm644 *.ttf -t $out/share/fonts/firge-nerd
    runHook postInstall
  '';

  meta = with lib; {
    description = "Fira Mono と源真ゴシックを合成したプログラミングフォント Firge (ファージ)";
    homepage = "${repository-url}";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
