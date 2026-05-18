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
      AppleShowAllExtensions = true;
      AppleShowAllFiles = true;
      ShowPathbar = true;
      ShowStatusBar = true;
      FXPreferredViewStyle = "Nlsv";
      FXDefaultSearchScope = "SCcf";
      _FXShowPosixPathInTitle = true;
    };

    NSGlobalDomain = {
      NSAutomaticCapitalizationEnabled = false;
      NSAutomaticSpellingCorrectionEnabled = false;
      NSAutomaticDashSubstitutionEnabled = false;
      NSAutomaticQuoteSubstitutionEnabled = false;
      NSAutomaticPeriodSubstitutionEnabled = false;
      NSRecentDocumentsLimit = 0;
      KeyRepeat = 2;
      InitialKeyRepeat = 15;
    };

    CrashReporter.DialogType = "none";
    dock.show-recents = false;
  };
}
