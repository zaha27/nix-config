{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    htop     # process monitor
    ncdu     # disk usage interactiv
    eza      # ls modern cu culori si iconite
    uv       # python package manager rapid
    nodejs   # include npm
    python3  # python
    clang    # C/C++ compiler
  ];
}
