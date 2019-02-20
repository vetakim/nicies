#!/bin/bash

TODAY=`date +%Y-%m-%d`
STARTTIME=`journalctl --list-boots | grep $TODAY | sed -n 1p | cut -d' ' -f5`

function fromtimestamp() {
    HOURS=`bc <<< "scale=0;($1/3600)"`
    MINUTES=`bc <<< "scale=0;($1- $HOURS * 3600) / 60"`
    SECONDS=`bc <<< "scale=0;($1- $MINUTES * 60 - $HOURS * 3600) / 1"`
    printf "%02d:%02d:%02d" $HOURS $MINUTES $SECONDS
}

function totimestamp() {
    HOURS=`echo $1 | cut -d':' -f1`
    MINUTES=`echo $1 | cut -d':' -f2`
    SECONDS=`echo $1 | cut -d':' -f3`
    bc <<< "scale=0; $HOURS * 3600 + $MINUTES * 60 + $SECONDS"
}

