#!/bin/bash

echo "Checking if there is any changes...."
git status

sleep 3


echo "Newly changed files are adding to the stage...."
git add .

echo "Committing to Stage...."
git commit -m "update"

echo "Uploading to Github...."
git push

echo "All files are uploaded to Gibhub." 
echo "Check your new files on the Gibhub."
