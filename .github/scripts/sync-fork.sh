#!/bin/bash

set -x
set -e

UPSTREAM_REPO=$1
BRANCH_MAPPING=$2


if [[ -z "$UPSTREAM_REPO" ]]; then
  echo "Missing \$UPSTREAM_REPO as first parameter"
  exit 1
fi

if [[ -z "$BRANCH_MAPPING" ]]; then
  echo "Missing \$SOURCE_BRANCH:\$DESTINATION_BRANCH"
  exit 1
fi

if ! echo "$UPSTREAM_REPO" | grep '\.git'; then
  UPSTREAM_REPO="https://github.com/${UPSTREAM_REPO}.git"
fi

echo "UPSTREAM_REPO=$UPSTREAM_REPO"
echo "BRANCHES=$BRANCH_MAPPING"

git config user.name "${GITHUB_ACTOR}"
git config user.email "${GITHUB_ACTOR}@users.noreply.github.com"
git remote set-url origin "https://x-access-token:${GITHUB_TOKEN}@github.com/${GITHUB_REPOSITORY}.git"

git remote add upstream "$UPSTREAM_REPO"
#git fetch upstream
git fetch upstream "${BRANCH_MAPPING%%:*}"
git remote -v

git rebase --autosquash --autostash "upstream/${BRANCH_MAPPING%%:*}"
git push --force origin "${BRANCH_MAPPING#*:}"

git remote rm upstream
git remote -v

