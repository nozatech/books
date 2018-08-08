#!/bin/bash

echo -e "\e[1;42m >>> Checking if there is any changes....<<< \e[0m"
# echo -e "\e[1;42m This is green background! \e[0m"
git status  | tee gitStatusLog.tmp

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
echo	#space
echo	#space



echo ">>>Newly changed files are adding to the stage....<<<"
git add .
echo 
echo

echo ">>>Committing to Stage....<<<"
git commit -m "update"
echo
echo

echo ">>>Uploading to Github....<<<"
git push
echo 
echo

echo ">>>All files are uploaded to Gibhub.<<<" 
echo ">>>Check your new files on the Gibhub.<<<"


rm -f 	gitStatusLog.tmp
echo ">>>The Temp file has been REMOVED<<<"