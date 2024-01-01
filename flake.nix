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
        bun = {
          path = ./bun;
          description = "A simple bun project";
          envVars = commonEnvVars // {
            PKG = "beta";
          };
        };
        c-bin = {
          path = ./c-bin;
          description = "A simple C project";
          envVars = commonEnvVars;
        };

        default = {
          path = ./flake;
          description = "A simple Nix flake";
          envVars = commonEnvVars;
        };
        deno = {
          path = ./deno;
          description = "A simple Deno project";
          envVars = commonEnvVars // {
            DENO_STDLIB_VERSION = "0.210.0";
          };
        };
        flake = default;
        go = {
          path = ./go;
          description = "A simple Go project";
          envVars = commonEnvVars // {
            MOD = "beta";
          };
        };
        k6 = {
          path = ./k6;
          description = "A ready to use k6 setup";
          envVars = commonEnvVars // {
            K6_VERSION = "latest";
          };
        };
        node = {
          path = ./node;
          description = "A simple Node.js projet";
          envVars = commonEnvVars // {
            PKG = "beta";
          };
        };
        python = {
          path = ./python;
          description = "A simple Python project";
          envVars = commonEnvVars;
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
              # Rust analyzer
              RUST_ANALYZER = "rust-analyzer";
              # Toolchain
              TOOLCHAIN = "stable";
            };
        };
      };
  };
}
