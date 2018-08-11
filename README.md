# Purpose
This repo extends the container image provided by romero for use 
in OpenShift environments. These changes: 
- modify the broker.xml configuration with pod IP addreses
- inject the namespace into the jgroups_ping.xml configuration file
- mounts configuration files from a ConfigMap

# Configurations
There are 2 templated configurations that can be utilized: 

## Artemis Empheral

## Artemis Persistent

### Tested on
- OpenShift 3.7+

### TODO
- Add templates
- (Improvement) Create a cleaner dynamic configuration for k8s

# Credit
Thanks to Victor Romero https://github.com/vromero and contributors 
for maintaining current versions of artemis which makes this config 
easy to extend. 

- https://github.com/vromero/activemq-artemis-docker
- https://hub.docker.com/r/vromero/activemq-artemis/

