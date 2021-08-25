#!/bin/sh

set -e

sh -c "/init-git-ssh.sh $*"
sh -c "/mirror.sh $*"

if [ -n "$COMMAND" ]
then
  echo
  echo execute command
  echo
  sh -c "${COMMAND}" || true
fi
