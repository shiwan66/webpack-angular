FROM jenkins

USER root
ARG dockerGid=0


ENV NODE_VERSION 6.9.4

#add jenkins to docker group and install nodejs/npm

RUN echo "docker:x:${dockerGid}:jenkins" >> /etc/group \
    && cd /home \
    && curl -SLO "https://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-linux-x64.tar.xz" \
    && xz -d "node-v$NODE_VERSION-linux-x64.tar.xz" \
    && tar xvf "node-v$NODE_VERSION-linux-x64.tar" \
    && ln -s /home/node-v$NODE_VERSION-linux-x64/bin/node /usr/local/bin/node \
    && ln -s /home/node-v$NODE_VERSION-linux-x64/bin/npm /usr/local/bin/npm \
    && rm -rf "node-v$NODE_VERSION-linux-x64.tar"


USER jenkins
