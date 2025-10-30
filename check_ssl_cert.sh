#! /bin/bash

DEBUG=0
if [ $DEBUG -gt 0 ]; then
    exec 2>>/tmp/my.log
    set -x
fi

if [ $# -lt 1 ]; then
    echo ""
    echo "Usage: $0 hostname"
    echo "-1"
    exit 0
fi

servername=$1

end_date="$(curl -vkI https://$servername 2>&1 | sed -n 's/.*expire date: //p')"

BUSYBOX=0
if date --version 2>&1 | grep -qi 'busybox' ; then
    BUSYBOX=1
fi

if [ -n "$end_date" ]; then
    if [ $BUSYBOX -eq 1 ]; then
        end_date_seconds=`date '+%s' --date "$end_date" -D '%b %d %H:%M:%S %Y'`
    else
        end_date_seconds=`date '+%s' --date "$end_date"`
    fi
    now_seconds=`date '+%s'`
    echo "($end_date_seconds-$now_seconds)/24/3600" | bc
else
    echo -1
fi
