#!/bin/env basH
#Print Raw Lambda
function parsenix(){
	local	ARGS="($@)"
	local	FILE="$1"
	local ARGS=(ARGS[@]:1)
nix-instantiate --parse "${FILE}"
}
