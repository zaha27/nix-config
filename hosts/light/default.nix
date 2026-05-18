{ pkgs, ... }: {
  system.primaryUser = "zaha";
  networking.hostName = "light";
  system.stateVersion = 5;

  users.users.zaha = {
    home = "/Users/zaha";
    shell = pkgs.zsh;
  };

  programs.zsh.enable = true;

  # option+left/right pentru a naviga prin toate spatiile (inclusiv fullscreen)
  system.defaults.CustomUserPreferences = {
    "com.apple.symbolichotkeys" = {
      AppleSymbolicHotKeys = {
        # Move left a space: option+left
        "79" = { enabled = true; value = { parameters = [ 65361 123 524288 ]; type = "standard"; }; };
        # Move right a space: option+right
        "81" = { enabled = true; value = { parameters = [ 65363 124 524288 ]; type = "standard"; }; };
      };
    };
  };
}
