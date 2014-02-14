
#!/bin/bash
# Repertoire de sauvegarde
DIR_BACKUP_INC="/srv"
# Repertoire original
DIR_ORIG="/home"
# User
USERSSH="root"
# Host
HOSTSSH="192.168.194.27"
# la date
data=`date "+%Y-%m-%d-%H-%M"`
#Commande
rsync -auP -H  --link-dest="../precedente" \
--exclude-from=$_DIR_BACKUP_INC/exclure.lst --delete \
"$DIR_ORIG" "-e ssh" $USERSSH@$HOSTSSH:"$DIR_BACKUP_INC/back-$data"
# En SSH nous allons créer les fichiers
ssh $USERSSH@$HOSTSSH rm -f $DIR_BACKUP_INC/precedente" && "ln -s $DIR_BACKUP_INC/back-$data  $DIR_BACKUP_INC/precedente
