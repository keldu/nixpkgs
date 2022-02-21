{ lib
, stdenv
, fetchurl
, zlib
, fetchFromGitHub
, scons
, pkg-config
, clang_12
, clang-tools
, gnutls
}:

stdenv.mkDerivation rec {
  pname = "forstio";
  version = "0.0.0";

  buildInputs = [scons clang_12 clang-tools gnutls];
  
  src = fetchFromGitHub {
    repo = "forstio";
    owner = "keldu";
    rev = "568ad71ca6a43e62e9d641a1e77a99652018c2ae";
    sha256 = "01gfwqhvixs8jxdxv8qs5q6d6hk5rdbsgd7kh45bw9kmpj23sx1w";
  };

  doCheck = true;
  enableParallelBuilding = true;

  outputs = ["out" "dev"];

  meta = with lib; {
    homepage = "https://github.com/keldu/forstio";
    description = "An asynchronous framework with some additional network features";
    platforms = platforms.unix;
    maintainers = with maintainers; [keldu];
  };
}
