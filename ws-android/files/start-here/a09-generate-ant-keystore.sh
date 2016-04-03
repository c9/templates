#!/bin/bash  

#  only need to run this script with the command (do not type the #)
#  bash a09-generate-keystore.sh
#  best in cloud 9 to just right click this file and select run






# make the keystore if it has not already been made

sudo mkdir /home/keystore

cd /home/keystore

echo "You will be asked for two passwords to enter. A keystore password and a key (alias) password for this app". 
echo "Both passwords can be the same"
echo "This will become the name of the keystore file, and will also be the alias name"
echo "You can have one keystore file for lots of Apps, but we are doing it simply"
echo ""
echo "Enter the main directory name for your App. Example helloAnt"
read myStoreName





#keytool -genkey -v -keystore $myStoreName.keystore -alias $myStoreName -keyalg RSA -validity 999999
#keytool -genkey -v -keystore <App-Name>.keystore -alias <Alias Name> -keyalg RSA -keysize 2048 -validity 10000




echo "checking if keystore for this folder has been made"

if [ -d /home/keystore/$myStoreName.keystore ]
  then
     echo "Making new keystore for $myStoreName"
     sudo keytool -genkey -v -keystore $myStoreName.keystore -alias $myStoreName -keyalg RSA -keysize 2048 -validity 10000
  else
     echo "keystore for $myStoreName has already been made"
fi














echo ""
echo "Now we need to update your ant. properties file, which normally has nothing in it. It needs"
echo "key.store=/home/keystore/$myStoreName.keystore"
echo "key.alias=$myStoreName"

cd /home/ubuntu/workspace/$myStoreName



printf "\n\nkey.store=/home/keystore/$myStoreName.keystore\nkey.alias=$myStoreName"  >> /home/ubuntu/workspace/$myStoreName/ant.properties

ant release




# to view keystore information
# keytool -list -v -keystore $myStoreName.keystore







BATCHFILE="a09-cloud9-make-release.sh"
INDEXFILE="/home/ubuntu/workspace/index.html"

#making my life easier
wow4=$myStoreName




printf "#!/bin/bash\n" >> /home/ubuntu/workspace/$wow4/$BATCHFILE
printf "ant release\n" >> /home/ubuntu/workspace/$wow4/$BATCHFILE

printf "printf \" $wow4-release.apk, \$(date), <a href='../$wow4/bin/$wow4-release.apk'>../$wow4/bin/$wow4-release.apk</a><br>\"  >> $INDEXFILE"  >> /home/ubuntu/workspace/$wow4/$BATCHFILE

printf "\n\n$wow4-release.apk, $(date), <a href='../$wow4/bin/$wow4-release.apk'>../$wow4/bin/$wow4-release.apk</a><br>"  >> $INDEXFILE




cd /home/ubuntu/workspace/$wow4/bin

echo "Look for you new android $wow4/bin $wow4-release.apk"
echo "right-click run index.html, then preview-preview running application to view webpage with .apk"
echo ""
echo ""
echo "Click this link to open your index.html web page"
echo ""
echo ""

echo "http://$C9_HOSTNAME"
