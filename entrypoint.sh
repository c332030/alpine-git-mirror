#!/bin/sh

set -e

sh -c "/init-git-ssh.sh $*"
sh -c "/mirror.sh $*"

if [ -n "$COMMAND" ]
then
  echo execute command
  sh -c "${COMMAND}" || true
fi
