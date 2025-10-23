{ pkgs, ... }:
{
  imports = [
    ./langs
  ];

  home.packages = with pkgs; [
    vscode-extensions.vadimcn.vscode-lldb.adapter
    direnv
    openssl
    pkg-config
    repgrep
    hyperfine
  ];

  programs.git = {
    enable = true;
    package = pkgs.gitAndTools.gitFull;
    userName = "atleSkaanes";
    userEmail = "atle.skaanes@gmail.com";
  };

}
