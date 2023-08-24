{ pkgs ? import <nixpkgs> {}, hyprland }:
pkgs.callPackage ./default.nix { inherit hyprland; }