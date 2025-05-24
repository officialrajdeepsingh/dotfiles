{
  description = "Zed Editor packaged with Nix Flakes";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        };

        # pull in required tools
        inherit (pkgs)
          lib
          stdenv
          rustPlatform
          fetchFromGitHub
          clang
          cmake
          copyDesktopItems
          curl
          perl
          pkg-config
          protobuf
          fontconfig
          freetype
          libgit2
          openssl
          sqlite
          zlib
          zstd
          alsa-lib
          libxkbcommon
          wayland
          libglvnd
          xorg
          makeFontsConf
          vulkan-loader
          envsubst
          gitUpdater
          cargo-about
          versionCheckHook
          buildFHSEnv
          cargo-bundle
          git
          apple-sdk_15
          darwinMinVersionHook
          makeWrapper
          nodejs_22
          ;

        zedSrc = fetchFromGitHub {
          owner = "zed-industries";
          repo = "zed";
          tag = "v0.161.2";
          hash = "sha256-UEqlOiB7oNQcrLViPrk9ZCg4uUDYhRXjq0cHp/wclYk=";
        };

        zed-editor = pkgs.callPackage ./zed-editor.nix {
          inherit
            rustPlatform
            clang
            cmake
            copyDesktopItems
            curl
            perl
            pkg-config
            protobuf
            fontconfig
            freetype
            libgit2
            openssl
            sqlite
            zlib
            zstd
            alsa-lib
            libxkbcommon
            wayland
            libglvnd
            xorg
            stdenv
            makeFontsConf
            vulkan-loader
            envsubst
            gitUpdater
            cargo-about
            versionCheckHook
            buildFHSEnv
            cargo-bundle
            git
            apple-sdk_15
            darwinMinVersionHook
            makeWrapper
            nodejs_22
            ;
          zed-editor = null; # will be passed in the FHS wrapper
        };
      in
      {
        packages.default = zed-editor;
        apps.default = flake-utils.lib.mkApp {
          drv = zed-editor;
        };
      }
    );
}
