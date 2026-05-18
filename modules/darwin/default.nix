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
}
