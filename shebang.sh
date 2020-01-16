#!/bin/sh

fullname="$PWD/$1"
filename=$(basename -- "$PWD/$1")
extension="${filename##*.}"
filename="${filename%.*}"


case $extension in
	py | pyc)
		python3 $fullname
	;;

	rs)
		rustc $fullname
		$PWD/$filename
		rm $PWD/$filename
	;;

	sh | "")
		bash $filename
	;;

	zsh)
		zsh $filename
	;;

	fish)
		fish $filename
	;;

	*)
		echo "$extension not supported yet..";

esac
