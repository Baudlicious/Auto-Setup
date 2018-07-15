#!/usr/bin/env bash
# NOTE TO SELF:
# - Change ~/.fake_config to ~/.config
# - Ask if user is using pacman or apt
# - Ask if user is using Kali linux if apt
# - Prompt for BSPWM install
# - Prompt for Password list installs
# - My first commit test

#!!!	Github repo variables and directories	!!!
#Driver for the rtl8812au chipset wireless card
rtl8812au="https://github.com/aircrack-ng/rtl8812au"

#BSPWM window manager
bspwm="https://github.com/baskerville/bspwm.git"

#SXHKD window manager keybinds
sxhkd="https://github.com/baskerville/sxhkd.git"

#!!!	Directories	!!!
config_dir="$HOME/.fake_config"
sxhkd_dir="sxhkd"
bspwm_dir="bspwm"
rtl8812au_dir="rtl8812au"

#!!!	Config Directories	!!!
sxhkd_config_dir="$CONFIG_DIR/sxhkd/"
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

make_config_dir () { # Make directories within the ~/.config/ for customizations
	if [ ! -d $config_dir ]
	then
		echo "$0: You do not have a '~/.config' folder, making one..." >&2
		mkdir -p "$config_dir"
	exit 1

	elif [ -d $config_dir ]
	then
		mkdir -p "$1"
			if [ -d $1 ]
			then
				echo -e "[+] Created folder $1"
			fi
	fi
}
#Distribution selection
read -p 'What Distribution are you using?(Arch/Deb): ' distro_response


#!!! 	Github repo downloads	!!!

#install router driver?
read -p "Would you like to install the drivers for the Alfa AWUS036ACH?(Y/N): " alfa_response

if [ "$alpha_response" == "Y" ] || [ "$alpha_response" == "y" ]
then
		# install rtl8812au chipset driver
		github_check $rtl8812au $rtl8812au_dir
elif [ "$alpha_response" == "N" ] || [ "$alpha_response" == "n" ]
then
		echo -e "[x] Skipped alfa AWUS036ACH"
else
		echo -e "[x] Did not recognize response, skipping installation of Alfa AWUS036ACH"
fi
#install BSPWM window manager?
read -p "Would you like to install the BSPWM as your window manager?(Y/N):  " bspwm_response

#install bspwm and sxhkd
if [ "$bspwm_response" == "Y" ] || [ "$bspwm_response" == "y" ]
then
	# Install from github or package manager
	read -p "Would you like to install from source?" bspwm_source_response
		if [ "$bpswm_source_response" == "Y" ] || [ "$bspwm_source_response" == "y"]
		#BSPWM window manager
		github_check $bspwm $bspwm_dir

		#SXHKD window manager keybinds
		github_check $sxhkd $sxhkd_dir

		elif [ "$distro_response" == "Arch" ] || [ "$alpha_response" == "arch" ]
		then
			#installs on archlinux if not doing from source
			pacman -S bspwm sxhkd

		elif [ "$distro_response" == "Deb" ] || [ "$distro_response" == "deb" ]
		then
		 #If not installing from source install with package manager
		apt-get install bspwm sxhkd
		exit 1
		fi
#!!!	CONFIGURATION DIRECTORY SETUP	!!!
make_config_dir $bspwm_config_dir
make_config_dir $sxhkd_config_dir

elif [ "$bspwm_response" == "N" ] ||  [ "$bspwm_response" == "n"]
then
	echo -e "[x] Opting to skip the install of window manager BSPWM"
else
	echo -e "[X] Did not recognize command, skipping bspwm installation"
fi

if [ "$distro_response" == "Arch" ] || [ "$alpha_response" == "arch" ]
then
	#installs on archlinux if not doing from source
		pacman -S
		yaourt -S
elif [ "$distro_response" == "Deb" ] || [ "$distro_response" == "deb" ]
then
		apt-get install
else


exit 0
