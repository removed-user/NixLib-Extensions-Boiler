Use lazyAttrsOf **submodule** if you want a **namespace** where downstream users can type
`myNamespace.anyCustomKey.someProperty = ...`
without you defining `anyCustomKey` ahead of time.

```nix
options = {
  myNamespace = lib.mkOption {
    description = "A dynamic namespace that accepts any arbitrary top-level keys.";
    default = {};
    type = lib.types.lazyAttrsOf (lib.types.submodule {
      options = {
        # Properties that EVERY nested key will have
        enabled = lib.mkOption {
          type = lib.types.bool;
          default = true;
        };
      };
    }));
  };
};

# config = {}; // Leave empty, it starts as an empty set {}

```
