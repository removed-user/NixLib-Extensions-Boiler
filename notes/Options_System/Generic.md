# Custom Nix Options Best Practices

Best practices for designing custom Nix options revolve around **strict type safety, semantic modularity, and avoiding global namespace pollution**. Following these structural guidelines ensures your configuration remains declarative, maintainable, and predictable across different machines.

### Standard Module Anatomy
Always separate your module into explicit `options` declarations and `config` definitions using conditional wrappers like `lib.mkIf`.

```nix
{ config, lib, pkgs, ... }:
let
  cfg = config.services.myCustomService;
in {
  options.services.myCustomService = {
    enable = lib.mkEnableOption "My Custom Service";
    
    port = lib.mkOption {
      type = lib.types.port;
      default = 8080;
      description = "The port to listen on.";
    };
  };

  config = lib.mkIf cfg.enable {
    systemd.services.myCustomService = {
      description = "Custom service daemon";
      wantedBy = [ "multi-user.target" ];
      serviceConfig.ExecStart = "pkgs.myPackage/bin/daemon --port {toString cfg.port}";
    };
  };
}
```

### Option Declaration Best Practices
* **Always Define Types**: Never omit the `type` attribute from `mkOption`. Use specific primitives like `lib.types.port`, `lib.types.path`, or `lib.types.bool` instead of loose types like `lib.types.str` to catch syntax or logical errors at evaluation time.
* **Leverage `mkEnableOption`**: Use `lib.mkEnableOption "name"` for standard booleans. It automatically formats a clean, standardized description, removing boilerplate string creation.
* **Scope with Namespaces**: Scope custom options inside logical sub-attributes. If you are configuring a custom project, create a single root namespace (e.g., `options.myOrg.tools.git`) to prevent name collisions with standard NixOS or Home Manager settings.
* **Prefer `mkPackageOption`**: Avoid using string fields or hardcoded paths for package references. Use `lib.mkPackageOption pkgs "name" { default = [ "packageName" ]; }` to allow users to override the base package with an overlay or custom compilation flags cleanly.

### Value Assignment Best Practices
* **Use `mkMerge` for Clear Conditionals**: Avoid writing deep, nested `if-then-else` blocks inside attribute sets. Instead, structure your modules with an explicit `config = lib.mkMerge [ ... ]` block to keep multiple configuration sources flat and legible.
* **Avoid the `with` Scope**: Refrain from putting `with lib;` or `with pkgs;` at the absolute top of module files. Scoping functions broadly can hide variable name shadowing and cause unintended evaluation bugs. Use localized `let ... inherit ... in` blocks instead.
* **Abstract Internal Variables**: Create a localized shorthand string (such as `cfg = config.services.myCustomService;`) inside a `let` block. This reduces text length, shortens lookup structures, and increases readability.
