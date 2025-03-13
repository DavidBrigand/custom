# custom NixOS
configuration perso de NixOS
Premier deploiement :
nix-shell -p git
mkdir /ect/nixos/custom
cd /etc/nixos/custom
git clone https://github.com/DavidBrigand/custom.git
nano /etc/nixos/configuration.nix
y ajouter : imports = [ ./custom ];
