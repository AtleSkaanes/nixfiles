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
    ratty
    msbuild
    meld
    glow

    vscode-extensions.vadimcn.vscode-lldb.adapter
    direnv
    atuin
    openssl
    pkg-config
    repgrep
    hyperfine
    poop
    vscodium
    vscode-extensions.vadimcn.vscode-lldb
    gdb
    just

    stylua

    jetbrains.clion
    jetbrains.rider

    jdk
  ];


}
