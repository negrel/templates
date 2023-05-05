{
  outputs = { self, nixpkgs }: {
    templates =
      let commonEnvVars = {
        # OPTION_NAME = DEFAULT_VALUE
        PROJECT_NAME = "";
        DESCRIPTION = "";
        LONG_DESCRIPTION = "";
      };
      in
      rec {
        default = {
          path = ./flake;
          description = "A simple Nix flake";
          envVars = commonEnvVars;
        };
        deno = {
          path = ./deno;
          description = "A simple Deno project";
          envVars = commonEnvVars // {
            DENO_STDLIB_VERSION = "0.186.0";
          };
        };
        flake = default;
        k6 = {
          path = ./k6;
          description = "A ready to use k6 setup";
          envVars = commonEnvVars // {
            K6_VERSION = "latest";
          };
        };
        rust = {
          path = ./rust;
          description = "A simple Rust project";
          envVars = commonEnvVars //
            {
              # Package name in Cargo.toml
              PKG = "rust";
              # Rust edition entry in Cargo.toml
              EDITION = 2021;
            };
        };
      };
  };
}
