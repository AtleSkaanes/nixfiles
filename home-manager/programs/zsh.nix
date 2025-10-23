{ config, ... }:
{
  programs.zsh = {
    enable = true;

    initContent = "source " + config.xdg.configHome + "/zsh/.zshrc";

    # dotDir =  config.xdg.configHome + "/zsh";
  };
}
