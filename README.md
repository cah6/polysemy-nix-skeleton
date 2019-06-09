Polysemy skeleton built with Nix. 

Quick start, assuming you've [installed Nix](https://nixos.org/nix/download.html):
- `nix-shell` to get into shell with GHC and package dependencies
- `cabal new-repl` to go into repl from there
- Hoogle is included, run from nix-shell with `hoogle server --local --port=8080`

To update the polysemy versions to latest:
```
cabal2nix https://github.com/isovector/polysemy > nix/lib/polysemy.nix
cabal2nix https://github.com/isovector/polysemy --subpath polysemy-plugin > nix/lib/polysemy-plugin.nix
```