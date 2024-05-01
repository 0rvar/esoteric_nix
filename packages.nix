{ pkgs }: {
  zoem = pkgs.callPackage ./zoem.nix {
    inherit pkgs;
  };
  surgescript = pkgs.callPackage ./surgescript.nix { };
  yorick = pkgs.callPackage ./yorick.nix { };
  cfunge = pkgs.callPackage ./cfunge.nix { };
  golfscript = pkgs.callPackage ./golfscript.nix { };
  goaheui = pkgs.callPackage ./goaheui.nix { };
  lazyk = pkgs.callPackage ./lazyk.nix { };
  livescript = pkgs.callPackage ./livescript.nix { };
  thue = pkgs.callPackage ./thue.nix { };
  albus = pkgs.callPackage ./albus.nix { };
  nickle = pkgs.callPackage ./nickle.nix { };
  anyfuck = pkgs.callPackage ./anyfuck.nix { };
}
