{ mkDerivation, base, fetchgit, ghc, ghc-tcplugins-extra, hspec
, inspection-testing, polysemy, should-not-typecheck, stdenv, syb
, transformers
}:
mkDerivation {
  pname = "polysemy-plugin";
  version = "0.2.0.2";
  src = fetchgit {
    url = "https://github.com/isovector/polysemy";
    sha256 = "1g3myqm2bg321f94mgjn6p2zi7qj0klb1pxcp1q4l6537pg19kpr";
    rev = "1813b53750e245494fbc22f71a0bc83a4c2000c6";
  };
  postUnpack = "sourceRoot+=/polysemy-plugin; echo source root reset to $sourceRoot";
  libraryHaskellDepends = [
    base ghc ghc-tcplugins-extra polysemy syb transformers
  ];
  testHaskellDepends = [
    base ghc ghc-tcplugins-extra hspec inspection-testing polysemy
    should-not-typecheck syb transformers
  ];
  homepage = "https://github.com/isovector/polysemy#readme";
  description = "Disambiguate obvious uses of effects";
  license = stdenv.lib.licenses.bsd3;
}
