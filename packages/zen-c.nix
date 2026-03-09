{
  fetchzip,
  gnumake,
  stdenv,
}:
let
  dependencies = [
  ];
  pname = "zen-c";
  version = "0.4.2";
in
stdenv.mkDerivation {
  pname = pname;
  version = "bin";

  src = fetchzip {
    url = "https://github.com/z-libs/Zen-C/archive/refs/tags/v${version}.tar.gz";
    sha256 = "GHN2b2m/tPUAC4gfgxSSN5PkctaoZQlmDyk70eKoLmY=";
    stripRoot = false;
  };

  nativeBuildInputs = [
    gnumake
  ];

  buildInputs = dependencies;

  # dontConfigure = true;
  # dontBuild = true;

  installPhase = ''
    mkdir -p $out/bin
    make -C "Zen-C-${version}" PREFIX="$out" install
  '';

  # postFixup = ''
  #   patchelf --set-interpreter "${stdenv.cc.bintools.dynamicLinker}" --set-rpath "$out/opt/Observer" $out/opt/Observer/observer
  # '';

  #   postInstall = ''
  #     wrapProgram $out/bin/observer \
  #       --prefix PATH : ${
  #         lib.makeLibraryPath dependencies
  #       }
  #   '';
}
