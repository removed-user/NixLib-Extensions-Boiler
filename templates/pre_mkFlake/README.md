{
  description = "Description for the project";
  inputs = {
    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs-lib";
    };
    nixpkgs-lib.url = "nix-community/nixpkgs.lib";
  };

  outputs = inputs @ {
    nixpkgs-lib,
    flake-parts,
    ...
  }:
  /*

    # 1. Keep your definitions flat and visible at the very top
    - Should Produce `Mylib.lib`.
    - A module argument you can pass around like lib, flake-parts-lib, etc.
    - Importable by users as seen below through
    *imports = [${yourFlakeName}.myCustomModule];*

  */
  let
    myCustomModule = {lib, ...}: {
      _module.args.Mylib = {
        lib = import ./flakeModule.nix {inherit lib;};
      };
    };
  in
    /*
    # 2. You "may" want to define a system type if necessary.
       -  For pure nix-lib outputs, it's not required, and **can cause** issues for consumers.
        - If you're not exporting custom packages/modules/overlays, then you probably don't actually need it
    */
    flake-parts.lib.mkFlake {inherit inputs;} {
      #  systems = [ "x86_64-linux" ];

      /*
     # Safely Dogfood "use" your module internally; (for testing);
      >  please don't use overrides in-order to use your lib in your lib
      -  Without polluting consumers inputs
      -  adding recursion problems or
      -  copying your lib to the store more than once
      /*
            imports = [
              myCustomModule
            ];

            # Export your module for downstream consumers in global spec
            flakeModules.default = myCustomModule;

            # Use your injected library inside perSystem safely

            perSystem = {
              Mylib,
              ...
            }: {
            };
            flake = {
    };
}
