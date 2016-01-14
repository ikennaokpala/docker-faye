FROM node
MAINTAINER Ikenna N. Okpala <me@ikennaokpala.com>

RUN npm install faye

ENV PORT=9292 TIMEOUT=45 MOUNT=/faye

RUN /bin/bash -l -c "wget https://gist.githubusercontent.com/ikennaokpala/e0860c5d5b9aad73d64e/raw/9eb462d8caa144281603505a01af5f5f88786485/docker_faye.js -O server.js"

ENTRYPOINT node server.js
