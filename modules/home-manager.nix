{ inputs, config, ... }:

{
	imports = [ inputs.home-manager.nixosModules.default ];

	home-manager = {
		backupFileExtension = "bak";
		extraSpecialArgs = { inherit inputs; };
		users = {
			"guy" = import ./config.nix;
			};
	};
}
