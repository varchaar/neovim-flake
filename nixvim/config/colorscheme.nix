{pkgs, ...}: {
  colorschemes.kanagawa = {
    enable = true;
  };
  # extraPlugins = [
  #   pkgs.neovimPlugins.night-owl-nvim
  # ];
  # extraConfigLua = ''
  #   vim.cmd.colorscheme("night-owl")
  # '';
}
