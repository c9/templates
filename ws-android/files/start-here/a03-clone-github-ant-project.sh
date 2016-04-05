#!/bin/bash  

#  only need to run this script with the command (do not type the #)
#  bash a03-clone-github-ant-project.sh
# best in cloud 9 to just right click this file and select run




echo "For help click on "
echo "$HELP_GITHUB/a03-clone-github-ant-project.sh.md"
echo ""


echo "Enter the Github repository URL, must end in .git example:"
echo "https://github.com/sitepoint-editors/TodoList"
echo ""
read MY_GIT_TO_CLONE

echo "What would you like to call the new directory. Usually it is called the name just before the .git example TodoList"
read wow4


cd /home/ubuntu/workspace/


git clone $MY_GIT_TO_CLONE $wow4



cd /home/ubuntu/workspace/$wow4

ant clean

ant debug



BATCHFILE="a05-clooud9-redo-build.sh"
#INDEXFILE="/home/ubuntu/workspace/index.html"



printf "#!/bin/bash\n" >> /home/ubuntu/workspace/$wow4/$BATCHFILE
printf "ant debug\n" >> /home/ubuntu/workspace/$wow4/$BATCHFILE

printf "printf \" $wow4-debug.apk, \$(date), <a href='../$wow4/bin/$wow4-debug.apk'>../$wow4/bin/$wow4-debug.apk</a><br>\"  >> $INDEXFILE"  >> /home/ubuntu/workspace/$wow4/$BATCHFILE






ls -l bin

echo "Look for you new android $wow4/bin $wow4-debug.apk"
echo "right-click run index.html, then preview-preview running application to view webpage with .apk"



echo "For help click on "
echo "$HELP_GITHUB/a03-clone-github-ant-project.sh.md"
echo ""



echo "Or just click this link and open the web page"
echo ""
echo "http://$C9_HOSTNAME"
