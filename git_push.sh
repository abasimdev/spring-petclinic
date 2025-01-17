# Script to Push changes to Remote Git repo

#!/bin/bash

status="$(git status -s)"
echo $status

if [ "$status" != "" ]; then

git add .
read -p "Enter commit message : " message
git commit -m $message
git push

else
echo "Nothing to commit."
fi
