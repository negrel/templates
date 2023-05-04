# My personal Nix templates

This repository contains a list of Nix [flakes templates](https://nixos.org/manual/nix/unstable/command-ref/new-cli/nix3-flake-init.html#template-definitions)
that you can use with [`scratch`](https://github.com/negrel/scratch): a tool to quickly scracth a new project.

## Why ?

[NixOS templates](https://github.com/NixOS/templates/) are great but too simple.
They don't have:
- templating options,
- nightly `rust` template
- [`deno`](https://deno.land) template
- ...

## Getting started

Templates of this repository are designed to work with [`scratch`](https://github.com/negrel/scratch),
they won't work with `nix flake init`.

Files contains environment variables (e.g `$VAR`) that makes them unusable before substitution (with `envsubst` for example).

### Configuration

Each templates define its own set of environment variables under the `envVars` attribute. Options are document in [`flake.nix`](flake.nix)

## :stars: Show your support

Please give a :star: if this project helped you!

## :scroll: License

MIT © [Alexandre Negrel](https://www.negrel.dev/)
