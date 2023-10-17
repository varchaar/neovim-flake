{pkgs, ...}: {
  colorschemes.kanagawa = {
    enable = true;
  };
  # extraPlugins = with pkgs.vimPlugins; [
  #   chameleon-nvim
  # ];
  # extraConfigLua = ''
  #   require("chameleon").setup()
  # '';
}
