{ config, pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix ];

  # Bootloader
  boot.loader.timeout = 5;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.loader.limine = {
    enable = true;
    style = {
      wallpapers = [ ./images/wallpaper-limine-blur.jpg ];
      wallpaperStyle = "stretched";
      backdrop = "000000";
    };
    extraEntries = ''
      /Windows 11
        protocol: efi_chainload
        image_path: guid(5186fbe0-eea6-47f3-b926-6f1ba8557b49):/EFI/Microsoft/Boot/bootmgfw.efi
    '';
  };

  fileSystems."/boot/efi-windows" = {
    device = "/dev/disk/by-uuid/000A-90C6";
    fsType = "vfat";
    options = [ "ro" "nofail" "umask=0077" ];
  };

  # Nix
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.settings.auto-optimise-store = true;
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };

  # Networking
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  # Locale
  time.timeZone = "Europe/Bucharest";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS        = "ro_RO.UTF-8";
    LC_IDENTIFICATION = "ro_RO.UTF-8";
    LC_MEASUREMENT    = "ro_RO.UTF-8";
    LC_MONETARY       = "ro_RO.UTF-8";
    LC_NAME           = "ro_RO.UTF-8";
    LC_NUMERIC        = "ro_RO.UTF-8";
    LC_PAPER          = "ro_RO.UTF-8";
    LC_TELEPHONE      = "ro_RO.UTF-8";
    LC_TIME           = "ro_RO.UTF-8";
  };

  # Desktop
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };
  services.desktopManager.plasma6.enable = true;
  services.desktopManager.plasma6.enableQt5Integration = true;

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Audio
  services.printing.enable = true;
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # User
  users.users.zaha = {
    isNormalUser = true;
    description = "Andrei";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  # Packages
  programs.firefox.enable = true;
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    wget curl vim killall efibootmgr git
    vscode
    alacritty
    discord google-chrome
    unzip zip p7zip unrar
    wl-clipboard
    kdePackages.kcalc
    kdePackages.partitionmanager
    kdePackages.sddm-kcm
    nerd-fonts.jetbrains-mono
    inter
  ];

  fonts.packages = with pkgs; [
    inter
    nerd-fonts.jetbrains-mono
  ];

  # NVIDIA
  hardware.graphics.enable = true;
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia = {
    modesetting.enable = true;
    open = true;
    nvidiaSettings = true;
    powerManagement.enable = false;
  };

  environment.sessionVariables = {
    NIXOS_OZONE_WL          = "1";
    GBM_BACKEND             = "nvidia-drm";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    NVD_BACKEND             = "direct";
    ELECTRON_OZONE_PLATFORM_HINT = "auto";
  };

  system.stateVersion = "25.11";
}
