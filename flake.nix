{
  description = "Nixflake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";
    nix-software-center.url = "github:snowfallorg/nix-software-center";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    caelestia-shell = {
      url = "github:caelestia-dots/shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    ...
  } @ inputs: let
    inherit (self) outputs;
    lib = nixpkgs.lib;
    pkgs = nixpkgs.legacyPackages.x86_64-linux;
  in {
    homeConfigurations = {
      knakto = inputs.home-manager.lib.homeManagerConfiguration {
        pkgs = pkgs;
        extraSpecialArgs = {inherit self inputs outputs;};
        modules = [
          ./home/home.nix
          inputs.nvf.homeManagerModules.default
          inputs.caelestia-shell.homeManagerModules.default
        ];
      };
    };

    nixosConfigurations = {
      knakto = lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {inherit self inputs outputs;};
        modules = [
          ./host/config.nix
          inputs.home-manager.nixosModules.home-manager
          inputs.nixos-hardware.nixosModules.lenovo-thinkpad-x390
          inputs.nix-flatpak.nixosModules.nix-flatpak
        ];
      };
    };
  };
}
