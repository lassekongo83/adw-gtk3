#!/bin/bash
# Simple terminal script for submitting stuff to your git repository.

ADDFILES=$(git add -A);
read -r -p "Commit message: "  COMMIT_MESSAGE
COMMIT=$(git commit -m "$COMMIT_MESSAGE");
PUSH=$(git push -u origin main);

echo "$ADDFILES"
echo "$COMMIT"
echo "$PUSH"
