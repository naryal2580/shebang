#!/bin/bash

arguments="${@:2}"  # because, 1st arg. is the filename
fullname="$PWD/$1"
fulfname="${fullname##*/}"  # Full File Name :p
extension="${fulfname##*.}"
filename="${fulfname%.*}"
tmpffname="$PWD/$filename$RANDOM.$extension"
tmpfname="${tmpffname%.*}"

if type "zsh" > /dev/null; then
	good_sh="zsh"
elif type "bash" > /dev/null; then
	good_sh="bash"
else
	line=$(cat /etc/passwd | grep $(whoami))
	good_sh=${x##*/}
fi

rmshbng() {

    # $i may later be used, as it counts lines read..

    while IFS= read -r line; do
        if [[ $i == "" ]] && [[ $line == *shebang* ]]; then
		line=""
	fi
	echo "$line" >> "$tmpffname"
        i=$((i+1))
    done < "$fullname"

    # This thing, `\n`++ incase, theres none @ bottom

    [ -n "$line" ] && echo '' >> "$tmpffname"
}


case $extension in
	py | pyc)
		python3 $fullname $arguments
	;;

	rs)
		rmshbng
		rustc $tmpffname
		$tmpfname $arguments
		rm $tmpffname
		rm $tmpfname
	;;

	sh | bash | zsh)
		$good_sh $fullname $arguments
	;;

	go)
		rmshbng
		go run $tmpffname $arguments
		rm $tmpffname
	;;

	c)
		gcc -o $tmpfname $filename
		$tmpfname $arguments
	;;

	js)
		rmshbng
		node $tmpffname $arguments
		rm $tmpffname
	;;

	fish)
		fish $fullname $arguments
	;;

	"")  # a JIC* case  [*Just in case]
		# this is a fin' rare case ;)
		$main_sh $fullname $arguments
	;;

	*)
		if [[ $filename != *.* ]]; then  # if no extension
			$good_sh $fullname $arguments
		else
			echo "$extension not supported yet..";
		fi

esac
