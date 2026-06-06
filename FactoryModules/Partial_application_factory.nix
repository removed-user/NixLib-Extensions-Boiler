### unfinished partial application of a functionTo "import functionFile.nix {inherit lib;}"
#### with the idea being to reduce boilerplate by adding this function to a seperate lib.

#### importable through flake, so that a reusable-module author can call the function on their flakeModules... 
#### literally remove nixpkgs as input, and have it be supplied by the consuming flake.



let
tempArg = StorePath: import StorePath;
  Mylib = { lib, ... }: {
    _module.args.Mylib = tempArg { inherit lib; };
      # The Factory: Takes a flake input and an optional custom name
      MyLib.mkAutoLoader = { 
        flakeInput,               # The downstream user passes 'inputs.some-flake'
        modulePath ? "./flakeModule.nix", # Default file to look for inside that flake
        argName ? "Mylib"         # Default name injected into _module.args
      }: 
      # Returns the exact partially-applied module function type
      { lib, ... }: {
        _module.args.${argName} = import "${flakeInput}/${modulePath}" { inherit lib; };
    };
  };
in
{
  imports = [ MyLib ];
}
