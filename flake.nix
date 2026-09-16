{
  description = "Home Manager configuration";

  # Inputs are pinned to commits at least 7 days old as a supply-chain
  # cooldown: the `nix-update` shell function rewrites the revs below to the
  # newest nixpkgs-unstable / home-manager commits older than one week, so a
  # compromised upstream release has a week to be detected and yanked before it
  # can land here. Keep the `github:owner/repo/<rev>` shape so the rewrite works.
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/432f3d6a3b3a1b8d6238bab014b8e214eb1b1d30";
    home-manager = {
      url = "github:nix-community/home-manager/2c0350c759688177331b8f5242311fae8877bdb3";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }:
    let
      supportedSystems = [
        "aarch64-darwin"
        "x86_64-darwin"
        "x86_64-linux"
        "aarch64-linux"
      ];
      username = (import ./user.nix).username;
    in
    {
      homeConfigurations = builtins.listToAttrs (map (system: {
        name = "${username}@${system}";
        value = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.${system};
          modules = [ ./home.nix ];
          extraSpecialArgs = { inherit username; };
        };
      }) supportedSystems);
    };
}
