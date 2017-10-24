

# Nexus3 for OpenShift V3

## Installing into OpenShift V3

Setting up on OpenShift (either CDK or Online Pro): 

```
# login to your openshift (here I am using my minishift local)
 oc login -u system:admin https://192.168.99.100:8443
# create a project
oc new-project nexus3
# check you have the volume I used in my yaml (these exist in minishift)
oc get pv | fgrep pv0001
# If you didn't find it you are going to have to author some yaml to create it
# else create it on the Pro console and call it 'claim1'
# The following creates a claim for pv0001 which works for minishift but not Online  Pro (use the console):
cat pvc.yaml | oc create -f -
# Now create the "nexus3" pod (note it will die on Online Pro with out the big memory allowance of 1.2Gi):
cat nexus3_pod.yaml | oc create -f -
# create the "nexus3" service:
cat nexus3_service.yaml | oc create -f -
# to see what happens poll the event log with:
oc get events
# now create a route
oc expose svc/nexus
```

## Runing the nexus example scripts locally

```
# download groovy into the containers persistent volume space
cd nexus-data
wget https://bintray.com/artifact/download/groovy/maven/apache-groovy-binary-2.4.8.zip
unzip apache-groovy-binary-2.4.8.zip

# download the demo scripts
wget https://github.com/sonatype/nexus-book-examples/archive/nexus-3.x.zip
unzip nexus-3.x.zip

docker run -d -p 8081:8081 --name nexus3 -v /Users/Shared/nexus3/nexus-data:/nexus-data sonatype/nexus3
docker exec -it nexus3 bash
cd /nexus-data/script
export GROOVY_HOME=/nexus-data/groovy-2.4.8
export PATH=$PATH:$GROOVY_HOME/bin
./provision.sh
```