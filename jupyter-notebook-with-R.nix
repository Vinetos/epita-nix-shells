{ pkgs ? import <nixpkgs> {} }:
let
  jupyter = import (pkgs.fetchFromGitHub {
    owner = "tweag";
    repo = "jupyterWith";
    # Replace this with current revision.
    rev = "2b10030df2a29beed10c02d5f64745b143206350";
    sha256 = "Yv52KWTmgzCb59sYcLc4bEn7LwZWI9E+EPgXzJiej64=";
    fetchSubmodules = true;
  }) {};

  kernels = jupyter.kernels;

  irkernel = kernels.iRWith {
      name = "nixpkgs";
      # Libraries to be available to the kernel.
      packages = p: with p; [
        ggplot2
        dplyr
        cowplot
        car
        lubridate
        corrplot
        psych
      ];
    };

  jupyterEnvironment = (jupyter.jupyterlabWith {
      kernels = [ irkernel ];
    });
in
  jupyterEnvironment.env
