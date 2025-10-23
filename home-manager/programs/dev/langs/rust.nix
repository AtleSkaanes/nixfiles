{ pkgs, ... }:
{
  home.packages = with pkgs; [
    rustc
    cargo
    vimPlugins.rustaceanvim
    rustfmt
    clippy
    rust-analyzer
  ];
}
