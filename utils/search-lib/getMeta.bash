#!/bin/bash
nix eval --json nixpkgs#lib --apply '
  lib:
  let
    group = lib.meta; # Change this to any group like lib.strings, lib.lists, etc.
    names = builtins.attrNames group;
  in
    builtins.listToAttrs (builtins.map (name: {
      name = name;
      value = {
        type = builtins.typeOf group.${name};
        args = if builtins.isFunction group.${name} 
               then builtins.functionArgs group.${name} 
               else null;
      };
    }) names)
' | jq .
