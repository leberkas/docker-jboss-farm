#!/bin/bash

#/usr/sbin/sshd &
#echo ssh started

if [ -z "$JBID" ]; then
  JBID=jb7n01
fi

if [ -z "$JBOSS_CONF" ]; then
  JBOSS_CONF=/opt/jboss/bin/standalone.conf
fi


echo JB-ID: $JBID
echo
echo starte jboss ...

#rm -rf /opt/jboss/node01/tmp/*/*
#rm -rf /opt/jboss/node01/configuration/standalone_xml_history/current

su - jboss -c "RUN_CONF=$JBOSS_CONF /opt/jboss/bin/standalone.sh -c standalone.xml -Djboss.server.base.dir=/opt/jboss/standalone -Djboss.mod_cluster.jvmRoute=$JBID"

#clean up, when finished
rm -rf /opt/jboss/standalone/tmp/*/*

echo jboss done

