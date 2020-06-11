FROM ubuntu:latest

RUN apt update && apt-get install curl -y && apt-get install unzip -y && apt-get install gpg -y && apt-get install jq -y \
&& apt-get install python3 -y && apt-get install python3-pip -y && apt-get install git -y && apt-get install sudo -y \
&& mkdir -p /opt/tools && mkdir -p /opt/work
RUN cd /opt/work && curl -LO "https://get.helm.sh/helm-v3.2.1-linux-amd64.tar.gz"  && tar xzf helm-v3.2.1-linux-amd64.tar.gz \
&& curl -LO "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip"  && unzip awscli-exe-linux-x86_64.zip && ./aws/install \
&& curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.18.0/bin/linux/amd64/kubectl && chmod a+x kubectl \
&& mv kubectl /opt/tools/ && mv linux-amd64/helm /opt/tools/ && rm -rf /opt/work
RUN pip3 install yq

ENV PATH "/opt/tools:$PATH"
RUN helm plugin install https://github.com/futuresimple/helm-secrets

WORKDIR /opt/tools


