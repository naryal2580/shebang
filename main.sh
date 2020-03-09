#!/bin/sh

# Bit of fanciness
b='\x1b[1m'
r='\x1b[0m'

banner(){
	echo -e "$b
  ___ _    ____  _    _ _       ___ 
 / __| |_ |__ / | |__| | | _ _ / __|
 \__ \ ' \ |_ \ | '_ \_  _| ' \ (_ |
 |___/_||_|___/_|_.__/ |_||_||_\___|
             |___|                 $r $1
"
}

install(){
	ipath=$1
	sname=$2

	echo -e "[$b+$r] Installing to $b $ipath $r"
	sudo cp ./shebang.sh $ipath

	echo -e "[$b+$r] Can be shebanged via $b $sname $r"
	sudo ln -s $ipath $sname

}

uninstall(){
	ipath=$1
	sname=$2

	echo -e "[$b-$r] Uninstalling from $b $ipath $r"
	sudo rm $ipath

	echo -e "[$b-$r] Now, Cannot be $b #!$sname $r"
	sudo rm $sname
}


sudo echo > /dev/null

case "$1" in

	i|-i|--install|install)
		banner "Installer"
		install "/usr/bin/sb" "/shebang"
	;;


	u|-u|-un|-uni|--uninstall|uninstall)
		banner "Uninstaller"
		uninstall "/usr/bin/sb" "/shebang"

	;;


	r|-r|-re|-rei|--reinstall|reinstall)
		banner "Re-Installer"
		uninstall "/usr/bin/sb" "/shebang"
		install "/usr/bin/sb" "/shebang"

	;;


	*)

	echo "5h3b4nG: Unsupported argument $1" >& 2
	exit 1

	;;

esac
