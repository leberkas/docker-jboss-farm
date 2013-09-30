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
  near the end there is a line, which adds "app1" - change if you want an other source folder for your apps

* jboss1.sh:
  this is the script for start/stop of the instances. You have to copy and edit it:
  
  in the line
  ``` RUN="docker run -p 8080:8080 -p 8009:8009 -d -e 'JBID=node1' -v /tmp/log_jb1:/opt/jboss-as-7.1.1.Final/standalone/log leberkas/jb" ```


  change: 
  * ```-p 8080:8080``` to ```-p 8180:8080``` and 8009:8009 to 8109:8009 
  * ```-e 'JBID=node1'``` to ```-e 'JBID=node2'```  -- or whatever you like for node id (this is important for modjk !!)
  * -v /tmp/log_jb1:/opt/jboss-as-7.1.1.Final/standalone/log leberkas/jb to -v /tmp/log_jb2:/opt/jboss-as-7.1.1.Final/standalone/log -- this are the log locations - please chose some folder/disk wthich suite your space requirements.
