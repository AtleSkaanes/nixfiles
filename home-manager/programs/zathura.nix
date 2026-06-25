{
  programs.zathura = {
    enable = true;
    options = {
      synctex = true;
      synctex-editor-command = "nvim --headless -c \"VimtexInverseSearch %{line} '%{input}'\"";
      recolor = false;
    };
  };
  catppuccin.zathura.enable = true;
}
