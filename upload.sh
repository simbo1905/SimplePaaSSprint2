REPO=$1
FILE=$2
echo curl -k -v -u admin:admin123 --upload-file $FILE  https://nexus.demo.dfe.secnix.co.uk/repository/$REPO/
curl -k -v -u admin:admin123 --upload-file $FILE  https://nexus.demo.dfe.secnix.co.uk/repository/$REPO/
