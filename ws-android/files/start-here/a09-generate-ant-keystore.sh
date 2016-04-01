#!/bin/bash  

#  only need to run this script with the command (do not type the #)
#  bash a09-generate-keystore.sh
#  best in cloud 9 to just right click this file and select run


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

sudo keytool -genkey -v -keystore $myStoreName.keystore -alias $myStoreName -keyalg RSA -keysize 2048 -validity 10000

echo ""
echo "Now we need to update your ant. properties file, which normally has nothing in it. It needs"
echo "key.store=/home/keystore/$myStoreName.keystore"
echo "key.alias=$myStoreName"

cd /home/ubuntu/workspace/$myStoreName



printf "\n\nkey.store=/home/keystore/$myStoreName.keystore\nkey.alias=$myStoreName"  >> /home/ubuntu/workspace/$myStoreName/ant.properties

ant release




# to view keystore information
# keytool -list -v -keystore $myStoreName.keystore












# keytool -list -v -keystore /home/david/Desktop/Keys/key.jks -alias MyAlias -storepass 456 -keypass 123

# or on one line
# echo y | keytool -genkeypair -dname "cn=Mark Jones, ou=JavaSoft, o=Sun, c=US" -alias business -keypass kpi135 -keystore /working/android.keystore -storepass ab987c -validity 9999

#or another one
#JAVA_HOME/bin/keytool
#                -genkeypair
#                -validity 10000
#                -dname "CN=company name,
#                        OU=organisational unit,
#                        O=organisation,
#                        L=location,
#                        S=state,
#                        C=country code"
#                -keystore DEV_HOME/AndroidTest.keystore
#                -storepass password
#                -keypass password
#                -alias AndroidTestKey
#                -keyalg RSA
#                -v  
  
  
#sudo keytool -exportcert -alias $myStoreName -keystore $myStoreName.keystore | openssl sha1 -binary | openssl base64

# or in three steps
# keytool -export -alias $myStoreName -file certfile.cer -keystore $myStoreName.store
# keytool -import -alias public$myStoreName -file certfile.cer -keystore public$myStoreName.store
# rm certfile.cer
# 
# JAVA_HOME/bin/jarsigner
#                -verbose
#                -keystore DEV_HOME/AndroidTest.keystore
#                -storepass password
# 	            -keypass password
#	              -signedjar DEV_HOME/bin/AndroidTest.signed.apk
#                DEV_HOME/bin/AndroidTest.unsigned.apk
#	              AndroidTestKey




#ANDROID_HOME/tools/zipalign
#                -v
#                -f
#                4
#                DEV_HOME/bin/AndroidTest.signed.apk
#                DEV_HOME/bin/AndroidTest.apk




#sudo keytool -exportcert -alias $myStoreName -keystore $myStoreName.keystore -list -v



#sometimes the following is needed
#keytool -exportcert -alias $myStoreName -keystore $myStoreName.keystore | openssl sha1 -hex




#notes
#To specify your keystore and alias, open the project ant.properties file (found in the root of the project directory) and add entries for key.store and key.alias as below

#key.store=<App-Name>.keystore
#key.alias=Alias-Name
#Save your changes. Now you can build a signed .apk in release mode

#Open a command-line and navigate to the root of your project directory.
#Use Ant to compile your project in release mode:

#ant release


#Good reference
#http://geosoft.no/development/android.html




cd bin

# Make the following a full path to where your index.html file is /home/ubuntu/workspace/www/index.html
#printf "\n\n<a href='../$wow4/bin/$wow4--release.apk'>../$wow4/bin/$wow4--release.apk</a><br>"  >> /home/ubuntu/workspace/index.html
printf "\n\n<a href='../$myStoreName/bin/$myStoreName-release.apk'>../$myStoreName/bin/$myStoreName-release.apk</a><br>"  >> /home/ubuntu/workspace/index.html

ls -l

echo "Look for you new android $wow4/bin $wow4--release.apk"
echo "right-click run index.html, then preview-preview running application to view webpage with .apk"


echo "Or just click this link and open the web page"
echo ""
echo ""
echo ""

echo "http://$C9_HOSTNAME"
