{ config, pkgs, ... }:

{
  home.username = "zaha";
  home.homeDirectory = "/home/zaha";
  home.stateVersion = "25.11";

  gtk.gtk2.configLocation = "${config.home.homeDirectory}/.config/gtk-2.0/gtkrc";
  # GTK dark theme (for Firefox, VSCode, Discord etc.)
  gtk = {
    enable = true;
    theme = {
      name = "adw-gtk3-dark";
      package = pkgs.adw-gtk3;
    };
    gtk3.extraConfig.gtk-application-prefer-dark-theme = true;
    gtk4.extraConfig.gtk-application-prefer-dark-theme = true;
  };

  dconf.settings."org/gnome/desktop/interface".color-scheme = "prefer-dark";

  # Alacritty
  programs.alacritty = {
    enable = true;
    settings = {
      window = {
        padding = { x = 12; y = 12; };
        decorations = "none";
        opacity = 0.60;
        blur = true;
      };
      font = {
        normal = { family = "JetBrainsMono Nerd Font"; style = "Regular"; };
        bold   = { family = "JetBrainsMono Nerd Font"; style = "Bold"; };
        size = 18.0;
      };
      colors = {
        primary = { background = "#0d0d0d"; foreground = "#e0e0e0"; };
        normal = {
          black   = "#1a1a1a"; red     = "#ff6b6b";
          green   = "#a8e6a3"; yellow  = "#ffd93d";
          blue    = "#74b9ff"; magenta = "#ffb3c6";
          cyan    = "#81ecec"; white   = "#e0e0e0";
        };
        bright = {
          black   = "#444444"; red     = "#ff8585";
          green   = "#b8f0b3"; yellow  = "#ffe66d";
          blue    = "#8ec9ff"; magenta = "#ffc8d6";
          cyan    = "#96f4f4"; white   = "#ffffff";
        };
      };
      cursor = {
        style = { shape = "Block"; blinking = "On"; };
        blink_interval = 500;
      };
      scrolling.history = 10000;
      selection.save_to_clipboard = true;
    };
  };

  # Shell
  programs.bash = {
    enable = true;
    shellAliases = {
      culcate = "systemctl suspend";
      rebuild = "cd ~/nixos-dotfiles && git add . && sudo nixos-rebuild switch --flake .#nixos";
    };
  };

  programs.home-manager.enable = true;
}
