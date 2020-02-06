#!/bin/sh

# main_sh=$(finger $USER|grep -oP 'Shell: \K.*')
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
	good_sh="sh"
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
		python3 $fullname
	;;

	rs)
		rmshbng
		rustc $tmpffname
		$tmpfname
		rm $tmpffname
		rm $tmpfname
	;;

	sh | bash | zsh)
		$good_sh $filename
	;;

	go)
		rmshbng
		go run $tmpffname
		rm $tmpffname
	;;

	c)
		gcc -o $tmpfname $filename
		$tmpfname
	;;

	js)
		rmshbng
		node $tmpffname
		rm $tmpffname
	;;

	fish)
		fish $filename
	;;

	"")  # a JIC* case  [*Just in case]
		# this is a fin' rare case ;)
		$main_sh $filename
	;;

	*)
		if [[ $filename != *.* ]]; then  # if no extension
			$good_sh $filename
		else
			echo "$extension not supported yet..";
		fi

esac
