{ config, pkgs, inputs, ... }:

{
  imports = [ inputs.schizofox.homeManagerModule ];
  home.username = "guy";
  home.homeDirectory = "/home/guy";
  home.stateVersion = "23.11"; # Please read the comment before changing.

  home.packages = [
     (pkgs.nerdfonts.override { fonts = [ "VictorMono" ]; })
     pkgs.bibata-cursors
     pkgs.localsend
  ];

  home.pointerCursor = {
  	gtk.enable = true;
	package = pkgs.bibata-cursors;
	name = "Bibata-Modern-Classic";
	size = 24;
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };
  wayland.windowManager.hyprland = {
  	enable = true;

	settings = {
	exec-once = [
		"swww-daemon &"
		"swww img ~/.wallpaper.jpg"
	];
	general = {
		gaps_in = "30";
		gaps_out = "30";
		border_size = "5";

		"col.active_border" = "0xff7aa2f7";
		"col.inactive_border" = "0xff292e42";
	};
	decoration = {
		rounding = "15";
		active_opacity = "1.0";
		inactive_opacity = "0.8";
		drop_shadow = "true";
		shadow_range = "100";
		shadow_render_power = "3";
		blur = {
			enabled = "true";
			size = "10";
			passes = "2";
		};
	};
	input = {
		follow_mouse = 1;
		sensitivity = 0.25;
		touchpad = {
			natural_scroll = true;
		};
	};
	animations = {
		enabled = true;

		bezier = "bezier, 0.25, 0.1, 0.25, 1.25";
		animation = [
			"windows, 1, 3, bezier"
			"windowsOut, 1, 3, bezier, popin 80%"
			"border, 1, 10, bezier"
			"borderangle, 1, 3, bezier"
			"fade, 1, 3, bezier"
			"workspaces, 1, 3, bezier"
		];
	};

	dwindle = {
		pseudotile = "true";
		preserve_split = "true";
	};
	"$mod" = "SUPER";
	bind =
		[
			"$mod, D, exec, tofi-drun --drun-launch=true"
			"$mod, Q, killactive"
			"$mod, RETURN, exec, kitty"
			",XF86AudioLowerVolume, exec, wpctl set-volume  @DEFAULT_AUDIO_SINK@ 5%-"
			",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
			",XF86AudioMute, exec, pactl -- set-sink-mute @DEFAULT_AUDIO_SINK@ toggle"
			",XF86AudioMicMute, exec, pactl -- set-source-mute 0 toggle"
			",XF86MonBrightnessDown, exec, brightnessctl s 10%-"
			",XF86MonBrightnessUp, exec, brightnessctl s +10"
		]
		++(
			builtins.concatLists (builtins.genList (i:
				let ws = i + 1;
				in [
					"$mod, code:1${toString i}, workspace, ${toString ws}"
					"$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
				]
			)
			9)
		);
		bindm = [
			"$mod, mouse:272, movewindow"
			"ALT, mouse:272, resizewindow"
		];
        };
  };

  home.file."wallpaper" = {
  	source = ./../home-files/wallpaper.jpg;
	target = ".wallpaper.jpg";
  };

  home.file."waybar-conf" = {
  	source = ./../home-files/waybar.json;
	target = ".config/waybar/config.jsonc";
  };

  home.file."waybar-style" = {
  	source = ./../home-files/waybar-style.css;
	target = ".config/waybar/style.css";
  };


programs.schizofox = {
  enable = true;

  theme = {
    colors = {
      background-darker = "24283b";
      background = "1f2335";
      foreground = "c0caf5";
    };

    font = "Lexend";

    extraUserChrome = ''
      body {
        color: red !important;
      }
    '';
  };

  search = {
    defaultSearchEngine = "Brave";
    removeEngines = ["Google" "Bing" "Amazon.com" "eBay" "Twitter" "Wikipedia"];
    searxUrl = "https://searx.be";
    searxQuery = "https://searx.be/search?q={searchTerms}&categories=general";
    addEngines = [
      {
        Name = "Etherscan";
        Description = "Checking balances";
        Alias = "!eth";
        Method = "GET";
        URLTemplate = "https://etherscan.io/search?f=0&q={searchTerms}";
      }
    ];
  };

  security = {
    sanitizeOnShutdown = false;
    sandbox = true;
    userAgent = "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:106.0) Gecko/20100101 Firefox/106.0";
  };

  misc = {
    drm.enable = true;
    disableWebgl = false;
    contextMenu.enable = true;
  };

  extensions = {
    simplefox.enable = true;
    darkreader.enable = true;

    extraExtensions = {
      "webextension@metamask.io".install_url = "https://addons.mozilla.org/firefox/downloads/latest/ether-metamask/latest.xpi";
    };
  };

  misc.bookmarks = [
    {
      Title = "Example";
      URL = "https://example.com";
      Favicon = "https://example.com/favicon.ico";
      Placement = "toolbar";
      Folder = "FolderName";
    }
  ];
  };

  programs.kitty =  {
  	enable = true;
	settings = {
		confirm_os_window_close = 0;
		dynamic_background_opacity = true;
		enable_audio_bell = false;
		mouse_hide_wait = "-1.0";
		window_padding_width = 15;
		font_family = "VictorMono NF Semibold";
		font_size = 12;

		# Colors
		background = "#222436";
		foreground = "#c8d3f5";
		selection_background = "#2d3f76";
		selection_foreground = "#c8d3f5";
		url_color = "#4fd6be";
		cursor = "#c8d3f5";
		cursor_text_color = "#222436";

		active_tab_background = "#82aaff";
		active_tab_foreground = "#1e2030";
		inactive_tab_background = "#2f334d";
		inactive_tab_foreground = "#545c7e";

		active_border_color = "#82aaff";
		inactive_border_color = "#2f334d";

		color0 = "#1b1d2b";
		color1 = "#ff757f";
		color2 = "#c3e88d";
		color3 = "#ffc777";
		color4 = "#82aaff";
		color5 = "#c099ff";
		color6 = "#86e1fc";
		color7 = "#828bb8";

		color8 = "#444a73";
		color9 = "#ff757f";
		color10 = "#c3e88d";
		color11 = "#ffc777";
		color12 = "#82aaff";
		color13 = "#c099ff";
		color14 = "#86e1fc";
		color15 = "#c8d3f5";

		color16 = "#ff966c";
		color17 = "#c53b53";
	};
   };

  programs.zsh = {
  	enable = true;
	enableCompletion = true;
	autosuggestion.enable = true;
	autosuggestion.strategy = [ "completion" ];
	syntaxHighlighting.enable = true;

	shellAliases = {
		# Navigation
		l = "ls --color=auto";
		la = "ls -a --color=auto";
		ll = "ls -l --color=auto";
		lal = "ls -l -a --color=auto";
		c = "cd";
		# NixOS
		nixconf = "cd /etc/nixos";
		upd = "sudo nixos-rebuild switch --flake /etc/nixos/#default";
  	};

	history = {
		size = 999999;
		path = "${config.xdg.dataHome}/zsh/history";
	};
	initExtraFirst = "pfetch;PROMPT=\"%F{blue}┌┤%f%B%F{cyan}%n%f%b%F{yellow}@%f%F{magenta}%m%f%F{blue}│\"$'\n'\"%F{blue}└ %~   %F{green}> \"; RPROMPT=\"%F{blue}%W-%t\"";
	# Make ZSH start faster
	completionInit = "compinit";
  };
  programs.tofi = {
  	enable = true;
	settings = {
		background-color = "#1f2335";
		border-width = 0;
		font = "VictorMono NF Semibold";
		height = "100%";
		outline-width = 0;
		padding-left = "35%";
		padding-top = "35%";
		result-spacing = 25;
		width = "100%";
		text-color = "#c8d3f5";
		selection-color = "#ff9e64";
	};
  };
  programs.btop = {
  	enabled = true;
	settings = {
		color_theme = "tokyo-night";
		theme_backround = false;
		rounded_corners = false;
		graph_symbol = "block";
		shown_boxes = "mem cpu proc";
	};
  };
  

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
