{ pkgs, lib, ... }:

{
  # --- Virtualization Settings ---
  virtualisation.libvirtd = {
    enable = true;
    qemu = {
      package = pkgs.qemu_kvm;
      runAsRoot = true;
      swtpm.enable = true; # Required for Windows 11 (TPM support)
    };
  };

  # Frontend GUI
  programs.virt-manager.enable = true;
  systemd.services.virt-secret-init-encryption.enable = false;

  # USB Redirection & Guest Integration
  virtualisation.spiceUSBRedirection.enable = true;
  services.spice-vdagentd.enable = true; # Enables clipboard sharing
  # Fix for the failing virt-secret service
  systemd.services.virt-secret-init-encryption = {
    # We override the command to use the correct shell path and systemd-creds path
    serviceConfig.ExecStart = lib.mkForce "${pkgs.runtimeShell} -c 'umask 0077 && (${pkgs.coreutils}/bin/dd if=/dev/random status=none bs=32 count=1 | ${pkgs.systemd}/bin/systemd-creds encrypt --name=secrets-encryption-key - /var/lib/libvirt/secrets/secrets-encryption-key)'";

    # Ensure the directory exists so dd has somewhere to write
    preStart = "mkdir -p /var/lib/libvirt/secrets";
  };
}
