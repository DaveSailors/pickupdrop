#!/bin/bash
 
. ~/.bashrc

DAY=$(date +%d)
MONTH=$(date +%m)
YEAR=$(date +%Y)
HOUR=$(date +%H)
MINUTE=$(date +%M)
SECOND=$(date +%S)
TSTAMP="$MONTH.$DAY.$YEAR-$HOUR.$MINUTE.$SECOND"

PID=$$

HOSTNAME=`hostname`;
FILE=image.$TSTAMP.$HOSTNAME.$PID.jpg


#------------------------------------------
echo "$TSTAMP $0 running on $HOSTNAME"
#------------------------------------------


#fswebcam -r 1280x720 image.$TSTAMP.$HOSTNAME.jpg
fswebcam -r 1280x720 $FILE

echo Pushing now

/usr/bin/ftp -n <<EOF
open $NetSolHost
user $NetSolDrop $NetSolType
pwd
passive
!pwd
bin
put $FILE
chmod 775 $FILE
ls -al $FILE
quit
EOF



rm $FILE



