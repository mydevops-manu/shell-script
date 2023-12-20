#!/bin/bash

NAME=""
GREETINGS="Good morning"

USAGE(){
    echo "USAGE: $(basename $0) -n <name> -w <greetings>"
    echo "OPTIONS::"
    echo "-n :: specify the name (mandatory)"
    echo "-g :: specify the greetings (optional), Default is Good morning"
    echo "-h :: Display help and exit"
}

while getopts "n:g:h" opt;
do
    case $opt in
        n) NAME="$OPTARG";;
        g) GREETING="$OPTARG";;
        h) USAGE; exit;;    
        :) USAGE; exit;;    
        \?) echo "invalid options: -"$OPTARG"" >&2; USAGE; exit;;
    esac
done

if [ -z "$NAME" ];
then
    echo "-n is mandatory"
    USAGE   
        exit 1
fi

echo "$NAME,$GREETINGS". So happy to see you."

