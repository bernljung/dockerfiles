# docker run -it --rm \
# --log-driver none \
# -v $PWD:/mnt \
# -w /mnt \
# bernljung/curl "${args[@]}"
#
FROM alpine:latest
LABEL maintainer "Jimmy Bernljung <jimmy.bernljung@gmail.com>"

RUN apk add --update curl && \
    rm -rf /var/cache/apk/*

ENTRYPOINT [ "curl" ]
