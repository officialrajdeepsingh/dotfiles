{
  pkgs ? import <nixpkgs> { },
}:

let
  mySoftware = pkgs.stdenv.mkDerivation {
    pname = "antigravity";
    version = "1.11.2";
    src = ./my-software-1.11.2.tar.gz; # Or fetch from a URL
    buildInputs = [ pkgs.someDependency ];
    # ... other build instructions ...
  };
in
pkgs.makeDebianPackage {
  name = "antigravity";
  version = mySoftware.version;
  buildInputs = [ mySoftware ]; # The built software as a dependency
  # ... other Debian packaging specific options ...
}
