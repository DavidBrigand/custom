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
}
