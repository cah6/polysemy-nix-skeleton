{ mkDerivation, base, containers, fetchgit, ghc-prim, hspec
, hspec-discover, stdenv, template-haskell, th-abstraction
}:
mkDerivation {
  pname = "generic-deriving";
  version = "1.13";
  src = fetchgit {
    url = "https://github.com/dreixel/generic-deriving";
    sha256 = "0m0kqasd8vazcxkzrayz46i80qjbf39cg8499gczc9azshpzlydp";
    rev = "aaa4d642689dd93240adb142d28f26e96c4e811b";
  };
  libraryHaskellDepends = [
    base containers ghc-prim template-haskell th-abstraction
  ];
  testHaskellDepends = [ base hspec template-haskell ];
  testToolDepends = [ hspec-discover ];
  homepage = "https://github.com/dreixel/generic-deriving";
  description = "Generic programming library for generalised deriving";
  license = stdenv.lib.licenses.bsd3;
}
