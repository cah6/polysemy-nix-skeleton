{ mkDerivation, base, fetchgit, ghc-prim, stdenv, template-haskell
, th-abstraction
}:
mkDerivation {
  pname = "th-lift";
  version = "0.8.0.1";
  src = fetchgit {
    url = "https://github.com/mboes/th-lift";
    sha256 = "03nwaz2azyyif7cbv7ybxlfkzs57lhj4dc7gykgkaqvyz78d3qjc";
    rev = "1f01ef970101e05c86b2ac8313cfce6fb5f30c11";
  };
  libraryHaskellDepends = [
    base ghc-prim template-haskell th-abstraction
  ];
  testHaskellDepends = [ base ghc-prim template-haskell ];
  homepage = "http://github.com/mboes/th-lift";
  description = "Derive Template Haskell's Lift class for datatypes";
  license = stdenv.lib.licenses.bsd3;
}
