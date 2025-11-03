{
  description = "A simple NixOs flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.05";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-flatpak.url = "github:gmodena/nix-flatpak"; # unstable branch. Use github:gmodena/nix-flatpak/?ref=<tag> to pin releases.
    catppuccin.url = "github:catppuccin/nix";
    batlert.url = "github:AtleSkaanes/batlert";
    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
  };

  outputs =
    {
      self,
      nixpkgs,
      nixpkgs-stable,
      home-manager,
      nix-flatpak,
      catppuccin,
      chaotic,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages."${system}";
      pkgs-stable = nixpkgs-stable.legacyPackages."${system}";
    in
    {
      formatter."${system}" = pkgs.nixfmt-rfc-style;
      home-manager.useUserPackages = true;
      home-manager.useGlobalPkgs = true;
      home-manager.backupFileExtension = "hm-backup";

      homeConfigurations.atle = home-manager.lib.homeManagerConfiguration {
        extraSpecialArgs = {
          inherit inputs;
          inherit system;
          inherit pkgs-stable;
        };
        inherit pkgs;
        modules = [
          catppuccin.homeModules.catppuccin
          nix-flatpak.homeManagerModules.nix-flatpak
          ./home-manager/home.nix
        ];
      };

      nixosConfigurations = {
        nixbook = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          inherit system;
          modules = [
            catppuccin.nixosModules.catppuccin
            nix-flatpak.nixosModules.nix-flatpak
            chaotic.nixosModules.default
            # ./services
            ./nixos/nixbook
          ];
        };
      };

    };
}
