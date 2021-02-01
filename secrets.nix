let
  canaryHash = builtins.hashFile "sha256" ./secrets/canary;
  expectedHash =
    "d1d1291f0962cb398e38209de05b6aec3bcf85474632496cddd4869ce9f279b3";
in if canaryHash != expectedHash then
  abort "Secrets are not readable. Have you run `git-crypt unlock`?"
else {
  rootHashedPassword = builtins.readFile ./secrets/shadow-hash-root;
  userHashedPassword = builtins.readFile ./secrets/shadow-hash-user;
}
