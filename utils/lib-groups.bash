#!/bin/bash
nix eval --json .#inputs.nixpkgs.lib --apply 'lib: builtins.filter (name: builtins.isAttrs lib.${name}) (builtins.attrNames lib)' | jq .[]
