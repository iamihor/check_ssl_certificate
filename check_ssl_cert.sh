#! /bin/sh

DEBUG=0
if [ $DEBUG -gt 0 ]
then
    exec 2>>/tmp/my.log
    set -x
fi

if [ $# -lt 1 ]
then
    echo ""
    echo "Usage: $0 hostname"
    echo ""
    exit 0
fi

servername=$1

end_date="$(curl -vkI https://$servername 2>&1 | sed -n 's/.*expire date: //p')"

if [ -n "$end_date" ]
then
    end_date_seconds=`date '+%s' --date "$end_date"`
    now_seconds=`date '+%s'`
    echo "($end_date_seconds-$now_seconds)/24/3600" | bc
fi
