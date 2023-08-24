{
  lib,
  stdenv,
  hyprland,
}:
stdenv.mkDerivation {
  pname = "hyprload";
  version = "0.1.0";
  src = ./.;

  inherit (hyprland) nativeBuildInputs;

  buildInputs = [hyprland] ++ hyprland.buildInputs;

  meta = with lib; {
    homepage = "https://github.com/Duckonaut/hyprload";
    description = "A Hyprland plugin manager";
    platforms = platforms.linux;
  };
}