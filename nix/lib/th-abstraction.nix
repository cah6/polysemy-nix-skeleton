{ mkDerivation, base, containers, fetchgit, ghc-prim, stdenv
, template-haskell
}:
mkDerivation {
  pname = "th-abstraction";
  version = "0.3.1.0";
  src = fetchgit {
    url = "https://github.com/glguy/th-abstraction";
    sha256 = "05x9zhf07qka2jcil9a7sfh8si9xx4s8kzjnrs2g7r8qbw92n7w3";
    rev = "00fcd437f35c3049ccca70ff644bdf38e8dce8d0";
  };
  libraryHaskellDepends = [
    base containers ghc-prim template-haskell
  ];
  testHaskellDepends = [ base containers template-haskell ];
  homepage = "https://github.com/glguy/th-abstraction";
  description = "Nicer interface for reified information about data types";
  license = stdenv.lib.licenses.isc;
}
