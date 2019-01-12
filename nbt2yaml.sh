#!/bin/sh

# A wrapper script for invoking nbt2yaml with docker
# Put this script in $PATH as `nbt2yaml`
# CREDIT: https://spin.atomicobject.com/2015/11/30/command-line-tools-docker/

PROGNAME="$(basename $0)"
VERSION="latest"
ENTRYPOINT="/usr/local/bin/nbt2yaml"

case $PROGNAME in
  "nbtedit")
    ENTRYPOINT="/usr/local/bin/nbtedit"
    ;;
  "yaml2nbt")
    ENTRYPOINT="/usr/local/bin/yaml2nbt"
    ;;
  "nbt2yaml")
    ENTRYPOINT="/usr/local/bin/nbt2yaml"
    ;;
esac

# Helper functions for guards
error(){
  error_code=$1
  echo "ERROR: $2" >&2
  echo "($PROGNAME wrapper version: $VERSION, error code: $error_code )" &>2
  exit $1
}
check_cmd_in_path(){
  cmd=$1
  which $cmd > /dev/null 2>&1 || error 1 "$cmd not found!"
}

# Guards (checks for dependencies)
check_cmd_in_path docker
docker ps > /dev/null 2>&1 || error 2 "No active docker running."

# Set up mounted volumes, environment, and run our containerized command
exec docker run \
  --interactive --tty --rm \
  --entrypoint=$ENTRYPOINT \
  --volume "$PWD":/wd \
  --workdir /wd \
  "dayne/nbt2yaml:$VERSION" "$@"
