{ config, ... }: 
let
  dotfilesPath = "/home/joaofelipe/dotfiles-public";
  mkDotfile = path: config.lib.file.mkOutOfStoreSymlink "${dotfilesPath}/${path}";
in {
  home.file = {
    ".config/lazygit".source = mkDotfile "lazygit/.config/lazygit";
    ".gitconfig".source = mkDotfile ".gitconfig";
    ".config/nvim".source = mkDotfile "nvim/.config/nvim";
    ".config/yazi".source = mkDotfile "yazi/.config/yazi";
    ".config/fish".source = mkDotfile "fish/.config/fish";
    ".config/ghostty".source = mkDotfile "ghostty/.config/ghostty";
    ".config/tmux".source = mkDotfile "tmux/.config/tmux";
  };
}
