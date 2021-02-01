{ lib, config, ... }:

with lib;
let
  canaryHash = builtins.hashFile "sha256" ./canary;
  expectedHash =
    "d1d1291f0962cb398e38209de05b6aec3bcf85474632496cddd4869ce9f279b3";
in if canaryHash != expectedHash then
  abort "Secrets are not readable. Have you run `git-crypt unlock`?"
else {
  options.sadm.secrets = {
    rootHashedPassword = mkOption { type = types.str; };
    userHashedPassword = mkOption { type = types.str; };
  };

  config.sadm.secrets = {
    rootHashedPassword = builtins.readFile ./shadow-hash-root;
    userHashedPassword = builtins.readFile ./shadow-hash-user;
  };
}
