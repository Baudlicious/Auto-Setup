#!/usr/bin/env bash

# TODO: Variables for each github repo 
github="https://www.github.com/x3830s/"
linux_environment="https://www.github.com/x3830s/Linux-Environment"
powerline_fonts="https://www.github.com/powerline/fonts"

# TODO: Variables for each github repo directory
linux_environment_dir="Linux-Environment"
powerline_fonts_dir="fonts"

# Check if user is root or not (generally for Kali)
if [ "$(whoami)" = "root" ]
then
	dir='/root'
else
	dir="$HOME"
fi 


# Check and download Linux-Environment repo
github_repo () {
	# Create a github folder with checks to see if it exists
	if [ ! -d "$dir/github" ]
	then
		echo "$0: You do not have a '$dir/github' folder, making one ..." >&2
		mkdir -p "$dir/github"
	elif [ -d "$dir/github/$2" ]
	then
		echo "[ ] $1 Already exists at '$dir/github/$2'" >> install.log
	
	else	
		# Don't ask for pass if can't connect or wrong repo
		`GIT_ASKPASS=true git ls-remote "$1" > /dev/null 2>&1`
		if [ "$?" -ne 0 ] 
		then
			touch install.log
			echo -e "[Failed] $1.\n" >> install.log
			echo "Unable to connect to $1. Check install.log"
		else # on success
			if [ ! -d "$dir/github/$2" ]
			then
				git clone $1 $dir/github/$2
			else
				echo -e "\n[ ] The package at $1 is already installed, and located at '$dir/github/$2'"
				echo -e "\n[ ] The package at $1 is already installed, and located at '$dir/github/$2'" >> install.log

				echo -e "\n[+] The package at $1 was successful, located in $2 \n"
				echo -e "\n[+] The package at $1 was successful, located in $2 \n" >> install.log
			fi
		fi
	fi
}

	
# TODO: Move Auto-Setup to the github folder

# TODO: Functions to create the working autoscript
# # # # TODO: If folder exists do not redownload
github_repo $linux_environment $linux_environment_dir
github_repo $powerline_fonts $powerline_fonts_dir

# TODO: Install Powerline fonts
# # # # TODO: If exists do not run install script 
# # # # Place correct path to github folder
if [ ! -e "$dir/.local/share/fonts/Meslo LG S Regular for Powerline" ]
then
	echo "Powerline Fonts already installed"	
else
	$dir/github/$powerline_fonts_dir/install.sh
	echo -e "\n[+] Installed Powerline Fonts\n" >> install.log
fi

# TODO: Move .vimrc to appropriate folder
cp "$dir/github/$linux_environment_dir/.vimrc" $dir 
echo -e "\n[+] Moved .vimrc to ~.\n"
echo -e "\n[+] Moved .vimrc to ~.\n" >> install.log

# TODO: Move .xresources to appropriate folder


 

