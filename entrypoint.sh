#!/bin/sh

set -e

sh -c "/init-git.sh $*"

DESTINATION=$1

REPOSITORY="$(basename "$GITHUB_REPOSITORY")"

SOURCE_REPO="git@github.com:$GITHUB_REPOSITORY"
DESTINATION_REPO="git@$DESTINATION.com:$GITHUB_ACTOR/$REPOSITORY"

echo "SOURCE_REPO: $SOURCE_REPO"
echo "DESTINATION_REPO: $DESTINATION_REPO"

git clone --mirror "$SOURCE_REPO" && cd "$REPOSITORY"
git remote set-url --push origin "$DESTINATION_REPO"

git fetch -p origin

# Exclude refs created by GitHub for pull request.
git for-each-ref --format 'delete %(refname)' refs/pull | git update-ref --stdin
git push --mirror
