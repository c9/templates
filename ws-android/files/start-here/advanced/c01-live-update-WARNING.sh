#!/bin/bash  

# Find or copy this file to your cloud9 Android-SDK workspace
# run it with the command
# bash c01-live-update-WARNING.sh

#grabs the live update repository from github and merges the folder ubuntu files with your /home/ubuntu files including your workspace.


echo "Warning. This bash program updates your Docker Cloud9 Workspace potential replacing it with any file in the github repository at"
echo "https://github.com/hpssjellis/online-android-sdk-cloud9-live-update"
echo ""
echo "Please check the repository to make sure you want those files"
echo "Proceed Y/n"
read myAnswer
if [ $myAnswer == 'y' ] || [ $myAnswer == 'Y' ]
  then
    echo "Installing live update files from github"
    sudo git clone $LIVE_UPDATE_GITHUB /home/temp
    rsync -avh --progress /home/temp/ubuntu /home
    sudo rm -rf /home/temp

  else
    echo "Nothing new installed"
fi
  
echo "Live update files in the repository at"
echo "$LIVE_UPDATE_GITHUB"
echo ""  




echo "For help click on "
echo "$HELP_GITHUB/c01-live-update-WARNING.sh.md"
echo ""
