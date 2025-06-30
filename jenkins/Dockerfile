FROM jenkins/jenkins:lts

USER root

COPY install-plugins.sh /usr/local/bin/
COPY plugins.txt /usr/share/jenkins/ref/

RUN ls -l /usr/local/bin && cat /usr/local/bin/install-plugins.sh && \
    chmod +x /usr/local/bin/install-plugins.sh && \
    /usr/local/bin/install-plugins.sh

RUN apt-get update && apt-get install -y python3-pip
RUN pip3 install checkov --break-system-packages
RUN apt-get update && apt-get install -y docker.io


# Instala Docker CLI
RUN apt-get update && \
    apt-get install -y apt-transport-https ca-certificates curl gnupg lsb-release && \
    curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg && \
    echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" \
        > /etc/apt/sources.list.d/docker.list && \
    apt-get update && \
    apt-get install -y docker-ce-cli



RUN usermod -aG docker jenkins
USER jenkins
#apt-get update && \
#    apt-get install -y bash && \
#    chmod +x /usr/local/bin/install-plugins.sh && \
 #   bash /usr/local/bin/install-plugins.sh

#USER jenkins
