docker-jboss-farm
=================

Dockerfile and some bash scripts for running many jboss instances. 



How does it work
----------------

The idea is to have one docker image running multiple times.
To achive this we have to mount a local folder for the logfiles of each running instance (so they are persistant over image restarts).



Files
-----

* Dockerfle:
  near the end there is a line, which adds "app1". All files in this folder are copied to the jboss deployment directory - change if you want an other source folder for your apps.

* jboss1.sh:
  this is the script for start/stop of the instances. You have to copy and edit it:
  
  in the line
  ``` RUN="docker run -p 8080:8080 -p 8009:8009 -d -e 'JBID=node1' -v /tmp/log_jb1:/opt/jboss-as-7.1.1.Final/standalone/log leberkas/jb" ```

  change: 
  * ```-p 8080:8080``` to ```-p 8180:8080``` and ```-p 8009:8009``` to ```-p 8109:8009```
  * ```-e 'JBID=node1'``` to ```-e 'JBID=node2'```  -- or whatever you like for node id (this is important for modjk !!)
  * ```-v /tmp/log_jb1:/opt/jboss-as-7.1.1.Final/standalone/log leberkas/jb``` to ```-v /tmp/log_jb2:/opt/jboss-as-7.1.1.Final/standalone/log``` -- this are the log locations - please choose some folder/disk which suite your space requirements.

* start.sh:
  this is copied into the image and started by default.

* standalone.xml:
  the jboss config file. 2 Things where changed: 
  * added ajp protocol (port 8009)
  * changed list address (from 127.0.0.1 to 0.0.0.0)








-branch test-1.1-
branch test-2.2
--
disclaimer: This is just an example how it could be done - i'm not responsible for any data loss!
