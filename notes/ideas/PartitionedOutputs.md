creating a flakeModule that -
creates partitionedAttrs, when the user "ingests" it

The Idea is to make it relatively easy to define different modules where -
One may/can/is-allowed to depend on a different modules evaluation
As things are now, all flake-parts evaluation takes place under one cycle
Seperating evaluation into labeled...
Individually evaluated partitions would allow for much easier/cleaner logic
You could use a function to iterate over attrs, which rely on a config element... to use for imports with no risk of recursion
and much more...

This works as long as we set options around each defined element, default it to null, and always have our strict ordering...
An exact ordering can be defined... and then
we create seperate evalModules

In that way, we can define seperate evaluation contexts as a function itself, where we can use the result however we like in later stages.

