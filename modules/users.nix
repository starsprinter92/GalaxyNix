{ lib, config, pkgs, ... } :

{
	users.users.guy = {
		isNormalUser = true;
		extraGroups = [ "wheel" "video" ];
		initialPassword = "password";
		description = "main user";
		shell = pkgs.zsh;
	      };

}
