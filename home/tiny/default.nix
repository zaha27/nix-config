{ ... }: {
  home.username = "zaha";
  home.homeDirectory = "/home/zaha";

  home.file = {
    ".config/starship.toml".source = ../../dotfiles/common/starship/starship.toml;
  };

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    initContent = ''
      eval "$(starship init zsh)"
    '';
    shellAliases = {
      ".."   = "cd ..";
      "..."  = "cd ../..";
      "...." = "cd ../../..";

      ll  = "eza -lh --icons --git";
      la  = "eza -lah --icons --git";
      l   = "eza --icons";
      lt  = "eza --tree --icons";

      g    = "git";
      gs   = "git status";
      ga   = "git add";
      gc   = "git commit";
      gp   = "git push";
      gl   = "git log --oneline --graph --decorate";
      gd   = "git diff";
      gco  = "git checkout";
      gcb  = "git checkout -b";

      c    = "clear";
      q    = "exit";
      path = "echo $PATH | tr ':' '\n'";
    };
  };

  programs.git = {
    enable = true;
    userName = "zaha27";
    userEmail = "andrei.zaharia2005@gmail.com";
  };

  home.stateVersion = "25.05";
}
