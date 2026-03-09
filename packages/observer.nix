{
  patchelf,
  # makeWrapper,
  lib,
  dpkg,
  stdenv,
  glib,
  # gio,
  nspr,
  nss,
  dbus,
  # atk,
  # atk-bridge,
  cups,
  cairo,
  gtk3,
  pango,
  libX11,
  libXcomposite,
  libXdamage,
  libXext,
  libXfixes,
  libXrandr,
  libgbm,
  expat,
  libxcb,
  libxkbcommon,
  udev,
  alsa-lib,
  at-spi2-atk,
}:
let
  dependencies = [
    glib
    # gio
    nspr
    nss
    dbus
    # atk
    # atk-bridge
    cups
    cairo
    gtk3
    pango
    libX11
    libXcomposite
    libXdamage
    libXext
    libXfixes
    libXrandr
    libgbm
    expat
    libxcb
    libxkbcommon
    udev
    alsa-lib
    at-spi2-atk
  ];
in
stdenv.mkDerivation {
  pname = "Arcanic-observer";
  version = "bin";
  # src = builtins.fetchurl {
  #   url = "https://aautest1.digitaleksamen.arcanic.dk/studerende/observer/download/linux";
  #   sha256 = "1zzcrxhzc6xg21mvwy9ayc0q88l05rjxlal19i65axm2qcnmkzhj";
  # };
  src = ./Observer-1.0.238.deb;

  nativeBuildInputs = [
    dpkg
    patchelf
  ];

  buildInputs = dependencies;

  # dontConfigure = true;
  # dontBuild = true;

  installPhase = ''
    mkdir -p $out/bin

    cp -r . $out/
    ln -s $out/opt/Observer/observer $out/bin/
  '';

  postFixup = ''
    patchelf --set-interpreter "${stdenv.cc.bintools.dynamicLinker}" --set-rpath "$out/opt/Observer" $out/opt/Observer/observer
  '';

  #   postInstall = ''
  #     wrapProgram $out/bin/observer \
  #       --prefix PATH : ${
  #         lib.makeLibraryPath dependencies
  #       }
  #   '';
}
