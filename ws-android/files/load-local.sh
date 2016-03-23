cd /home/ubuntu

git clone https://github.com/c9/core.git c9sdk

cd c9sdk

sudo ./scripts/install-sdk.sh

. ~/.nvm/nvm.sh

./server.js -p 8080 -l 0.0.0.0 -a :
