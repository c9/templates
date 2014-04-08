SERVER=http://c9.logicblox.com
WORKSPACE=c9ws-$C9_USER-$C9_PROJECT-$C9_PID
set -ex

mkdir -p .lbsettings
cd ~/.lbsettings
echo $SERVER > server
echo $WORKSPACE > workspace

curl -X POST \
     -H 'Content-Type: application/json' \
     -H 'Accept: application/json' \
     -d '{"create": {"name": "'$WORKSPACE'"}}' \
     --user logicblox:cloud9lb $SERVER/connectblox

rm -f bin/init.sh bin/merge-to-other-templates.sh
