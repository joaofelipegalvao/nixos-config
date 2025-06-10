{ config, pkgs, ... }: {
  imports = [ ./hardware-configuration.nix ];

  # Nix settings
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Boot
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  # Network
  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
    firewall.allowedTCPPorts = [ 22 ];
  };

  # Locale
  time.timeZone = "America/Sao_Paulo";
  i18n = {
    defaultLocale = "pt_BR.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "pt_BR.UTF-8";
      LC_IDENTIFICATION = "pt_BR.UTF-8";
      LC_MEASUREMENT = "pt_BR.UTF-8";
      LC_MONETARY = "pt_BR.UTF-8";
      LC_NAME = "pt_BR.UTF-8";
      LC_NUMERIC = "pt_BR.UTF-8";
      LC_PAPER = "pt_BR.UTF-8";
      LC_TELEPHONE = "pt_BR.UTF-8";
      LC_TIME = "pt_BR.UTF-8";
    };
  };

  # Desktop Environment
  services = {
    xserver = {
      enable = true;
      xkb = {
        layout = "br";
        variant = "thinkpad";
      };
    };
    displayManager.sddm.enable = true;
    desktopManager.plasma6.enable = true;
    printing.enable = true;
  };

  # Audio
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Console
  console.keyMap = "br-abnt2";

  # Users
  users.users.joaofelipe = {
    isNormalUser = true;
    description = "João Felipe";
    extraGroups = [ "networkmanager" "wheel" "docker" ]; # Adicionado docker
    shell = pkgs.fish;
    packages = with pkgs; [
      kdePackages.kate
    ];
  };

  # Programs
  programs = {
    firefox.enable = true;
    fish.enable = true;
  };

  # Docker
  virtualisation.docker = {
    enable = true;
    enableOnBoot = true;
  };

  # System packages (apenas essenciais do sistema)
  environment.systemPackages = with pkgs; [
    vim
    wget
    curl
    git # Manter no sistema para operações de root
    tree
    htop
    gcc
    unzip
    xclip
  ];

  # SSH
  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = false;
      PermitRootLogin = "no";
      AllowUsers = [ "joaofelipe" ];
      UseDns = false;
      X11Forwarding = false;
      PermitEmptyPasswords = false;
      AllowTcpForwarding = "no";
    };
  };

  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "25.05";
}
