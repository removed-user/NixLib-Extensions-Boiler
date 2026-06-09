### Using `deferredModule`

*   **Avoids Early Evaluation Errors:** If you pass a raw module containing configuration blocks (`{ config, pkgs, ... }: { ... }`) into a standard type, Nix evaluates it instantly. If the required variables (like `pkgs`) don't exist yet in the current flake environment, evaluation crashes.
*   **Preserves Merging and Priorities:** Nix allows multiple modules to define the same option, automatically merging them and sorting out weights like `lib.mkForce`. Using `deferredModule` ensures that all module blocks are cleanly grouped together untouched, allowing priorities and type-merging rules to resolve natively at the very end.
*   **Cross-System Portability:** It is the standard way to export entire NixOS, Home Manager, or generic framework configurations as customizable flake options.

---

### What Other Module Types Can You Set?

The Nix module system provides several choices depending on how strict you want to be and whether you want to pass parameters down.

#### 1. `lib.types.submodule`
*   **What it does:** Instantly evaluates a nested, isolated set of options and configuration values inside the current module environment.
*   **When to use it:** When creating complex structured data that needs strict schema validation right now (e.g., configuring an array of system users, where each user has a strict name, shell, and home directory).

#### 2. `lib.types.deferredModuleWith`
*   **What it does:** A specialized variant of `deferredModule` that allows you to pre-inject extra module arguments or define custom evaluation parameters ahead of time.
*   **When to use it:** When your exported raw modules depend on a specific global helper library or context variable that you must guarantee is available when downstream configurations evaluate it.

#### 3. `lib.types.raw`
*   **What it does:** Completely bypasses the type-checking and merging logic of the option system. It treats the configuration block as an unvalidated, raw Nix type.
*   **When to use it:** As a fallback when you want to pass a module function around without Nix attempting to inspect, validate, or merge it along the way.

#### 4. `lib.types.unspecified`
*   **What it does:** Tells Nix to accept absolutely anything (functions, attribute sets, lists) without running any validations or merge logic.
*   **When to use it:** Use sparingly for flexible parameters where you intentionally want to give consumers the freedom to pass raw primitives, functions, or unstructured structures.
