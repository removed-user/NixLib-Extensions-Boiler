#!/bin/bash
nix eval --json nixpkgs#lib --apply '
  lib:
  let
    # 1. Get all the group names (sub-attribute sets) inside lib
    allNames = builtins.attrNames lib;
    groups = builtins.filter (name: builtins.isAttrs lib.${name}) allNames;
    
    # 2. For a given group name, find all keys that hold a function
    functionsInGroup = groupName:
      let
        groupAttrs = lib.${groupName};
        allKeys = builtins.attrNames groupAttrs;
      in
        builtins.filter (key: builtins.isFunction groupAttrs.${key}) allKeys;
        
    # 3. Zip the group names into an attribute set with their functions
    resultList = builtins.map (name: { name = name; value = functionsInGroup name; }) groups;
  in
    builtins.listToAttrs resultList
' | jq .
