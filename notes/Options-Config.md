Depending on how you think... you might assume - 
If config can, and often is - also be used for setting static, internal data which should be read-only... 

That you could set the config for an item - directly to the type it should be, "like  `lib.types.submodule`"; to get type checking on the static component, without declaring the non-optional value, as an option...

then set/open an options block for things under that, to define options, for the parts of the options spec, which are actually options... **No**.

You can't set type checking, or metadata for a static configuration item inside the config block. 

This means for a static definition... you have to declare the option, then in some way make it "read only" or invisible, and then - you can set it to a value, in the config block.

> I understood function factories and constructors, before that made sense to me... 

Because "no one said that part" and some of the first examples I saw, were of an options schema... that took functions as input, so they had "lib elements" under config, which left me confused for months, while I worked on something else.

back to the point - In the module system, you have to separate the *declaration* from the *definition*:

Which - to immediately diverge from the point again... 
Because I'm annoyed by the, semantics here... 

The terms for these - are another thing that may seem backwards - depending on your background...

If your background includes - a rudimentary understanding of fucking English.

You may - **Logically**... think based on these **definitions** before you?...
1.
Definition: "A statement"... of *the meaning of a word, or word group or a sign or symbol*

2.
Declare: To make known as a determination

A declaration you can enunciate?... or the determination you can come to on the usage of the words in the nix language... 

Is that... it's **FUCKING BACKWARDS?!**

Because you make known as a determination... something about an item without knowing its definition... 

Which actually explains a lot of the code I've seen.

These are something that also is backwards.

Declare the item, its type, and its metadata (description, default value) inside the options block using

`lib.mkOption.`

Then you can also assign the *"actual data"/values* to that item inside the config block.

If you try to declare types inside config, the interpreter will treat **that type info itself** as the **literal value**, to an option...  *which doesn't exist*  - and... that causes evaluation errors.
