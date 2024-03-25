{config, pkgs, inputs,  ... }:
{

  # Nixvim
   
  # programs.nixvim = {
    
       # enable = true;
       # colorschemes.gruvbox.enable = true;
       # plugins.lightline.enable = true;
   
  # };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;
  
  # ---Auto CPU---
   environment.systemPackages = with pkgs; [
        auto-cpufreq
   ];

   services.auto-cpufreq.enable = true;

   # --- Flake code unused  ---
  
   # programs.auto-cpufreq.enable = true;
    
   # Optionally, you can configure your auto-cpufreq settings, if you have any
   
   #   programs.auto-cpufreq.settings = {
   #   charger = {
   #     governor = "performance";
   #     turbo = "auto";
   #   };

   #   battery = {
   #     governor = "powersave";
   #     turbo = "auto";
   #   };
   # };
  
   # ---Auto CPU ---


     programs = {
      zsh = {
        enable = true;
        autosuggestions.enable = true;
        zsh-autoenv.enable = true;
        syntaxHighlighting.enable = true;
        ohMyZsh   =  {
          enable  =  true;
          theme   =  "robbyrussell";
          plugins = [
            "git"
            "npm"
            "history"
            "node"
            "rust"
            "deno"
          ];
        };
      };
  };
}