#!/usr/bin/env bash
# NOTE TO SELF:
# - Change ~/.fake_config to ~/.config


#!!!	Github repo variables and directories	!!!
#Driver for the rtl8812au chipset wireless card
RTL8812AU="https://github.com/aircrack-ng/rtl8812au"

#BSPWM window manager
BSPWM="https://github.com/baskerville/bspwm.git"

#SXHKD window manager keybinds
SXHKD="https://github.com/baskerville/sxhkd.git"

#!!!	Directories	!!!
CONFIG_DIR="$HOME/.fake_config"
SXHKD_DIR="sxhkd"
BSPWM_DIR="bspwm"
RTL8812AU_DIR="rtl8812au"

#!!!	Config Directories	!!!
SXHKD_CONFIG_DIR="$CONFIG_DIR/sxhkd/"
BSPWM_CONFIG_DIR="$CONFIG_DIR/bspwm/"



#Downloads from github, if repo is not available print to screen 
#output to error file
github_check () {
#checks git, silences ask on bad url and error output to screen
	GIT_ASKPASS=true git ls-remote "$1" > /dev/null 2>&1
	if [ "$?" -ne 0 ]
	then
		#if git check fails do this stuff
		echo "unable to get link from '$1'"
		touch install_errors
		echo -e "[Failed] $1.\n" >> install_errors
		exit 1

	elif [ -d "$2" ]
	then
		#Delete github folder if it exists
		echo -e "\n[X] $2 Directory Exists, removing it."
		echo -e "[-] $2 Existed. Deleted $2\n" 
		rm -fr $2
		echo -e "[+] Cloning '$1' into '$2'...\n"
		git clone $1

	else 
		#on success do git clone print output
		git clone $1
		if [ -d $2 ]
		then
			echo -e "\n[+] The Package at $1 was successful, located in $2 \n"

		fi
	fi
}

make_config_dir () {
	if [ ! -d $CONFIG_DIR ] 
	then
		echo "$0: You do not have a '~/.config' folder, making one..." >&2
		mkdir -p "$CONFIG_DIR"
	exit 1

	elif [ -d $CONFIG_DIR ]
	then
		mkdir -p "$1"
			if [ -d $1 ]
			then
				echo -e "[+] Created folder $1"
			fi
	fi
}

#!!! 	Github repo downloads	!!!

#rtl8812au chipset driver
github_check $RTL8812AU $RTL8812AU_DIR

#BSPWM window manager
github_check $BSPWM $BSPWM_DIR

#SXHKD window manager keybinds
github_check $SXHKD $SXHKD_DIR

#!!!	CONFIGURATION DIRECTORY SETUP	!!!
make_config_dir $BSPWM_CONFIG_DIR

make_config_dir $SXHKD_CONFIG_DIR

exit 0
