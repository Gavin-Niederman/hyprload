{
  inputs.flake-utils.url = "github:numtide/flake-utils";
  inputs.hyprland.url = "github:hyprwm/Hyprland";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs, flake-utils, hyprland, ... }:
    (flake-utils.lib.eachDefaultSystem (system:
      let pkgs = nixpkgs.legacyPackages.${system};
      in with pkgs; rec {
        packages = rec {
          hyprload = import ./default.nix { inherit (hyprland.packages.${system}) hyprland; };
          default = hyprload;
        };
        apps = rec {
          hyprload =
            flake-utils.lib.mkApp { drv = self.packages.${system}.default; };
          default = hyprload;
        };
      }));
      # // rec {
      #   overlay = overlays.default;
      #   overlays.default = (final: _: let in { hyprload = import ./default.nix { inherit hyprland; }; });
      # };
}
