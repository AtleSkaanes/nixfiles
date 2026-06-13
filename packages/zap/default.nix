{
  stdenvNoCC,
  fetchzip,
  ...
}:
let
  pname = "zap";
  version = "1.2.0";
in
stdenvNoCC.mkDerivation {
  pname = pname;
  version = version;

  src = fetchzip {
    url = "https://github.com/zap-zsh/zap/archive/refs/tags/${version}.tar.gz";
    hash = "sha256-NsZrSkIzVMoh2K4Zn64Gs1qfSEzxHgvLXSVJJ8RgkEc=";
  };

  installPhase = ''
    mkdir -p $out/share/zap
    cp -r . $out/share/zap
  '';

  meta.description = "⚡ Zap is a minimal zsh plugin manager";
}
