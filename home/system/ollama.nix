{ pkgs, ... }:
{
  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      intel-compute-runtime # OpenCL filter
      intel-media-driver # For video acceleration
      vpl-gpu-rt # For newer Gen12+ hardware
      intel-gpu-tools
    ];
  };

  services.ollama = {
    enable = true;
    package = pkgs.ollama;
  };
}
