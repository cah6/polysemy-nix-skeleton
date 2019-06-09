{ withHoogle ? false
}:
let
  pinnedPkgs = (import ./nix/nix-ghc-ptr.nix).pinnedPkgs;

  customHaskellPackages = pinnedPkgs.haskellPackages.override (old: {
    overrides = pinnedPkgs.lib.composeExtensions (old.overrides or (_: _: {})) (self: super: {
      project1 = self.callCabal2nix "project1" ./project1.cabal { };
      generic-deriving = self.callPackage ./nix/lib/generic-deriving.nix { };
      polysemy = self.callPackage ./nix/lib/polysemy.nix { };
      polysemy-plugin = self.callPackage ./nix/lib/polysemy-plugin.nix { };
      th-abstraction = self.callPackage ./nix/lib/th-abstraction.nix { };
      th-lift = self.callPackage ./nix/lib/th-lift.nix { };
    });
  });

  hoogleAugmentedPackages = import ./nix/toggle-hoogle.nix { withHoogle = withHoogle; input = customHaskellPackages; };

in
  { project1 = hoogleAugmentedPackages.project1;
  }