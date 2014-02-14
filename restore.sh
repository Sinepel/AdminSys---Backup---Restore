#!/bin/bash
if (test $# = 0)
then
	echo "Veuillez mettre en paramètre la date et l'heure (yyyy-MM-dd-hh-mm) pour permettre la restauration"
	exit 1
fi
date=$1
rsync -a --stats --progress -e ssh root@192.168.194.27:/srv/back-$date/ /

