# Ansible Commands 
Remember to put your hosts' IPs in the inventory file (& ensure SSH connection will work)
## Run manually 
ansible-playbook -i inventory ansible-install-docker.yml
ansible-playbook -i inventory ansible-install-kubernetes.yml
## Run manually: 
ansible-playbook -i inventory ansible-kube-release.yml
ansible-playbook -i inventory ansible-kube-release.yml --tags "deploy"
## Run via Jenkins
ansible-playbook -i inventory ansible-kube-release.yml --tags "update"
or:
sh "ansible-playbook -i inventory ansible-kube-release.yml --tags update"


## purely for dev (run this on the host/target machine)

Remember to make sure the IPs are correct (when using dynamic IPs [and not elastic associated IPs])

testing gh + jenkins with http - working?