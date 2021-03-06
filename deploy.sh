#!/bin/bash

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

# Clear folder first
# rm -rf ../classandobjectspage/*.html

# copy CNAME
# cp CNAME ../classandobjectspage

# Build the project.
hugo -d ../classandobjectspage

# Change directory
cd ../classandobjectspage

# Add changes to git.
git add -A

# Commit changes.
msg="rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

# Push source and build repos.
git push
