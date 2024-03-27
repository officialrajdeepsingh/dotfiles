{config, pkgs, inputs,  ... }:
{

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
}