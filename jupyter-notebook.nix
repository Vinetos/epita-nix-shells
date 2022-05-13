with import <nixpkgs> {};

mkShell {
  buildInputs = [
    # Defines a python + set of packages.
    (python3.withPackages (ps: with ps; with python3Packages; [
      jupyter
      ipython

      # Python packages
      numpy
      matplotlib
      scikitimage
      scipy
    ]))
  ];

  # Automatically run jupyter when entering the shell.
  shellHook = "jupyter notebook";
}
