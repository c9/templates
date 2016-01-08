
     ,-----.,--.                  ,--. ,---.   ,--.,------.  ,------.
    '  .--./|  | ,---. ,--.,--. ,-|  || o   \  |  ||  .-.  \ |  .---'
    |  |    |  || .-. ||  ||  |' .-. |`..'  |  |  ||  |  \  :|  `--, 
    '  '--'\|  |' '-' ''  ''  '\ `-' | .'  /   |  ||  '--'  /|  `---.
     `-----'`--' `---'  `----'  `---'  `--'    `--'`-------' `------'
    ----------------------------------------------------------------- 


This is a test of the Android SDK as an image on Cloud9.

To test if paths are working correctly try these commands in the terminal

python --version

pip list

java -version

javac -version

ant -v

android -h    (might be bash android -h)







To find where the program is saved try this command with any of the above

readlink -f $(which python)

readlink -f $(which java)

readlink -f $(which javac)


also try

$PATH

or

echo $PATH

Possibly what may work is commands like

echo $ANDROID_SDK_HOME

