{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nvf.url = "github:notashelf/nvf";
  };

  outputs = { nixpkgs, nvf, ... } @ inputs: {
    packages.x86_64-linux = {
      # Set the default package to the wrapped instance of Neovim.
      # This will allow running your Neovim configuration with
      # `nix run` and in addition, sharing your configuration with
      # other users in case your repository is public.
      default =
        (nvf.lib.neovimConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-linux;
          modules = [
            (import ./config)
          ];
        }).neovim;
    };
  };
}
