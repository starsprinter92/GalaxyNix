{ inputs, config, pkgs, ... }:

{
	imports = [
		./apps/audio.nix
		./apps/nvidia.nix
		./apps/hyprland.nix
		./apps/printing.nix
		./apps/touchpad.nix
		./apps/fileman.nix
		./apps/nvim.nix
		./apps/ssh.nix
		./apps/zsh.nix
	];
	nvidia.enable = false;
	environment.systemPackages = with pkgs; [
		wget
		findutils
		killall
		starship
		tofi
		git
		kitty
		swww
		hyprshot
		hypridle
		grim
		slurp
		dunst
		wl-clipboard
		swaynotificationcenter
		pfetch
		brightnessctl
		btop
	];
}
