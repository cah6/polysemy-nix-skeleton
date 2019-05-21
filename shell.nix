let 
  ghcPtr = import ./nix/nix-ghc-ptr.nix;
  pinnedPkgs = ghcPtr.pinnedPkgs;
  myPackages = (import ./release.nix { withHoogle = true; } );
  all-hies = import (fetchTarball "https://github.com/infinisil/all-hies/tarball/master") {};

  projectDrvEnv = myPackages.project1.env.overrideAttrs (oldAttrs: rec {
    buildInputs = oldAttrs.buildInputs ++ [ 
      pinnedPkgs.haskellPackages.cabal-install
      pinnedPkgs.haskellPackages.hlint
      # If you want to use HIE, run `cachix use all-hies`, restart nix daemon, and uncomment below 
      # all-hies.versions.${ghcPtr.hieVer}
      ];
    shellHook = ''
      export HIE_HOOGLE_DATABASE="$NIX_GHC_LIBDIR/../../share/doc/hoogle/index.html"
    '';
  });
in 
  projectDrvEnv