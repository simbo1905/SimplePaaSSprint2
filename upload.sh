REPO=$1
FILE=$2
curl -k -v -u admin:admin123 --upload-file $FILE  https://nexus.demo.dfe.secnix.co.uk/repository/$REPO/
