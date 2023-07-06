{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ nixpkgs, home-manager, nixos-hardware, ... }: {
    nixosConfigurations.snowflake = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./hosts/t480/system/configuration.nix
        ./hosts/t480/system/hardware-configuration.nix
        nixos-hardware.nixosModules.lenovo-thinkpad-t480

        home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.soul = import ./hosts/t480/home/home.nix;
          };
        }
      ];
    };
  };
}