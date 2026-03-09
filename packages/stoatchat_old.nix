{
  lib,
  makeDesktopItem,
  asar,

  unzip,
  patchelf,
  stdenv,

  libGL,
  nspr,
  nss,
  dbus,
  cups,
  cairo,
  pango,
  libX11,
  libXcomposite,
  libXdamage,
  glib,
  gtk3,
  libXext,
  udev,
  libxkbcommon,
  libXfixes,
  libXrandr,
  libgbm,
  expat,
  libxcb,
  at-spi2-atk,
  alsa-lib,
}:
let
  pname = "stoat-chat";
  name = "stoat chat";
  dependencies = [
    libGL
    nspr
    nss
    dbus
    cups
    cairo
    glib
    gtk3
    pango
    libX11
    libXcomposite
    libXdamage
    libXext
    udev
    libxkbcommon
    libXfixes
    libXrandr
    libgbm
    expat
    libxcb
    at-spi2-atk
    alsa-lib
  ];
  desktopEntry = makeDesktopItem {
    name = name;
    desktopName = pname;
    exec = "stoat-desktop %f";
    terminal = false;
  };
in
stdenv.mkDerivation {
  pname = pname;
  version = "bin";
  src = builtins.fetchurl {
    url = "https://github.com/stoatchat/for-desktop/releases/download/v1.3.0/Stoat-linux-x64-1.3.0.zip";
    sha256 = "0d7xzmzcpydmcqvv5928mlc1mnh311jhrimbjkskpnc9fl05z1wz";
  };

  nativeBuildInputs = [
    unzip
    patchelf
  ];

  buildInputs = dependencies;

  installPhase = ''
    mkdir -p $out/bin

    cp -r . $out/
    ln -s $out/stoat-desktop $out/bin/stoat-desktop

    mkdir -p $out/share/applications
    cp ${desktopEntry}/share/applications/${pname}.desktop $out/share/applications/${pname}.desktop
  '';

  postFixup = ''
    patchelf --set-interpreter "${stdenv.cc.bintools.dynamicLinker}" --set-rpath "$out:${lib.makeLibraryPath dependencies}" $out/stoat-desktop
  '';

  # postInstall = ''
  #   wrapProgram $out/bin/observer \
  #     --prefix PATH : ${
  #       lib.makeLibraryPath dependencies
  #     }
  # '';
}
