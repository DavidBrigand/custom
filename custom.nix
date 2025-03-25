{ pkgs, ... }:
{
  environment.systemPackages = with pkgs;[
	# En ligne de commandes
	nmap
	pciutils
	usbutils
	git
	fastfetch
	dnsutils  
	smbclient-ng

        # Web
	discord
	chromium
	teamviewer 		# Ne pas oublier de demarrer le service
	thunderbird-latest
	# Utilitaires
	keepassxc
	tilix
	# Bureautique
	libreoffice-fresh
	hunspell
	hunspellDicts.fr-moderne
	#Virtualisation
	qemu #hyperviseur qemu
	quickemu # Quickly create and run optimised Windows, macOS and Linux virtual machines
	# Autres
	celluloid
	vscodium
	samba # Test pour acces a partage copieur samba
 ];

# Flatpak
	services.flatpak.enable = true;
	systemd.services.flatpak-repo = {
	wantedBy = [ "multi-user.target" ];
	requires = [ "network-online.target" ];
	after = [ "network-online.target" ];
	path = [ pkgs.flatpak ];
	script = ''
	flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo && flatpak install -y flathub org.dupot.easyflatpak
	'';
	};

# Demarrer les services
services.teamviewer.enable = true;
services.samba.smbd.enable = true;
services.samba.enable = true;
services.samba.nmbd.enable = true;

###############################
# Parametres des applications #
###############################

#Alias Bash
programs.bash.shellAliases = {
	nix-switch="sudo nixos-rebuild switch";
	nix-list="nixos-rebuild list-generations";
	nix-clean="sudo nix-collect-garbage --delete-older-than 30d && sudo nixos-rebuilt switch";
	nix-rollback="sudo nixos-rebuild switch --rollback";
	update-glf="sudo bash /etc/update-glf-config.sh";
	nix-upgrade="/bin/sh ~/Scripts/nix-up.sh";
	monip="curl ipinfo.io/ip";
  };
# Firefox
programs = {
    firefox = {
      enable = true;
      wrapperConfig = {
        pipewireSupport = true;
      };
      languagePacks = [ "fr" "en-US" ];
      preferences = {
        "intl.accept_languages" = "fr-fr,en-us,en";
        "intl.locale.requested" = "fr,en-US";
      };
    };
  };
} 
