{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Languages & Runtimes
    go
    bun
    nodejs_24
    nodePackages.npm
    python313
    python313Packages.pip

    # Compilers & Build tools
    rustc
    cargo
    clang
    cmake
    meson
    ninja
    pkg-config
    zig

    # Lua
    lua
    luajit
    luajitPackages.luarocks-nix
    lua53Packages.luarocks
  ];
}
