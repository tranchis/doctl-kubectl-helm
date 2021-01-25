FROM ubuntu:focal

ENV DOCTL_VERSION=1.54.0
ENV KUBECTL_VERSION=1.20.2
ENV HELM_VERSION=3.5.0

RUN apt-get update && apt-get install -y wget
RUN cd /tmp && wget -q https://github.com/digitalocean/doctl/releases/download/v${DOCTL_VERSION}/doctl-${DOCTL_VERSION}-linux-amd64.tar.gz \
    && tar xf doctl-${DOCTL_VERSION}-linux-amd64.tar.gz && mv doctl /usr/local/bin && rm -f *.tar.gz
RUN cd /tmp && wget -q https://dl.k8s.io/release/v${KUBECTL_VERSION}/bin/linux/amd64/kubectl && mv kubectl /usr/local/bin
RUN cd /tmp && wget -q https://get.helm.sh/helm-v${HELM_VERSION}-linux-amd64.tar.gz \
    && tar xf helm-v${HELM_VERSION}-linux-amd64.tar.gz && mv linux-amd64/helm /usr/local/bin && rm -fR *.tar.gz linux-amd64



