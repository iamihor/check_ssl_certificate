# check_ssl_certificate
External script for Zabbix to check lifetime ssl certificate. 
Very simple script uses curl to receive ssl certificate expire date.

Now version check if using busybox version of date. 
But not required but possible:
If using Zabbix in Docker with image on Alpine Linux (busybox date), install curl and date core utils.
```apk add coreutils curl```
