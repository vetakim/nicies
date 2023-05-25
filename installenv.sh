#!/usr/bin/sh

lines=`cat repos_list.txt`

for line in $lines
do
	repo=`echo $line | cut -d',' -f1`
	dest=`echo $line | cut -d',' -f2`
	git -C $dest clone $repo
done
