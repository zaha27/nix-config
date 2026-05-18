{ ... }: {
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    initContent = ''
      eval "$(starship init zsh)"
    '';
    shellAliases = {
      keys = ''printf "\n\033[1;35m  Yabai + skhd\033[0m\n\n\033[90m  Focus\033[0m          cmd + h / j / k / l\n\033[90m  Move\033[0m           cmd + shift + h / j / k / l\n\033[90m  Resize +\033[0m        cmd + shift + =\n\033[90m  Resize -\033[0m        cmd + shift + -\n\033[90m  Balance\033[0m         cmd + shift + b\n\033[90m  Float/Tile\033[0m      cmd + space\n\033[90m  Fullscreen\033[0m      cmd + f\n\033[90m  Close\033[0m           cmd + q\n\n\033[1;35m  Spatii macOS\033[0m\n\n\033[90m  Stanga/Dreapta\033[0m  option + left / right\n\n"'';
    };
  };

  programs.git = {
    enable = true;
    userName = "zaha27";
    userEmail = "andrei.zaharia2005@gmail.com";
  };

  home.stateVersion = "24.11";
}
