# check_ssl_certificate
External script for Zabbix to check lifetime ssl certificate. 
Very simple script uses curl to receive ssl certificate expire date.

If you using Zabbix in Docker with image on Alpine Linux, install curl and date core utils.
```apk add coreutils curl```
