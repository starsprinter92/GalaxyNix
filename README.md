# GalaxyNix
## Installation
cd /etc/

nix-shell -v git

sudo git clone https://github.com/starsprinter92/GalaxyNix/ nixos

exit

cd nixos

sudoedit flake.nix

(change hosts/segue to hosts/andromeda if using nvidia )

sudo nixos-rebuild switch --flake /etc/nixos#default

( reboot your computer )
