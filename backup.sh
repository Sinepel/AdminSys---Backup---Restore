#!/bin/bash
# Repertoire de sauvegarde
DIR_BACKUP_INC="/srv"
# Repertoire original
DIR_ORIG="/home"
# la date
data=`date "+%Y-%m-%d-%H-%M"`
# La vraie commande
rsync -aP  --link-dest="../precedente" \
--exclude-from=$_DIR_BACKUP_INC/exclure.lst \
"$DIR_ORIG" "$DIR_BACKUP_INC/back-$data"
rm -f "$DIR_BACKUP_INC/precedente"
ln -s "$DIR_BACKUP_INC/back-$data"  "$DIR_BACKUP_INC/precedente"
