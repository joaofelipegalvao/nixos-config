{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "joaofelipe";
  home.homeDirectory = "/home/joaofelipe";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "25.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # Ferramentas de desenvolvimento
    cargo
    nodejs_20
    ghq
    lua
    luaPackages.luarocks

    # Editores de texto
     emacs
     neovim
    
    # Nerd Fonts
    plemoljp-nf

    # Ferramentas do sistema
    bat
    eza
    fd
    ripgrep
    fzf
    zoxide
    jq
    ffmpeg
    p7zip
    poppler_utils
    imagemagick
    resvg

    lazygit
    yazi
    ghostty
    tmux


    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
      ".config/lazygit".source = config.lib.file.mkOutOfStoreSymlink "/home/joaofelipe/dotfiles-public/lazygit/.config/lazygit";
      ".gitconfig".source = config.lib.file.mkOutOfStoreSymlink "/home/joaofelipe/dotfiles-public/.gitconfig";
      ".config/nvim".source = config.lib.file.mkOutOfStoreSymlink "/home/joaofelipe/dotfiles-public/nvim/.config/nvim";
      ".config/yazi".source = config.lib.file.mkOutOfStoreSymlink "/home/joaofelipe/dotfiles-public/yazi/.config/yazi";
      ".config/fish".source = config.lib.file.mkOutOfStoreSymlink "/home/joaofelipe/dotfiles-public/fish/.config/fish";
      ".config/ghostty".source = config.lib.file.mkOutOfStoreSymlink "/home/joaofelipe/dotfiles-public/ghostty/.config/ghostty";
      ".config/tmux".source = config.lib.file.mkOutOfStoreSymlink "/home/joaofelipe/dotfiles-public/tmux/.config/tmux";

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  programs.ssh = {
  enable = true;
  addKeysToAgent = "yes";

  matchBlocks = {
    "github.com" = {
      user = "git";
      identityFile = "~/.ssh/id_ed25519";
    };
  };
};

services.ssh-agent.enable = true;

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/joaofelipe/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
