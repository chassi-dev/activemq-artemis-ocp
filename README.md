## Overview
This repo extends the container image provided by romero for use 
in OpenShift environments. These changes: 
- modify the broker.xml configuration with pod IP addreses
- inject the namespace into the jgroups_ping.xml configuration file
- mounts configuration files from a ConfigMap

## Configurations
There are 2 templates that can be utilized. Each 
depends on a buildconfig/image stream within the same project.  

#### Artemis Empheral
This template will create an empheral cluster of artmis pods that can 
be scaled as desired. It creates the following objects: 
- 1 statefulset `artemis-empheral`
- 1 configmap; `configmap-artemis-empheral`
- 1 route; `artemis-cluster-empheral`
- 1 service; `artemis-empheral` configured with `sessionAffinity: ClientIP`


#### Artemis Persistent
This template will create a replicated master/slave configuration. It 
should *not* be scaled. It creates the following objects: 
- 2 statefulsets; `artemis-master` and `artemis-slave`  
- 2 configmaps; `configmap-master-broker` and `configmap-slave-broker`  
- 2 routes; `artemis-persistent-master` and `artemis-persistent-slave`
- 2 services; `artemis-master` and `artemis-slave`

### Installation
Navigate to the templates directory and create the desired objects: 

```
oc create -f artemis-buildconfig.yml
oc create -f artemis-empheral-template.yml
oc create -f artemis-persistent-replicated-template.yml
```

### Tested on
- OpenShift 3.7

### TODO
- Improve templates
- (Improvement) Create a cleaner dynamic configuration for k8s

## Credit
Thanks to Victor Romero https://github.com/vromero and contributors 
for maintaining current versions of artemis which makes this config 
easy to extend. 

- https://github.com/vromero/activemq-artemis-docker
- https://hub.docker.com/r/vromero/activemq-artemis/

