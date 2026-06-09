1.)
#### locally defined "modules"
This is the simplest of the 3 ways to write module, it's also not a module, unlike flake modules
  Which are... also not modules, in the traditional sense.
```nix
import ./module.nix
```
2.)

#### Flake Modules
`outputs.flakeModules`
Referred to under one of the attrsets...
- `flake.flakeModules`
- `options.flake.flakeModules`
- `options.flake.flakeModule` ~=~ `options.flake.flakeModules.default`
- `flake.flakeModule` ~=~ `flake.flakeModules.default`
3.)

#### Standard Modules
- `outputs.modules`
Generally referred to like the above flakeModules
I think each of these are technically valid... But verbose and error out with some tools.
- `options.flake.modules`
- `flake.modules`
- `options.modules`
So, instead you may want to just refer to them as modules
Just like below... cause -

4.)
#### There are also inlined sections, creatively named... modules.
```nix
  let
    myCustomModule = {lib, ...}: {
    };
  in
    flake-parts.lib.mkFlake {...}
    ```

5.)

#### Your modules can have modules
`outputs.submodules`

So, with the first three down?...

### Don't worry about these too much "HEAVY SARCASM" they're **pretty simple**
Simple enough that...
- No one explains them properly.
- Explanations you do find... **Will** give you conflicting information.
- Every one of them requires you to write it a little bit differently.
- Otherwise they're all pretty much the same
    - Except for *also* being evaluated completely differently
    - Merging differently - and 
    - Having different levels of type checking, if they have any at all, **based the eval context**.

- So, if you get them mixed up... *dont worry*, because at worst, it'll give you 250 lines of gibberish, that tells you absolutely nothing about the problem.

### Now, all of that said
If modules are still confusing, a bit of advice is...

That you don't mess up, cause if you do - Others will act like you're stupid if you ask about modules.
Since "They're really not that complicated"

I think technically I'm missing atleast 2 other things that are referred to as modules in nix. 
Except for obviously, the other 3 main ones, which also... each work completely differently
Those being
- *NixOS*
- *Home_Manager* and 
- *darwin* modules if you're familiar with those)

> (If you're *not* familiar with NixOS, it's The worst thing about nix. Just wait and see "how proud" everyone angry about this comment is, as one reason why.)
> Either way it's out of scope, for this "tutorial"

If you have messed up a module, and you ask for help, try to ask for help about the right module type?...

Even though you probably won't know which one it is?

If you ask without knowing - which one you're asking about?
You'll get genuinely usefull information that would work perfectly, if you didn't have the code that you have right now.
Otherwise it'll wipe your hard drive.

If you do wipe your hard drive, we'll create a new feature, to solve that problem for you too, and call it the module.


- and its probably not even your code that's the problem, just look at one of the 35 different transitive dependencies being imported 

Thats was it, I hope you enjoyed this description on the 7 types of basic modules. 
Maybe later I'll describe the other 3 that I remember... and - I'm pretty sure I missed 1 or two
So if you find anything else called a **module**, please make a PR, and I'll put it in the list.

Also we still don't have monads. 
What's that? 

It's something nixOS people love to joke about because its a functional programming term, and they like to pretend we have them, but atleast we have... `lib.haskellPathsInDir`.

Which definitely doesn't need better scoping or - to be a strategy pattern or anything. 

I'd make a PR but there's 10,598 something rn, since we have one repo...
and it's not a new NixOS option that exposes half the compile time options of a package while renaming them.
