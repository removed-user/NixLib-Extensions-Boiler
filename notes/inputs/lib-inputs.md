## If Possible you should use nixpkgs-lib instead of nixpkgs.
```nix
inputs = {
nixpkgs-lib.url = "nix-community/nixpkgs.lib"
};
```
## Tangent: Benefits are
   - An improved loading time for your lib
    - Faster flake updates;                                       "for you and anyone using your flake"
   - Less evaluation overhead in overrides for consumers
   - Reduced risk of, and effect of recursion errors in your lib, "caused by it or not"
    - Otherwise generally improved scoping.
     - If you're exporting "pure-lib" functions, there's **no reason not to**
    - **You should do it, if you can, I'm biased for good reason.**
