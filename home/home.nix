{ config, pkgs, ... }: {
  imports = [
    ./packages.nix
    ./programs.nix
    ./dotfiles.nix
    ./services.nix
  ];

  home = {
    username = "joaofelipe";
    homeDirectory = "/home/joaofelipe";
    stateVersion = "25.05";
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.home-manager.enable = true;
}
