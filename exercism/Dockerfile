# docker run -it --rm \
#	--log-driver none \
# -v $EXERCISM_ROOT:/root \
# -v $PWD:/mnt \
# -w /mnt \
#	bernljung/exercism "${args[@]}"
#
FROM ubuntu:17.10
LABEL maintainer "Jimmy Bernljung <jimmy.bernljung@gmail.com>"

RUN apt-get update && \
  apt-get install -y wget

RUN wget https://github.com/exercism/cli/releases/download/v2.4.1/exercism-linux-64bit.tgz
RUN tar -xzvf exercism-linux-64bit.tgz
RUN mv exercism /usr/local/bin

ENTRYPOINT [ "/usr/local/bin/exercism" ]
