{ ... }:

{
  time.timeZone = "Europe/Paris";

  networking = {
    hostName = "pokedex";

    useDHCP = false;

    interfaces.enp3s0.useDHCP = true;
    interfaces.wlp2s0.useDHCP = true;
  };
}
