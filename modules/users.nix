{ lib, config, pkgs, ... } :

{
	users.users.guy = {
		isNormalUser = true;
		extraGroups = [ "wheel" "video" ];
		initialPassword = "AdptHim@03";
		description = "main user";
		shell = pkgs.zsh;
	      };

}
