{ config, ... }:

with config.sadm; {
  users = {
    mutableUsers = false;
    users = {
      root = {
        hashedPassword = secrets.rootHashedPassword;
        openssh.authorizedKeys.keys = [
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFFpXDeTghddwtih0bTsx5sIIHcq3ZgGwfsU6EHtGX5i"
        ];
      };

      zuh0 = {
        isNormalUser = true;
        description = "Gabriel Duque";
        extraGroups = [ "wheel" ];
        hashedPassword = secrets.userHashedPassword;
        openssh.authorizedKeys.keys = [
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFFpXDeTghddwtih0bTsx5sIIHcq3ZgGwfsU6EHtGX5i"
        ];
      };
    };
  };
}
