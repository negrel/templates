{
  outputs = { self, nixpkgs }: {
    templates = rec {
      default = {
        path = ./flake;
        description = "A simple Nix flake";
      };
      flake = default;
      rust = {
        path = ./rust;
        description = "A simple Rust project";
        envVars = {
          PKG = "rust";
          EDITION = 2021;
        };
      };
    };
  };
}
