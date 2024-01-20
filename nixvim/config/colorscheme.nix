{pkgs, ...}: {
  colorschemes.kanagawa = {
    enable = true;
  };
  # extraPlugins = with pkgs.vimPlugins; [
  #   night-owl-nvim
  # ];
  # extraConfigLua = ''
  #   vim.cmd.colorscheme("night-owl")
  # '';
}
