#!/bin/sh

PREFIX=/media
AMOUNT='/etc/amount/amount'
UPDATEDESKTOP='/etc/amount/updatedesktop.pl';
FILEEXPLORER=`which thunar`

#Mount/Unmount and get the media name
MEDIA=`$AMOUNT $1 |grep MEDIA |cut -d: -f 2`

#Test
#echo "MEDIA:_${MEDIA}_"

#Update the desktop to paint the right icon
#and the right label (Mount/Unmount)
$UPDATEDESKTOP

if [  -z "${MEDIA}" ]; then
	exit 0
fi

#Open file explorer
$FILEEXPLORER $MEDIA



