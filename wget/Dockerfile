# docker run -it --rm \
#	--log-driver none \
# -v $PWD:/mnt \
# -v $dockerfile_dir/docker_bridge_hosts:/etc/hosts \
# -w /mnt \
#	bernljung/wget "${args[@]}"
#
FROM ubuntu:17.10
LABEL maintainer "Jimmy Bernljung <jimmy.bernljung@gmail.com>"

RUN apt-get update && \
  apt-get install -y wget

ENTRYPOINT [ "wget" ]
