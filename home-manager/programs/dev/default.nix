{  pkgs, ... }:
{
  imports = [
    ./langs
    ./unity.nix
  ];

  home.packages = with pkgs; [
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

  programs.git = {
    enable = true;
    package = pkgs.gitFull;
    lfs.enable = true;
    settings = {
      pull.rebase = true;
      user.name = "atleSkaanes";
      user.email = "atle.skaanes@gmail.com";
      init.defaultBranch = "main";
    };
  };

}
