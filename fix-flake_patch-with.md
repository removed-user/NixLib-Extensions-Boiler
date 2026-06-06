# 3. EXPORT: Expose it so downstream flakes can consume it via flake-parts
### This goes outside of the `flake = {}; block`
- Instead it should be a toplevel element of the mkFlake function.
- Check repl results after edit.

      
`flakeModules.default = whateverYouNamedYourInlinedFunctionArg;`

   The  `flake = {}; block` is a section for standard non_flake-parts flakes. 
   Anything going in there wont merge using the flake-parts module systems.
