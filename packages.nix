{ pkgs }: {
  zoem = pkgs.callPackage ./zoem.nix {
    inherit pkgs;
  };
  surgescript = pkgs.callPackage ./surgescript.nix { };
  yorick = pkgs.callPackage ./yorick.nix { };
  brainfuck = pkgs.callPackage ./brainfuck.nix { };
  cfunge = pkgs.callPackage ./cfunge.nix { };
  golfscript = pkgs.callPackage ./golfscript.nix { };
  goaheui = pkgs.callPackage ./goaheui.nix { };
  lazyk = pkgs.callPackage ./lazyk.nix { };
  livescript = pkgs.callPackage ./livescript.nix { };
}
