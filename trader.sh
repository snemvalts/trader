#!/bin/bash

if [ "$1" = "" ] 
then
	echo "No ticker specified"
	exit
fi
price=$(curl -s 'http://download.finance.yahoo.com/d/quotes.csv?s='$1'&f=l1')
change=$(curl -s 'http://download.finance.yahoo.com/d/quotes.csv?s='$1'&f=c')
change=$(echo "${change//\"}")
status=${change::1}
if [ "$status" = "-" ] 
then
	color="\033[0;31m"
else
	color="\033[0;32m"
fi


echo -e $1" $"$price": ${color}"$change"\033[0m"
