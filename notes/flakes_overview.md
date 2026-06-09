# Intro: Hoping to become the Q/A you wished nix had?
## With the tips, tricks, notes and various Gotcha's...
#### that everyone expects you to know without ever telling you.

## Prelude
- Using the defacto standard library... that is, nixpkgs-lib + flake-parts
- Opinionated: minimal dependencies, inputs and bloat; always apply logic first.
- When you make/setup custom functions... always try to make it as reusable as is reasonable.
 
## Basics
### sections of a flake
#### Inputs 
#### flake 



### flake = {}
The  `flake = {}; block` is a section for standard **non_flake-parts** flake attributes. 
Anything going in there - won't merge using the flake-parts module systems.
