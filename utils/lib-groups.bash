#!/bin/bash
nix eval --json nixpkgs#lib --apply 'lib: builtins.filter (name: builtins.isAttrs lib.${name}) (builtins.attrNames lib)' | jq .[]
