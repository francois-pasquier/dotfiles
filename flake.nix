{
  description = "Home Manager configuration";

  # Inputs are pinned to commits at least 7 days old as a supply-chain
  # cooldown: the `nix-update` shell function rewrites the revs below to the
  # newest nixpkgs-unstable / home-manager commits older than one week, so a
  # compromised upstream release has a week to be detected and yanked before it
  # can land here. Keep the `github:owner/repo/<rev>` shape so the rewrite works.
  #
  # Exception: `nixpkgs-fresh` floats on nixpkgs-unstable with no cooldown and
  # is only used for packages that release too often for a week-old pin to be
  # useful (see `freshPackages` below). `nix flake update` bumps it to HEAD.
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/65802dd547ff78e17322f8dad55f661999e11045";
    nixpkgs-fresh.url = "github:NixOS/nixpkgs?ref=nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/a1293da7dd8e497e08d26173f97e2976b36a31ea";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, nixpkgs-fresh, home-manager, ... }:
    let
      supportedSystems = [
        "aarch64-darwin"
        "x86_64-darwin"
        "x86_64-linux"
        "aarch64-linux"
      ];
      username = (import ./user.nix).username;
      freshPackages = [ "claude-code" ];
      freshOverlay = system: final: prev:
        let
          fresh = import nixpkgs-fresh {
            inherit system;
            config.allowUnfreePredicate = pkg:
              builtins.elem (nixpkgs.lib.getName pkg) freshPackages;
          };
        in
        nixpkgs.lib.genAttrs freshPackages (name: fresh.${name});
    in
    {
      homeConfigurations = builtins.listToAttrs (map (system: {
        name = "${username}@${system}";
        value = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.${system};
          modules = [
            ./home.nix
            { nixpkgs.overlays = [ (freshOverlay system) ]; }
          ];
          extraSpecialArgs = { inherit username; };
        };
      }) supportedSystems);
    };
}
