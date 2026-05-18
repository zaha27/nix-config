{ ... }: {
  imports = [ ../common/default.nix ];

  home.username = "zaha";
  home.homeDirectory = "/Users/zaha";

  home.file = {
    ".config/ghostty/config".source = ../../dotfiles/ghostty/config;
    ".config/starship.toml".source = ../../dotfiles/starship/starship.toml;
  };
}
