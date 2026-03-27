{ config, pkgs, ... }:
{
	# Package cifs-utils
	environment.systemPackages = with pkgs; [
	cifs-utils
	];


  # Monte bien mais pas en ecriture voir sur la Debian
  fileSystems."/media/U" = {
    device = "//data-srv-01.carpentras.fr/users$/david.lesne";
    fsType = "cifs";
 	options = [
	"credentials=/home/david/.smbcred"	
	"uid=1000"  # Remplacez par l'UID de l'utilisateur
	"gid=100"  # Remplacez par le GID de l'utilisateur
	"file_mode=0777"
	"dir_mode=0777"
    ];
  };

  fileSystems."/media/ressources" = {
    device = "//data-srv-01.carpentras.fr/ressources$";
    fsType = "cifs";
    options = [
      "credentials=/home/david/.smbcred"
      "uid=1000"  # Remplacez par l'UID de l'utilisateur
      "gid=100"  # Remplacez par le GID de l'utilisateur
      "file_mode=0777"
      "dir_mode=0777"
    ];
  };

  fileSystems."/media/dit" = {
    device = "//data-srv-01.carpentras.fr/dit$";
    fsType = "cifs";
    options = [
      "credentials=/home/david/.smbcred"
      "uid=1000"  # Remplacez par l'UID de l'utilisateur
      "gid=100"  # Remplacez par le GID de l'utilisateur
      "file_mode=0777"
      "dir_mode=0777"
    ];
  };

  fileSystems."/media/projets" = {
    device = "//data-srv-01.carpentras.fr/projets$";
    fsType = "cifs";
    options = [
      "credentials=/home/david/.smbcred"
      "uid=1000"  # Remplacez par l'UID de l'utilisateur
      "gid=100"  # Remplacez par le GID de l'utilisateur
      "file_mode=0777"
      "dir_mode=0777"
    ];
  };
  #Disque home externe pour les données de Steam
  fileSystems."/media/data-externe" = {
    device = "/dev/disk/by-uuid/8cdd8fde-c55f-4778-ab30-02aa7ba14465";
    fsType = "ext4";
    options = [ "nofail" "defaults" ];
  };
  # Le Bind Mount : On lie le sous-dossier Fedora à ton Home NixOS
  # Cela permet à Steam de voir tes jeux comme s'ils étaient sur ton SSD principal
  fileSystems."/home/david/Games" = {
    device = "/media/data-externe/david-fedora/Games";
    options = [ "bind" "nofail" "user" "x-systemd.requires=/media/data-externe" ];
  };
  #Création automatique des dossiers de montage avec les bons droits
  systemd.tmpfiles.rules = [
    "d /media/data-externe 0755 david david -"
    "d /home/david/Games 0755 david david -"
  ];
}
