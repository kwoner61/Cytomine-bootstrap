#
# Copyright (c) 2009-2018. Authors: see NOTICE file.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

FROM cytomineuliege/java8

MAINTAINER Cytomine Team "support@cytomine.be"

ARG SINGULARITY_VERSION=2.4.5

RUN apt-get -y update && \
    apt-get -y install \
        apt-transport-https \
        ca-certificates \
        curl \
        git \
        g++ \
        language-pack-en-base \
        libglib2.0-0 \
        lxc \
        iptables \
        make \
        zip \
        libhdf5-dev \
        squashfs-tools \
        openssh-client \
        libarchive-dev

RUN dpkg-reconfigure locales

# Groovy installation
RUN rm /bin/sh && ln -s /bin/bash /bin/sh
ENV CURL_CA_BUNDLE /etc/ssl/certs/ca-certificates.crt
RUN cd /tmp/ && curl http://get.sdkman.io | bash
RUN /bin/bash -c "source /root/.sdkman/bin/sdkman-init.sh && sdk install groovy 2.4.4 --yes"

# Singularity installation
RUN wget https://github.com/singularityware/singularity/releases/download/$SINGULARITY_VERSION/singularity-$SINGULARITY_VERSION.tar.gz && \
    tar xvf singularity-$SINGULARITY_VERSION.tar.gz && \
    cd singularity-$SINGULARITY_VERSION && \
    ./configure --prefix=/usr/local && \
    make && \
    make install

# Software-router Installation
RUN mkdir -p /software_router && \
    cd /software_router
    # wget
ADD Cytomine-software-router.jar /software_router/
ADD log4j.properties /software_router/

ADD config.groovy /tmp/

# Fix path
ENV GROOVY_HOME /root/.sdkman/candidates/groovy/current
ENV GROOVY_PATH /root/.sdkman/candidates/groovy/current/bin/groovy

# Create software_router directories
RUN mkdir -p /software_router/algo
RUN mkdir -p /software_router/logs

ADD deploy.sh /tmp/deploy.sh
RUN chmod +x /tmp/deploy.sh

ENTRYPOINT ["/tmp/deploy.sh"]
