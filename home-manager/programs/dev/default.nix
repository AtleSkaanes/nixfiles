{ pkgs, ... }:
{
  imports = [
    ./langs
  ];

  home.packages = with pkgs; [
    msbuild
    meld

    vscode-extensions.vadimcn.vscode-lldb.adapter
    direnv
    openssl
    pkg-config
    repgrep
    hyperfine
    poop
    vscodium
    vscode-extensions.vadimcn.vscode-lldb
    gdb

    stylua

    unityhub
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
