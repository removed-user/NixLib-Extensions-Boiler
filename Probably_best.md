lib.types.deferredModuleWith
submoduleWith

### SubModule Type

| Feature | `lib.types.submodule` | `lib.types.submoduleWith` |
| :--- | :--- | :--- |
| **Argument Passing** | Inline modules only | Explicit via `specialArgs` |
| **Module Inputs** | Accepts a list of modules or functions | Accepts a structured configuration attribute set |
| **Flexibility** | Rigid, harder to pass flake-level scope | Designed specifically for dynamic runtime module generation |

### Defferrence Type


| Feature | `lib.types.deferredModule` | `lib.types.deferredModuleWith` |
| :--- | :--- | :--- |
| **Primary Use Case** | Accepting a standard, un-evaluated Nix module or path as a raw value. | Pre-injecting specific baseline modules or constraints into the deferred type signature. |
| **Argument Structure** | Simple type string alias with no configuration arguments. | A function accepting an attribute set (e.g., `{ staticModules = [ ... ]; }`). |
| **Static Modules Injection** | Cannot append base modules directly to the type definition. | Explicitly allows forcing `staticModules` to merge with whatever the user supplies. |
| **Downstream Behavior** | The user's input module passes through cleanly into the final custom evaluator. | The user's input module automatically merges with the underlying `staticModules` array. |

