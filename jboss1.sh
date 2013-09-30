#!/bin/bash
#
#
# docker start/stop script for use in /etc/init.d
#
#
#

. /etc/init.d/functions

ME=`basename $0`

RUN="docker run -p 8080:8080 -p 8009:8009 -d -e 'JBID=node1' -v /tmp/log_jb1:/opt/jboss-as-7.1.1.Final/standalone/log leberkas/jb" 

case "$1" in

  start)
	echo -n "Starting $ME ...."	
	JOB=`$RUN`
	[ $? -eq 0 ] && success || failure
	sleep 5
	# Collect the output of the job so far
	docker logs $JOB
	echo $JOB > /var/run/$ME.id
	;;
  stop)
	# Kill the job
	echo -n "Stopint $ME ...."
	JOB=`cat /var/run/$ME.id`
 	docker stop $JOB
	[ $? -eq 0 ] && success || failure
	echo
	;;

  status)
	JOB=`cat /var/run/$ME.id`
	docker ps -a |grep $JOB
	;;
 *)
        echo $"Usage: $0 {start|stop|status}"
        exit 2
	;;
esac

