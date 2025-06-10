{ pkgs, ... }: {
  home.packages = with pkgs; [
    # Desenvolvimento
    cargo
    nodejs_20
    ghq
    lua
    luaPackages.luarocks

    # Editores
    emacs
    neovim

    # Fontes
    plemoljp-nf

    # Ferramentas CLI
    bat
    eza
    fd
    ripgrep
    fzf
    zoxide
    jq
    lazygit
    lazydocker
    yazi
    tmux

    # Multimedia
    ffmpeg
    p7zip
    poppler_utils
    imagemagick
    resvg

    # Terminal
    ghostty
  ];
}
