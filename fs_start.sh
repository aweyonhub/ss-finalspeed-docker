#!/bin/sh
ulimit -s 65535
ulimit -n 65535
cd /fs/
nohup java -Xmx512M -XX:MaxGCPauseMillis=30 -jar fs.jar > $logname 2>&1  &
echo FinalSpeed start,log file: /fs/server.log

