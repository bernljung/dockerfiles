#!/bin/sh
dockerfiles_dir=$(pwd)

if [ $# -eq 0 ]; then
	echo "Usage: $0 image1 image2 ..."
	exit 1
fi

cd /usr/local/bin
for name in "$@"; do

  symlink=`readlink $name`

	if [ "$symlink" != "$dockerfiles_dir/run.sh" ]; then
		echo "unable to find installed container with name $name"
		exit 1
	fi

  rm $name
  echo "uninstalled $name"

	shift
done