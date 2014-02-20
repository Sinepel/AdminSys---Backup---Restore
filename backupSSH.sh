
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
#PSQL
su postgres -c 'pg_dumpall -U postgres' >dump-$data.sql
rsync -auP -H -rplog "dump-$data.sql" "-e ssh" $USERSSH@$HOSTSSH:"$DIR_BACKUP_INC/psql/dump-$data.sql"
rm dump-$data.sql
#Commande
rsync -auP -H -rlpog --link-dest="../precedente" \
--exclude-from=$_DIR_BACKUP_INC/exclure.lst --delete \
"$DIR_ORIG" "-e ssh" $USERSSH@$HOSTSSH:"$DIR_BACKUP_INC/back-$data"
# En SSH nous allons créer les fichiers
ssh $USERSSH@$HOSTSSH rm -f $DIR_BACKUP_INC/precedente" && "ln -s $DIR_BACKUP_INC/back-$data  $DIR_BACKUP_INC/precedente
./rmOld.sh
rm recupRs
