{
  services.colima = {
    enable = true;

    profiles = {
      docker = {
        isActive = true;
        isService = true;
        settings = {
          disk = 100;
          cpu = 2;
          memory = 2;
          vmType = "vz";
          rosetta = true;
          runtime = "docker";
        };
      };
    };
  };

  home.sessionVariables = {
    COLIMA_SAVE_CONFIG = 0;
  };
}
