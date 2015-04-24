#!/bin/bash

if [ "$1" = "" ] 
then
	echo "No ticker specified"
	exit
fi
	
PRICE=$(curl -s 'http://download.finance.yahoo.com/d/quotes.csv?s='+$1+'&f=l1')
CHANGE=$(curl -s 'http://download.finance.yahoo.com/d/quotes.csv?s='+$1+'&f=c')
CHANGE=$(echo "${CHANGE//\"}")
echo $1" $"$PRICE": "$CHANGE
