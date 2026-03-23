{ ... }:

{
  virtualisation.podman = {
    enable = true;
    dockerCompat = true; # Optional: lets you use 'docker' commands for podman
  };
}
