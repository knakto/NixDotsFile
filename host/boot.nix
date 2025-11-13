{ config, pkgs, ... }:

{
  services.udev.extraRules = ''
    # MediaTek Preloader
    SUBSYSTEM=="usb", ATTR{idVendor}=="0e8d", ATTR{idProduct}=="2000", MODE="0666"
    # MediaTek BootROM
    SUBSYSTEM=="usb", ATTR{idVendor}=="0e8d", ATTR{idProduct}=="0003", MODE="0666"
  '';

  environment.systemPackages = with pkgs; [
    libusb1
    python3
    python311Packages.libusb1
	virtualbox
    # ถ้า nixpkgs มี mtkclient ก็ใส่ตรงนี้ได้เลย
  ];
}

