{
# Logiciels non libres
nixpkgs.config.allowUnfree = true;

# Nettoyage
nix.gc.automatic = true;
nix.gc.dates = "weekly";
nix.gc.options = "--delete-older-than 30d";

# Optimisation du stockage
nix.settings.auto-optimise-store = true;
}
