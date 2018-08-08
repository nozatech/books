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




echo -e "\e[1;42m >>>Newly changed files are adding to the stage....<<< \e[0m"
git add .
echo 
echo

echo  -e "\e[1;42m >>>Committing to Stage....<<< \e[0m"


git commit -m "update"
echo
echo

echo  -e "\e[1;42m >>>Uploading to Github....<<< \e[0m"
git push
echo 
echo

echo  -e "\e[1;42m >>>All files are uploaded to Gibhub.<<< \e[0m"
echo  -e "\e[1;42m >>>Check your new files on the Gibhub.<<< \e[0m"


rm -f 	gitStatusLog.tmp
echo -e "\e[1;42m >>>The Temp file has been REMOVED<<< \e[0m"