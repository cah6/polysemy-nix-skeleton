{ mkDerivation, base, criterion, fetchgit, free, freer-simple
, hspec, inspection-testing, mtl, random, stdenv, syb
, template-haskell, transformers
}:
mkDerivation {
  pname = "polysemy";
  version = "0.1.2.0";
  src = fetchgit {
    url = "https://github.com/isovector/polysemy";
    sha256 = "024g5yla1rf4in0cpylljscnw1l7jd3bjfc7y8rrvcj8k0gcl922";
    rev = "17f33bdc931cd3220d5ddb8d15356fa7d7f8bbb3";
  };
  libraryHaskellDepends = [
    base mtl random syb template-haskell transformers
  ];
  testHaskellDepends = [
    base hspec inspection-testing mtl random syb template-haskell
    transformers
  ];
  benchmarkHaskellDepends = [
    base criterion free freer-simple mtl random syb template-haskell
    transformers
  ];
  homepage = "https://github.com/isovector/polysemy#readme";
  description = "Higher-order, low-boilerplate, zero-cost free monads";
  license = stdenv.lib.licenses.bsd3;
}
