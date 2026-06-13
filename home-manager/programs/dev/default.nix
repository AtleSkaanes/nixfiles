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

    vscode-extensions.vadimcn.vscode-lldb.adapter
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

    jdk
  ];


}
