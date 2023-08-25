{ pkgs, hyprland }:
pkgs.callPackage ./derivation.nix { inherit hyprland; }