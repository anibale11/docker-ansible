## Ansible on Ubuntu Container

### build ansible container 

docker build -t anibale/ansible-ubuntu:2.12.0 .

### run ansible on docker for ping servers inventory
```
docker run -it --rm \
  -v ${PWD}:/ansible \
  anibale/ansible-ubuntu:2.12.0 \
  ansible servers -m ping -i inventory  
```
```
docker run -it --rm \
  -v ${PWD}:/ansible \
  anibale/ansible-ubuntu:2.12.0 \
  -c "ansible servers -m ping -i inventory"  
```

### run container and interact
> ejecutar lo siguiente de acuerdo a donde se usarán los playbooks

```
docker run -it --rm \
  -v ${PWD}:/ansible \
  anibale/ansible-ubuntu:2.12.0 bash
```

### run playbook on ansible
```
docker run -it --rm \
  -v ${PWD}:/ansible \
  anibale/ansible-ubuntu:2.12.0 \
  -c "ansible-playbook docker_example.yml -l servers -i inventory"
```

### fixes 
*   > Ansible provisioning ERROR! Using a SSH password instead of a key is not possible
 "create vi /etc/ansible/ansible.cfg and write the file ``` [defaults] host_key_checking = false``` "
 [link]: (https://stackoverflow.com/questions/42462435/ansible-provisioning-error-using-a-ssh-password-instead-of-a-key-is-not-possibl)
