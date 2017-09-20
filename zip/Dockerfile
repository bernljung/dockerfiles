# docker run -it --rm \
# --log-driver none \
# -v $PWD:/mnt \
# -w /mnt \
# bernljung/zip "${args[@]}"
#
FROM alpine:latest
LABEL maintainer "Jimmy Bernljung <jimmy.bernljung@gmail.com>"

RUN apk add --update zip && \
    rm -rf /var/cache/apk/*

ENTRYPOINT [ "zip" ]
