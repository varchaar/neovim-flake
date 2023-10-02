{pkgs, ...}: let
  chameleon-nvim = pkgs.vimUtils.buildVimPlugin {
    name = "chameleon.nvim";
    src = pkgs.fetchFromGitHub {
      owner = "shaun-mathew";
      repo = "Chameleon.nvim";
      rev = "793b95c9719695c69b80823d5ecff3cfc26091f0";
      sha256 = "qk1WKHjVjOriHtv9SeTt3etAept1DRFIzVA1Li15De8=";
    };
  };
in {
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
