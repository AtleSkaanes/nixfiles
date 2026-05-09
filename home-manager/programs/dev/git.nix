{ pkgs, ... }:
{
  programs.git = {
    enable = true;
    package = pkgs.gitFull;
    lfs.enable = true;
    settings = {
      pull.rebase = true;
      user.name = "atleSkaanes";
      user.email = "atle.skaanes@gmail.com";
      init.defaultBranch = "main";
      merge.tool = "meld";

      alias = {
        l = "status --short --branch";
        hist = "log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(auto)%d%C(reset)' --all";
        yoink = "pull";
        yank = "pull";
        yeet = "push";

        force = "push --force-with-lease --force-if-includes";
        rank = "shortlog --summary --numbered --no-merges";
      };
    };
  };
}
