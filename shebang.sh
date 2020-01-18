#!/bin/sh

main_sh=$(finger $USER|grep -oP 'Shell: \K.*')
fullname="$PWD/$1"
fulfname="${fullname##*/}"  # Full File Name :p
extension="${fulfname##*.}"
filename="${fulfname%.*}"
tmpffname="$PWD/$filename$RANDOM.$extension"
tmpfname="${tmpffname%.*}"

rmshbng() {

    # $i may later be used, as it counts lines read..

    while IFS= read -r line; do
        [ "$i" != "" ] && echo "$line" >> "$tmpffname"
        i=$((i+1))
    done < "$fullname"

    # This thing, `\n`++ incase, theres none @ bottom

    [ -n "$line" ] && echo '' >> "$tmpffname"
}


case $extension in
	py | pyc)
		python3 $fullname
	;;

	rs)
		rmshbng
		rustc $tmpffname
		$tmpfname
		rm $tmpffname
	;;

	sh | bash)
		bash $filename
	;;

	zsh)
		zsh $filename
	;;

	fish)
		fish $filename
	;;

	"")
		$main_sh $filename
	;;

	*)
		if [[ $filename != *.* ]]; then
			$main_sh $filename
		else
			echo "$extension not supported yet..";
		fi

esac
