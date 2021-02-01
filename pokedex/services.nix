{ ... }:

{
  services = {
    openssh = {
      enable = true;
      passwordAuthentication = false;
      startWhenNeeded = true;
    };
  };
}
