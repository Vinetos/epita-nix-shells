with import <nixpkgs> {};
stdenv.mkDerivation rec {
  name = "ng";
  env = buildEnv { name = name; paths = buildInputs; };
  buildInputs = [
    nodejs-12_x
    yarn
    nodePackages."@angular/cli"
  ];
}
