{
  description = "A collection of flake templates for adding your own lib functions";
  inputs = {
    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs-lib";
    };
    nixpkgs-lib.url = "github:nix-community/nixpkgs.lib";
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
        lib1 = import ./flakeModule.nix {inherit lib;}; # import a/the default flakeModule, and load lib from it
        #or
        lib2.define_monad = rec {
          whatsAMonad = whatsAMonad: ''A Monad is just a monoid in the category of endofunctors'';
          __functor = whatsAMonad;
        };
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
      */

      imports = [
        myCustomModule
      ];

      # Export your module for downstream consumers in global spec

      flakeModules.default = myCustomModule;

      # Use your injected library inside perSystem safely

      templates = {
        default = {
          path = ./templates/in_mkFlake;
          description = ''A minimal flake using flake-parts.'';
          in_mkFlake = {
            path = ./templates/in_mkFlake;
            description = ''A descriptive flake with features'';
          };
          pre_mkFlake = {
            path = ./templates/pre_mkFlake;
            description = ''A descriptive flake with features'';
          };
          flake-parts = {
            path = ./templates/flake-parts;
            description = ''A descriptive flake with features'';
          };
        };
      };

      perSystem = {
        Mylib,
        lib,
        ...
      }: {
        options.Mylib = lib.types.lazyAttrsOf lib.types.submodules;
        config = {
           
        };
      };
      flake = {};
    };
}
