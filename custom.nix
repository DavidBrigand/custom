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
    micro 			# Editeur comme nano en mieux ;)

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
	qemu 			# hyperviseur qemu
	quickemu 		# Outils qemu voir https://github.com/quickemu-project/quickemu
	# Autres
	celluloid
	vscodium
	samba 			# Test pour acces a partage copieur samba
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
	nix-clean = "sudo nix-collect-garbage --delete-older-than 30d && sudo /run/current-system/bin/switch-to-configuration boot";
	#nix-clean="sudo nix-collect-garbage --delete-older-than 30d && sudo nixos-rebuild switch";
	nix-rollback="sudo nixos-rebuild switch --rollback";
	nix-upgrade="/bin/sh ~/Scripts/nix-up.sh";
	monip="curl ipinfo.io/ip";
  };

#Horodatage du history en couleur ignore les doublons de commandes
environment.interactiveShellInit = ''
  export HISTTIMEFORMAT="$(echo -e '\e[1;34m%F \e[1;36m%T \e[0m')"
  export HISTSIZE=10000
  export HISTFILESIZE=20000
  export HISTCONTROL=ignoreboth
'';

# Firefox 100% Français
programs.firefox = {
  enable = true;
  # On ne garde que le français ici
  languagePacks = [ "fr" ];
  
  wrapperConfig = {
    pipewireSupport = true;
  };

  policies = {
    # On force uniquement le français au niveau du moteur
    RequestedLocales = [ "fr" ];
    SpellCheckingDictionaries = [ "fr" ];
  };

  preferences = {
    "intl.accept_languages" = "fr-fr,fr";
    "intl.locale.requested" = "fr";
  };
};
}
