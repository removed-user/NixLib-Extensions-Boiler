{ self, nixpkgs, flake-parts, ... }@inputs:
flake-parts.lib.mkFlake { inherit inputs; } {
  systems = [ "x86_64-linux" "aarch64-darwin" ];

  # 1. Define your module logic as a local variable
  let
    myCustomModule = { lib, ... }: { 
      _module.args.Mylib = {           
        lib = import ./flakeModule.nix { inherit lib; }; 
      };
    };
  in {
    # 2. DOGFOOD: Import it so it runs inside this flake right now
    imports = [ 
      myCustomModule 
    ];

    # 3. EXPORT: Expose it to downstream consumers under flakeModules.default
    flakeModules.default = myCustomModule;

    # 4. USE IT: Your Mylib injection is now fully operational here
    perSystem = { config, pkgs, Mylib, ... }: {
      # You can safely destructure 'Mylib' right here!
      devShells.default = pkgs.mkShell {
        # example usage of a function from your injected lib
        shellHook = ''
          echo "Internal library loaded successfully!"
        '';
      };
    };
  };
}
