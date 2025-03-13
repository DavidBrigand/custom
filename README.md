# custom NixOS

** configuration perso de NixOS **

Premier deploiement :

`nix-shell -p git`

`cd /etc/nixos`

`sudo git clone https://github.com/DavidBrigand/custom.git`

`sudo nano /etc/nixos/configuration.nix`

y ajouter : ./custom dans la section import

`sudo nixos-rebuild switch`
