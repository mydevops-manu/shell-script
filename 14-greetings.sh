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

if [ -z "$NAME" ];
then
    echo "-n is mandatory"
    USAGE   
        exit 1
fi

while getopts "n:g:h" opt;
do
    case $opt in
        n) NAME="$OPTARG";;
        g) GREETING="$OPTARG";;
        h) USAGE; exit;;    
        :) USAGE; exit;;    # :) means no option 
        \?) echo "invalid options: -"$OPTARG"" >&2; USAGE; exit;;
    esac
done

echo "$GREETINGS,$NAME". So happy to see you."

