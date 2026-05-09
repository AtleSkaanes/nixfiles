{ config, ... }:
{
  programs.zsh = {
    enable = true;

    initContent = "source " + config.xdg.configHome + "/zsh/.zshrc";
    dotDir = config.home.homeDirectory;

  # dotDir =  config.xdg.configHome + "/zsh";
};
}
