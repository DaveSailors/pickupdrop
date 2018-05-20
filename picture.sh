#!/bin/bash
 
. ~/.bashrc

DAY=$(date +%d)
MONTH=$(date +%m)
YEAR=$(date +%Y)
HOUR=$(date +%H)
MINUTE=$(date +%M)
SECOND=$(date +%S)
TSTAMP="$MONTH.$DAY.$YEAR-$HOUR.$MINUTE.$SECOND"

HOSTNAME=`hostname`;
FILE=image.$TSTAMP.$HOSTNAME.jpg

#------------------------------------------
echo "$TSTAMP $0 running on $HOSTNAME"
#------------------------------------------


#fswebcam -r 1280x720 image.$TSTAMP.$HOSTNAME.jpg
fswebcam -r 1280x720 $FILE



/usr/bin/ftp -n <<EOF
open $NetSolHost
user $NetSolDrop $NetSolType
pwd
ls -al
passive
!pwd
bin
put $FILE
chmod 775 $FILE
quit
EOF



rm $FILE


