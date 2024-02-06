FROM ubuntu:22.04
ENV ANSIBLE_VERSION 2.12.0
RUN apt-get update; \
    apt-get install -y gcc python3; \
    apt-get install -y python3-pip; \
    apt-get install -y vim; \
    apt-get install -y sshpass; \
    apt-get clean all
RUN pip3 install --upgrade pip; \
    pip3 install "ansible==${ANSIBLE_VERSION}"; \
    pip3 install ansible

VOLUME /ansible 
WORKDIR /ansible 
RUN mkdir /etc/ansible /ansible/log 
COPY ./ansible.cfg /etc/ansible/
ENTRYPOINT ["sh", "-c"]