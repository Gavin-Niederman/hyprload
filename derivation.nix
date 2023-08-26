{ lib, stdenv, hyprland, pkgs, }:
stdenv.mkDerivation rec {
  name = "hyprload-${version}";
  version = "0.1.0";
  src = ./.;

  nativeBuildInputs = with pkgs; [ hyprland pkg-config jq wayland-scanner makeWrapper ];

  buildInputs = [ hyprland ] ++ hyprland.buildInputs;

  buildPhase = ''
    make
  '';

  installPhase = ''
    mkdir -p $out/share
    cp hyprload.so $out/share
  '';

  meta = with lib; {
    homepage = "https://github.com/Duckonaut/hyprload";
    description = "A Hyprland plugin manager";
    platforms = platforms.linux;
  };
}
