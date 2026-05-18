{
  description = "Unified Nix configuration for light (macOS) and tiny (NixOS)";

  # ---------------------------------------------------------------------------
  # INPUTS — upstream sources this flake depends on.
  # Pin versions by updating flake.lock with: nix flake update
  # ---------------------------------------------------------------------------
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # sops-nix for secrets management — configure keys in .sops.yaml
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  # ---------------------------------------------------------------------------
  # OUTPUTS — what this flake produces.
  # Each host gets its own configuration attribute.
  # ---------------------------------------------------------------------------
  outputs = { self, nixpkgs, nix-darwin, home-manager, sops-nix, ... }:
  {

    # -------------------------------------------------------------------------
    # macOS — MacBook M4 (hostname: light, user: zaha)
    # Apply with: nix run nix-darwin -- switch --flake .#light
    # -------------------------------------------------------------------------
    darwinConfigurations."light" = nix-darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      modules = [
        # System-level host config
        ./hosts/light/default.nix
        # macOS-specific shared modules
        ./modules/darwin/default.nix
        # Common shared modules
        ./modules/common/default.nix
        # home-manager integration (to be wired up)
      ];
    };

    # -------------------------------------------------------------------------
    # NixOS — Home PC (hostname: tiny, user: zaha)
    # Apply with: sudo nixos-rebuild switch --flake .#tiny
    # -------------------------------------------------------------------------
    nixosConfigurations."tiny" = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        # System-level host config
        ./hosts/tiny/default.nix
        # Hardware scan output
        ./hosts/tiny/hardware.nix
        # NixOS-specific shared modules
        ./modules/nixos/default.nix
        # Common shared modules
        ./modules/common/default.nix
        # home-manager integration (to be wired up)
      ];
    };

  };
}
