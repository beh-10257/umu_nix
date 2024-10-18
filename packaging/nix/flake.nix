{
  description = "umu universal game launcher";
  inputs = {
    nixpkgs = {
      type = "github";
      owner = "NixOS";
      repo = "nixpkgs";
      ref = "master";
      rev = "16a8db078642abcacbeaab8ce4c5267857f18ff2";
    };
  };
  outputs = { self, nixpkgs }:
  let
  umu-launcher-src=builtins.toPath "${self}/../../";
  nixpk=nixpkgs.legacyPackages.x86_64-linux;
  in
  let
  pyth = nixpk.pkgs.python3;
  version = "1.1.3";
  in
  let
    umu-package = nixpk.callPackage ./umu-launcher.nix { umu-launcher=umu-launcher-src; pyth1=pyth; version = "${version}"; };
    umu-run = nixpk.callPackage ./umu-run.nix { package=umu-package; version = "${version}"; };
  in{
    packages.x86_64-linux.umu = nixpk.callPackage ./combine.nix { env=umu-run; package=umu-package; version = "${version}"; };
  };
}
