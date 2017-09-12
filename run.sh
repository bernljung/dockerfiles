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

name=$(basename "$0")
source="${BASH_SOURCE[0]}"
while [ -h "$source" ]; do # resolve $source until the file is no longer a symlink
  dir="$( cd -P "$( dirname "$source" )" && pwd )"
  source="$(readlink "$source")"
  [[ $source != /* ]] && SOURCE="$DIR/$source" # if $source was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
dockerfile_dir="$( cd -P "$( dirname "$source" )" && pwd )"

if [ "$1" = "--test" ]; then
	test=1
fi

if [ ! -d $dockerfile_dir/$name ]; then # Ensure that directory exists
  echo "unable to find container configuration with name $name"
  exit 1
fi

script="$(sed -n '/docker run/,/^#$/p' $dockerfile_dir/$name/Dockerfile \
  | sed -e 's/\#//' \
  | sed -e 's/\\//')"


if [ -e $dockerfile_dir/$name/.env ]; then
  script="$(echo $script | sed -e "s%docker run%docker run --env-file $dockerfile_dir/$name/.env%g")"
fi

if [ $test ]; then
  echo $script
else
  eval $script
fi