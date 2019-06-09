{ mkDerivation, base, containers, criterion, fetchgit, free
, freer-simple, hspec, inspection-testing, mtl, stdenv, syb
, template-haskell, th-abstraction, transformers
}:
mkDerivation {
  pname = "polysemy";
  version = "0.3.0.1";
  src = fetchgit {
    url = "https://github.com/isovector/polysemy";
    sha256 = "1g3myqm2bg321f94mgjn6p2zi7qj0klb1pxcp1q4l6537pg19kpr";
    rev = "1813b53750e245494fbc22f71a0bc83a4c2000c6";
  };
  libraryHaskellDepends = [
    base containers mtl syb template-haskell th-abstraction
    transformers
  ];
  testHaskellDepends = [
    base containers hspec inspection-testing mtl syb template-haskell
    th-abstraction transformers
  ];
  benchmarkHaskellDepends = [
    base containers criterion free freer-simple mtl syb
    template-haskell th-abstraction transformers
  ];
  homepage = "https://github.com/isovector/polysemy#readme";
  description = "Higher-order, low-boilerplate, zero-cost free monads";
  license = stdenv.lib.licenses.bsd3;
}
