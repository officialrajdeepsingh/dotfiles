# Error List

I listed errors I faced during the nixos build, and if I found the solution, I wrote it.

## error 1 : getting status of '/nix/store/vhpd82wbms2ndg9gfizq2krfiap468mi-source/services/default.nix': No such file or directory

```bash
warning: Git tree '/home/officialrajdeepsingh/nixos-config' is dirty
error:
       … while calling the 'seq' builtin

         at /nix/store/zaza7mgggz4m5h6z18kajabf4wciaj47-source/lib/modules.nix:322:18:

          321|         options = checked options;
          322|         config = checked (removeAttrs config [ "_module" ]);
             |                  ^
          323|         _module = checked (config._module);

       … while evaluating a branch condition

         at /nix/store/zaza7mgggz4m5h6z18kajabf4wciaj47-source/lib/modules.nix:261:9:

          260|       checkUnmatched =
          261|         if config._module.check && config._module.freeformType == null && merged.unmatchedDefns != [] then
             |         ^
          262|           let

       (stack trace truncated; use '--show-trace' to show the full trace)

       error: getting status of '/nix/store/vhpd82wbms2ndg9gfizq2krfiap468mi-source/services/default.nix': No such file or directory
```

## Soluation 1

Just track your `default.nix` file with git

## error 2 : infinite recursion encountered

```bash
error:
       … while evaluating the attribute 'activationPackage'

         at /home/officialrajdeepsingh/.nix-defexpr/channels/home-manager/modules/default.nix:54:3:

           53|
           54|   activationPackage = module.config.home.activationPackage;
             |   ^
           55|

       … while evaluating a branch condition

         at /nix/store/zaza7mgggz4m5h6z18kajabf4wciaj47-source/lib/lists.nix:125:9:

          124|       fold' = n:
          125|         if n == len
             |         ^
          126|         then nul

       (stack trace truncated; use '--show-trace' to show the full trace)

       error: infinite recursion encountered

       at /nix/store/zaza7mgggz4m5h6z18kajabf4wciaj47-source/lib/modules.nix:508:28:

          507|         builtins.addErrorContext (context name)
          508|           (args.${name} or config._module.args.${name})
             |                            ^
          509|       ) (lib.functionArgs f);
```

## Soluation 2

I can not find soluation
