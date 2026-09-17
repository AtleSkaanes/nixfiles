{ pkgs, ... }:
{
  home.packages = with pkgs.llvmPackages_latest; [
    bolt
    # bintools
    clangUseLLVM
    clang-tools
    lld
    lldb

    pkgs.cmake
    pkgs.gnumake
    pkgs.meson
  ];

}
