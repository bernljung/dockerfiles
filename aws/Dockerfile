# docker run -it --rm \
# --log-driver none \
# -v $HOME/.aws:/root/.aws \
# -v $PWD:/mnt \
# -w /mnt \
#	bernljung/aws "${args[@]}"
#
FROM alpine:latest
LABEL maintainer "Jimmy Bernljung <jimmy.bernljung@gmail.com>"

RUN apk --no-cache update && \
    apk --no-cache add python py-pip py-setuptools ca-certificates curl groff less && \
    pip --no-cache-dir install awscli && \
    rm -rf /var/cache/apk/*

ENTRYPOINT [ "aws" ]
