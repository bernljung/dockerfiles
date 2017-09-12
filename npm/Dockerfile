# docker run -it --rm \
# -v /var/run/docker.sock:/var/run/docker.sock \
# -v $HOME:$HOME \
# -v /usr/local/lib/npm-global:/usr/local/lib/npm-global
# -v $PWD:$PWD \
# -w $PWD \
# bernljung/node npm "$@"
#
FROM node:8-alpine
LABEL maintainer "Jimmy Bernljung <jimmy.bernljung@gmail.com>"

RUN apk update && \
    apk add docker \
    py-pip && \
    pip install docker-compose && \
    rm -rf /var/cache/apk/*

CMD ["npm"]