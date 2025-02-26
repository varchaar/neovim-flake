{
  imports = [
    ./plugins
  ];
  config.vim = {
    theme = {
      enable = true;
      name = "catppuccin";
      style = "mocha";
    };
    globals = {
      mapleader = " ";
      editorconfig = true;
    };
  };
}
