{  pkgs, ... }:
{
  imports = [
    ./langs
    ./gh.nix
    ./git.nix
    ./unity.nix
    ./zsh.nix
  ];

  home.packages = with pkgs; [
    msbuild
    meld
    hexyl

    atuin
    openssl
    pkg-config
    repgrep
    hyperfine
    poop
    vscodium.fhs
    gdb
    just

    stylua

    jdk
  ];


}
