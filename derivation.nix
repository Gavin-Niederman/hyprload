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
    mkdir -p $out/lib
    cp hyprload.so $out/lib
  '';

  meta = with lib; {
    homepage = "https://github.com/Duckonaut/hyprload";
    description = "A Hyprland plugin manager";
    platforms = platforms.linux;
  };
}
