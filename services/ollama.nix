{
      services.ollama={
          enable = true;
          environmentVariables = { 
            OLLAMA_ORIGINS="*";
          };
        };
}