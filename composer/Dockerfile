# docker run -it --rm \
# -v $HOME:$HOME \
# -v $PWD:$PWD \
# -w $PWD \
# bernljung/composer "$@"
#
FROM composer:1.5

RUN apk add --update \
    --repository http://dl-cdn.alpinelinux.org/alpine/edge/main \
    --repository http://dl-cdn.alpinelinux.org/alpine/edge/community \
    php7-mysqli php7-mcrypt php7-mbstring

CMD [ "composer" ]