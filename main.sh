#!/bin/sh

# Bit of fanciness
b='\033[1m'
r='\033[0m'

banner(){
	printf "$b
  ___ _    ____  _    _ _       ___ 
 | __| |_ |__ / | |__| | | _ _ / __|
 |__ \ ' \ |_ \ | '_ \_  _| ' \ (_ |
 |___/_||_|___/_|_.__/ |_||_||_\___|
             |___|                  $r $1\n"
}

install(){
	ipath=$1
	sname=$2

	printf "[$b+$r] Installing to $b $ipath $r\n"
	sudo cp ./shebang.sh $ipath

	printf "[$b+$r] Can be shebanged via $b $sname $r\n"
	sudo ln -s $ipath $sname

}

uninstall(){
	ipath=$1
	sname=$2

	printf "[$b-$r] Uninstalling from $b $ipath $r\n"
	sudo rm $ipath

	printf "[$b-$r] Now, Cannot be $b #!$sname $r\n"
	sudo rm $sname
}


sudo echo > /dev/null

case "$1" in

	i|-i|--install|install)
		banner "Installer"
		install "/usr/bin/sb" "/shebang"
	;;


	u|-u|--uninstall|uninstall)
		banner "Uninstaller"
		uninstall "/usr/bin/sb" "/shebang"

	;;


	r|-r|--reinstall|reinstall)
		banner "Re-Installer"
		uninstall "/usr/bin/sb" "/shebang"
		install "/usr/bin/sb" "/shebang"

	;;


	h|-h|--help|help|"")
		banner
		printf "\nInstall 5h3_b4nG:\n"
		echo "    ./main.sh --install"
		printf "\nRe-install 5h3_b4nG:\n"
		echo "    ./main.sh --reinstall"
		printf "\nUninstall 5h3_b4nG:\n"
		echo "    ./main.sh --uninstall"

	;;


	*)
		banner
		echo "5h3_b4nG: Unsupported argument $1" >& 2
		exit 1

	;;

esac
