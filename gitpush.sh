#!/bin/bash


echo "Checking if there is any changes...."
git status  > gitStatusLog.tmp

### gitStatusLog.tmp's output will be:
# On branch master
# Your branch is up-to-date with 'origin/master'.
# nothing to commit, working directory clean
###

match="nothing to commit"
while read -r line
do
	if [[ $match =~ "nothing to commit" ]]
	then break;
	fi
done < gitStatusLog.tmp


sleep 3
echo
echo



echo "Newly changed files are adding to the stage...."
git add .
echo 
echo

echo "Committing to Stage...."
git commit -m "update"
echo
echo

echo "Uploading to Github...."
git push
echo 
echo

echo "All files are uploaded to Gibhub." 
echo "Check your new files on the Gibhub."
