{ pkgs, lib, ... }:
let
  glowTheme = {
    src = pkgs.fetchFromGitHub {
      owner = "catppuccin";
      repo = "glamour"; 
      rev = "00c97fa3823d272d9d041d5d872ae6335555a776";
      sha256 = "sha256-SI/COnVFdKltMRqeqLTbR/Rh0xUJcWSqiX/YlR221eo=";
    };
    file = "themes/catppuccin-mocha.json";
  };

  glowConfig = {
    style = "${glowTheme.src}/${glowTheme.file}";
    mouse = false;
    pager = false;
    width = 80;
  };
in
{
  home.packages = with pkgs; [
    glow
  ];

  xdg.configFile."glow/glow.yml".source = 
    (pkgs.formats.yaml { }).generate "glow-config" glowConfig;
}
