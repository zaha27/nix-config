{ ... }: {
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    initContent = ''
      eval "$(starship init zsh)"
    '';
    shellAliases = {
      terminal = "open -a Ghostty";
    };
  };

  programs.git = {
    enable = true;
    userName = "zaha27";
    userEmail = "andrei.zaharia2005@gmail.com";
  };

  home.stateVersion = "24.11";
}
