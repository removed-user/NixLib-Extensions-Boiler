# Not always - but generally -
The more inputs you add - 
the farther you get from "pure-lib" nix-code. 

Any inputs added might export their own 
- apps
- devshells
- packages
- formatter...

## Or any number - of any other things... which - 
End up requesting a pkgs argument, or instance... 

If it just did that, and had a safe failure condition... 
For example: Not failing to function entirely, without the formatter.
That'd be fine. 

In some cases I've seen nix code -
Which directly imports and defines pkgs itself, if it's undefined. 

Which it does in a fix-point function... in order to use a self-referencing recursive function to return an attrset.

It's like nix users aren't happy unless they can introduce some unexpected behaviour somewhere in their otherwise usefull tool.

### "Opinionated" suggestions

- pkgs should **ALWAYS** default to null if not set by a user.

- Inputs should be labeled based on their source... 

- Module spam is generally not the answer.

- Neither is an infinitely curried 12 step-program. 

This is code **not an intervention**... but maybe it should be one? 
