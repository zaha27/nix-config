{ ... }: {
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.gc.automatic = true;
  nix.gc.interval = { Weekday = 0; Hour = 0; Minute = 0; };
  nix.gc.options = "--delete-older-than 30d";

  homebrew = {
    enable = true;
    onActivation.autoUpdate = true;
    brews = [ "starship" ];
    casks = [
      "ghostty"
      "google-chrome"
      "discord"
      "visual-studio-code"
      "claude"
      "docker-desktop"
      "font-jetbrains-mono-nerd-font"
    ];
  };

  system.defaults = {
    finder = {
      AppleShowAllExtensions = true;   # arata extensiile fisierelor
      AppleShowAllFiles = true;        # arata fisierele ascunse
      ShowPathbar = true;              # bara cu path-ul in josul ferestrei
      ShowStatusBar = true;            # bara de status cu nr fisiere / spatiu
      FXPreferredViewStyle = "Nlsv";   # list view implicit
      FXDefaultSearchScope = "SCcf";  # cauta in folderul curent, nu tot mac-ul
      _FXShowPosixPathInTitle = true;  # path complet in titlul ferestrei
    };
  };
}
