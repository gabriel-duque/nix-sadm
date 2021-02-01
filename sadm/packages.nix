# * This module sets the included packages for the system.
{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [ curl git mkpasswd tmux vim wget ];
}
