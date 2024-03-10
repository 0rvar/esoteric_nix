{ pkgs }: {
  zoem = pkgs.callPackage ./zoem.nix {
    inherit pkgs;
  };
  surgescript = pkgs.callPackage ./surgescript.nix { };
  yorick = pkgs.callPackage ./yorick.nix { };
  brainfuck = pkgs.callPackage ./brainfuck.nix { };
  aplus = pkgs.callPackage ./aplus.nix { };
}
