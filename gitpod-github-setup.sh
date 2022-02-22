# To use this file in bash terminal:
# chmod +x gitpod-github-setup.sh
# then you will be able to run:
# ./gitpod-github-setup.sh


githubRepo=${PWD##*/}
printf '%s\n' "$githubRepo"

echo Hello, are you using main or master branch?

read mainOrMaster

echo Thanks, please enter your github user name:

read githubUserName

echo "hello ${githubUserName}"

echo "************************ Now Repointing gitpod to your github repository *************************"
echo "--------------------------------------------------------------------------------------------------"
echo "-------------------------------------- Current git remote: ---------------------------------------"

git remote -v
git status

echo "--------------------------------------------------------------------------------------------------"

echo "-------------------------------------- Removing git remote: --------------------------------------"

git remote remove origin
git status

echo "-------------------------------------- git remote removed ----------------------------------------"

git remote -v

echo "--------------------------------------------------------------------------------------------------"

echo "--------- Repointing git remote to your user repo -> ${githubUserName}/${githubRepo} -------------"

git remote add origin https://github.com/${githubUserName}/${githubRepo}
git remote -v

echo "--------------------------------------------------------------------------------------------------"

echo "Now your git remote is repointed - pushing to your gihub user repo -> ${githubUserName}/${githubRepo}"

git status
git push -u origin ${mainOrMaster}
git status

echo "********************** Finished Repointing gitpod to your github repository **********************"
