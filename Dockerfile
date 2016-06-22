FROM node
MAINTAINER Ikenna N. Okpala <me@ikennaokpala.com>

ENV PORT=${PORT} TIMEOUT=45 MOUNT=/faye
RUN npm install faye
RUN /bin/bash -l -c "wget https://gist.githubusercontent.com/ikennaokpala/e0860c5d5b9aad73d64e/raw/d40016edcf679f23122cdcdc00b0c9434aa5dbf5/docker_faye.js -O server.js"


ENTRYPOINT ["/bin/bash", "-l", "-c"]
CMD ["node server.js"]
