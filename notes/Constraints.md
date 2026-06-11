# Constraints

#### Constraints help with the empty template to a point
> The problem in creating reusable nix modules is in artificial constraints, where half the options are highly-popular footguns for either you or the consumer.

> This leaves you feeling that you don't know where to begin, because - when good examples of the only valid patterns are hard to find.

> You have 35 constraints of "not this pattern", that's too many to consider, and so now you effectively have NO constraints.

- By excluding usage of nixos, darwin, home-manager, or other specialized modules, we have the most bare-bones module evaluation system, with the least assumptions. 

- In concisely pointing out every failures in the language, or in common patterns - we can Identify exactly where we have to use a different pattern;

Then implement the "correct" replacement pattern, or even simplify it through a flakeModule, and provide that solution as a universally applicable template.

This creates the **Ultimate** boiler. 

A flake that simply abstracts good practices in module writing - can simplify much of the nix code we find out there, possibly making it easier to factor out functions, and interact with the module system, lower evaluation times, etc. 
