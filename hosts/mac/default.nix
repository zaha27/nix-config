{ pkgs, ... }: {
  system.primaryUser = "zaha";
  networking.hostName = "mac";
  system.stateVersion = 5;

  users.users.zaha = {
    home = "/Users/zaha";
    shell = pkgs.zsh;
  };

  programs.zsh.enable = true;

}
