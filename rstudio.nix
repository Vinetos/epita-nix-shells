with pkgs;
let
  RStudio-with-packages = rstudioWrapper.override{ 
      packages = with rPackages; [ 
          ggplot2 
          dplyr 
          cowplot 
      ]; 
  };
in
  mkShell {
    buildInputs = [
      RStudio-with-packages
    ];

    # Automatically run rstudio when entering the shell.
    shellHook = "rstudio";
}
