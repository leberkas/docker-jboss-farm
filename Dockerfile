#
#
#
#
#
#


FROM centos

RUN http_proxy=http://proxy:80/ yum install -y java-1.7.0-openjdk.x86_64
RUN http_proxy=http://proxy:80/ yum update -y

RUN http_proxy=http://proxy:80/ wget -O /tmp/jboss.tgz http://download.jboss.org/jbossas/7.1/jboss-as-7.1.1.Final/jboss-as-7.1.1.Final.tar.gz
RUN tar -C /opt -xzf /tmp/jboss.tgz

RUN ln -s /opt/jboss-as-7.1.1.Final/ /opt/jboss

RUN useradd -u 501 -d /opt/jboss jboss

RUN mkdir /opt/jboss/standalone/log


ADD start.sh /root/bin/start.sh

ADD standalone.xml /opt/jboss-as-7.1.1.Final/standalone/configuration/standalone.xml
ADD app1 /opt/jboss-as-7.1.1.Final/standalone/deployments

RUN chown -R jboss.jboss /opt/jboss/standalone/

CMD /root/bin/start.sh
