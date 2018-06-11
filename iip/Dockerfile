#
# Copyright (c) 2009-2017. Authors: see NOTICE file.
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

FROM cytomineuliege/base

MAINTAINER Cytomine Team "support@cytomine.be"

RUN apt-get -y update && \
    apt-get install -y \
      git \
      libjpeg8-dev \
      libmemcached-dev \
      libopenjpeg-dev \
      libssl-dev \
      libtiff5-dev \
      libpng-dev \
      psmisc \
      software-properties-common && \
      apt-get -y build-dep openslide

# Nginx
RUN mkdir -p /opt/nginx
WORKDIR /opt/nginx
RUN wget http://nginx.org/download/nginx-1.10.1.tar.gz
RUN tar -zxvf nginx-1.10.1.tar.gz
ADD nginx.conf.sample /tmp/nginx.conf.sample

#openslide 2015/04/21
RUN cd /tmp && git clone https://github.com/openslide/openslide && cd /tmp/openslide && git checkout tags/v3.4.1 && \
    autoreconf -i && ./configure && make && make install

#IIP Image Server
ADD https://api.github.com/repos/cytomine-uliege/iipsrv/git/refs/heads/master /tmp/iipsrv-version.json
RUN cd /tmp && git clone https://github.com/cytomine-uliege/iipsrv && cd /tmp/iipsrv  && sh autogen.sh && ./configure && make
RUN mkdir -p /usr/local/httpd/fcgi-bin && cp /tmp/iipsrv/src/iipsrv.fcgi /usr/local/httpd/fcgi-bin/iipsrv.fcgi


RUN ldconfig -v

RUN mkdir -p /opt/cytomine/bin
ADD start-iip.sh /opt/cytomine/bin/start-iip.sh
ADD stop-iip.sh /opt/cytomine/bin/stop-iip.sh
ADD check-iip-status.py /opt/cytomine/bin/check-iip-status.py
ADD crontab /tmp/crontab
ADD iipservice /etc/init.d/iip
RUN chmod 755 /etc/init.d/iip
RUN chmod +x /opt/cytomine/bin/stop-iip.sh
RUN chmod +x /opt/cytomine/bin/start-iip.sh

ADD deploy.sh /tmp/deploy.sh
RUN chmod +x /tmp/deploy.sh

ENTRYPOINT ["/tmp/deploy.sh"]
