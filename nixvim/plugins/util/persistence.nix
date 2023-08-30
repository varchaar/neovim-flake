{...}: let
  persistence = pkgs.vimUtils.buildVimPlugin {
    name = "persistence.nvim";
    src = pkgs.fetchFromGitHub {
      owner = "folke";
      repo = "persistence.nvim";
      rev = "4b8051c01f696d8849a5cb8afa9767be8db16e40";
      sha256 = "";
    };
  };
in {
}
