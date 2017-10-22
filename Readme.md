# Nexus3 for OpenShift V3

Setting up: 

```
# login to your openshift 
 oc login -u system:admin https://192.168.99.100:8443
# create a project
oc new-project nexus3
# check you have the volume I used in my yaml
oc get pv | fgrep pv0001
# If you didn't find it you are going to have to author some yaml to create it
# Create the persistent volume claim for the volumen pv0001:
cat pvc.yaml | oc create -f -
# create the "nexus3" pod:
cat nexus3_pod.yaml | oc create -f -
# create the "nexus3" service:
cat nexus3_service.yaml | oc create -f -
```

Until I rebuilt the image with zip and other files I was having to get script onto it by bashing into the upstream image: 

```

/opt/jdk1.8.0_144/bin/javac UnZip.java   
```

### TODO 

[_] Upstream sonatype/nexus3 is using centos/centos7 rather than openshift/centos7