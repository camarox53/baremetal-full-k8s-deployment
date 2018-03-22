# baremetal-full-k8s-deployment
Full scale k8s deployment via Ansible on bare metal

### Provisioning is done by Ansible 
### Docker is used to house the service  
### GlusterFS is used to handle persistant storage 
  - Originally implimented with out using an Ansible module due to the lack of it's existance, that has since changed and needs updated. 
### Haproxy for loadbalancing connections between the nodes and handling service status checks 
### Keepalived for making sure the nodes are working and in the pool as well as failover. 
### Etcd for distributed key value store
### Flanneld for software defined networking for container communication. 

#### Use at your own risk, this is in Beta for the time being. 
