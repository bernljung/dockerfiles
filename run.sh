#!/bin/sh
#
# This script allows you to launch several images
# from this repository once they're built.
#
# Make sure you add the `docker run` command
# in the header of the Dockerfile so the script
# can find it and execute it.

trap ctrl_c INT

function ctrl_c() {
  echo "Trapped CTRL-C"
  exit 1
}

NAME=$(basename "$0")
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
cd $DIR

if [ $# -eq 0 ]; then
	echo "Usage: $0 [--test] "
	exit 1
fi

if [ "$1" = "--test" ]; then
	TEST=1
fi

if [ ! -d $NAME ]; then # Ensure that directory exists
  echo "unable to find container configuration with name $NAME"
  exit 1
fi

script=`sed -n '/docker run/,/^#$/p' $NAME/Dockerfile \
  | sed -e 's/\#//' \
  | sed -e 's/\\\//'`


if [ -e ${NAME}/.env ]; then
  script=`echo $script | sed -e "s%docker run%docker run --env-file ${NAME}/.env%g"`
fi

if [ $TEST ]; then
  echo $script
else
  eval $script
fi