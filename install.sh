#!/bin/sh
dockerfiles_dir=$(pwd)
run_script="$(echo $dockerfiles_dir/run.sh)"

if [ $# -eq 0 ]; then
	echo "Usage: $0 image1 image2 ..."
	exit 1
fi

cd /usr/local/bin
for name in "$@"; do
	if [ ! -d $dockerfiles_dir/$name ]; then
		echo "unable to find container configuration with name $name"
		exit 1
	fi

  if [ -e $name ]; then
    symlink=`readlink $name`
    if [ "$symlink" == "$dockerfiles_dir/run.sh" ]; then
      echo "$name is already installed in /usr/local/bin"
    else
      echo "$name cannot be installed, another binary is already installed in /usr/local/bin with that name"
    fi
  else
    ln -s $dockerfiles_dir/run.sh $name
    echo "installed $name"
  fi


	shift
done