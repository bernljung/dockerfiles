# docker run -it --rm \
# --log-driver none \
# -v $PWD:/mnt \
# -w /mnt \
# bernljung/unzip "${args[@]}"
#
FROM alpine:latest
LABEL maintainer "Jimmy Bernljung <jimmy.bernljung@gmail.com>"

RUN apk add --update unzip && \
    rm -rf /var/cache/apk/*

ENTRYPOINT [ "unzip" ]
