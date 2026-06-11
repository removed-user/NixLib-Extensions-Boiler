# Using Flake-Parts Expert Guide

This skill is a comprehensive guide for structuring and modularizing Nix flake configurations using flake-parts.

## File Structure

This skill consists of the following files:

- **[Generic.md](./Generic.md)** - Main skill definition and basic usage
- **[Module_Organization.md](./Module_Organization.md)** - Detailed explanation of module arguments
- **[module_organization.md](./modular-organization.md)** - Best practices for modular organization
- **[Overlays.md](./Overlays.md)** - How to use the easyOverlay module
- **[Advanced.md](./Advanced.md)** - Advanced features including partitions, custom outputs, and debugging

## Overview

flake-parts is a framework for modularly organizing Nix flakes. This skill covers the following topics:

### Key Topics

1. **Basic Concepts** - mkFlake structure, perSystem vs flake sections
2. **Module Arguments** - pkgs, system, inputs', self', config, final, withSystem, getSystem
3. **Module Organization** - Import patterns, importApply, reusable modules
4. **Overlays** - Automatic overlay generation using easyOverlay
5. **Advanced Features** - Partitions, custom outputs, debug mode
6. **Best Practices** - Recommended patterns and anti-patterns to avoid

## Usage

Please refer to the corresponding Markdown files for detailed information on each topic.

### Recommended Reading Order
1. [Generic.md](./Generic.md) - Basic concepts and big picture
2. [Module_Arguments.md](./Module_Arguments.md) - Understanding the module system
3. [Module_Organization.md](./Module_Organization.md) - Learning configuration patterns
4. [Overlays.md](./Overlays.md) - How to create overlays
5. [Advanced.md](./Advanced.md) - Advanced features and troubleshooting
