{
  inputs.nixpkgs.url = github:NixOS/nixpkgs/nixos-unstable;

  outputs = {self, nixpkgs}: {
    overlays.default = import ./overlay.nix;
  };
}
