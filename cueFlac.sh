#!/bin/bash




SAVEIFS=$IFS
IFS=$(echo -en "\n\b")

#read -p "Input cue: " file1
#read -p "Input flac: " file2
#read -p "enter Format: " formatx

formatx="%n %t"

options=("%n %t" "%t" "%n %a %t" "%n %t %a")
select opt in "${options[@]}"
do
    case $opt in
        "%n %t")
            formatx=$opt
 	break
            ;;
        "%t")
           formatx=$opt
	break
            ;;
        "%n %a %t")
           formatx=$opt
	break
            ;;
	"%n %a %t")
           formatx=$opt
	break
            ;;
    esac
done


cat *.cue | shnsplit -o  flac *.flac -t "$formatx"

rm *00*.flac

cuetag *.cue *[0-9][0-9]*.flac

IFS=$SAVEIFS

