args:

let
  inherit (args)
    lib
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

  withGLES = false;

  executableName = "zeditor";

  fhs =
    {
      additionalPkgs ? pkgs: [ ],
    }:
    buildFHSEnv {
      name = executableName;
      targetPkgs = pkgs: [ pkgs.glibc ] ++ additionalPkgs pkgs;
      extraInstallCommands = ''
        ln -s "${self}" "$out/"
      '';
      runScript = "${self}/bin/${executableName}";
      passthru = {
        inherit executableName;
        inherit (self) pname version;
      };
      meta = self.meta // {
        description = ''
          Wrapped variant of ${self.pname} for FHS compatibility.
        '';
      };
    };

  self = rustPlatform.buildRustPackage rec {
    # --- YOUR ORIGINAL CODE GOES HERE ---
    pname = "zed-editor";
    version = "0.161.2";
    src = zedSrc;
    # and so on...
  };
in
self
