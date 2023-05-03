{
  outputs = { self, nixpkgs }: {
    templates = {
      rust = {
        path = ./rust;
        description = "A simple Rust project";
        welcomeText = ''
          Options:
          - PKG: Cargo package name
          - EDITION: Rust edition
        '';
      };
    };
  };
}
