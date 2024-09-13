# ByeDPI Nix Flake

This is a Nix flake that builds [ByeDPI](https://github.com/hufrea/byedpi).

## Example Usage for flake:

```nix
inputs.byedpi = {
    url = "github:ch4og/byedpi-flake";
    inputs.nixpkgs.follows = "nixpkgs";
};
```

And you will be able to use package `inputs.byedpi.packages.x86_64-linux.byedpi`
in your Nix expression.

### Please note that executable name is `ciadpi` and not `byedpi`.
