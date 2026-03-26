{ pkgs, ... }:
{
  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      intel-compute-runtime
      intel-media-driver
      vpl-gpu-rt
      intel-gpu-tools
    ];
  };

  services.ollama = {
    enable = true;
    package = pkgs.ollama;
  };

  services.open-webui = {
    enable = true;
    port = 1709;
    host = "0.0.0.0"; # Ensures it listens on all interfaces
    environment = {
      OLLAMA_API_BASE_URL = "http://127.0.0.1:11434";
      WEBUI_AUTH = "False";
    };
  };
  networking.firewall.allowedTCPPorts = [ 1709 ];
}
