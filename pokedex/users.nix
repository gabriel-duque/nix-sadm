{ config, ... }:

with config.sadm;
let
  makeUser = { shadowHash, extraConfig ? { } }:
    {
      hashedPassword = shadowHash;
      openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFFpXDeTghddwtih0bTsx5sIIHcq3ZgGwfsU6EHtGX5i"
      ];
    } // extraConfig;
in {
  users = {
    mutableUsers = false;
    users = {
      root = (makeUser { shadowHash = secrets.rootHashedPassword; });

      zuh0 = (makeUser {
        shadowHash = secrets.userHashedPassword;
        extraConfig = {
          isNormalUser = true;
          description = "Gabriel Duque";
          extraGroups = [ "wheel" ];
        };
      });

    };
  };
}
