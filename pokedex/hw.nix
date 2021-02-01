{ lib, ... }:

{
  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
  hardware.enableRedistributableFirmware = lib.mkDefault true;
}
