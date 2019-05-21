{ mkDerivation, base, fetchgit, ghc, ghc-tcplugins-extra, hpack
, hspec, polysemy, should-not-typecheck, stdenv
}:
mkDerivation {
  pname = "polysemy-plugin";
  version = "0.1.0.0";
  src = fetchgit {
    url = "https://github.com/isovector/polysemy";
    sha256 = "0r43jas0mlvfs5azmdipgsgkv58n03pys717rgiqcj1cr3vgi8sa";
    rev = "b5ea9ae0fd492db0bb79c851ac7ea8e702a18831";
  };
  postUnpack = "sourceRoot+=/polysemy-plugin; echo source root reset to $sourceRoot";
  libraryHaskellDepends = [ base ghc ghc-tcplugins-extra polysemy ];
  libraryToolDepends = [ hpack ];
  testHaskellDepends = [
    base ghc ghc-tcplugins-extra hspec polysemy should-not-typecheck
  ];
  preConfigure = "hpack";
  homepage = "https://github.com/isovector/polysemy#readme";
  description = "Disambiguate obvious uses of effects";
  license = stdenv.lib.licenses.bsd3;
}
