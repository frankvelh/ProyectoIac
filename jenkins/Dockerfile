FROM jenkins/jenkins:lts

USER root

COPY install-plugins.sh /usr/local/bin/
COPY plugins.txt /usr/share/jenkins/ref/

RUN ls -l /usr/local/bin && cat /usr/local/bin/install-plugins.sh && \
    chmod +x /usr/local/bin/install-plugins.sh && \
    /usr/local/bin/install-plugins.sh


#apt-get update && \
#    apt-get install -y bash && \
#    chmod +x /usr/local/bin/install-plugins.sh && \
 #   bash /usr/local/bin/install-plugins.sh

#USER jenkins
