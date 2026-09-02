{
  description = "Home Manager configuration";

  # Inputs are pinned to commits at least 7 days old as a supply-chain
  # cooldown: the `nix-update` shell function rewrites the revs below to the
  # newest nixpkgs-unstable / home-manager commits older than one week, so a
  # compromised upstream release has a week to be detected and yanked before it
  # can land here. Keep the `github:owner/repo/<rev>` shape so the rewrite works.
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/2df64691aacd4e49f7d4afa0553e86e6c10e239d";
    home-manager = {
      url = "github:nix-community/home-manager/0a364342a66bcecfc8a00d2fc38c6c29eee7bc5e";
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
