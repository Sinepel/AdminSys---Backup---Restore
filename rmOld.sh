rs=$(ssh root@192.168.194.27 'ls -t /srv/ | grep "back"')
echo $rs>recupRs
dernierElem=`awk -F' ' '{if(NF>3) print $(NF)}' recupRs`
echo $dernierElem
ssh root@192.168.194.27 'rm -rf /srv/'$dernierElem''
