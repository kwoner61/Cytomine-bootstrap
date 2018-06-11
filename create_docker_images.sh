#!/bin/bash
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

#get all the config values.
. ./configuration.sh

cd base && docker build -t="cytomineuliege/base" .
cd ../memcached && docker build -t="cytomineuliege/memcached" .
cd ../rabbitmq && docker build -t="cytomineuliege/rabbitmq" .
cd ../java8 && docker build -t="cytomineuliege/java8" .
cd ../tomcat7 && docker build -t="cytomineuliege/tomcat7" .
cd ../postgres && docker build -t="cytomineuliege/postgres" .
cd ../postgis && docker build -t="cytomineuliege/postgis" .
cd ../mongodb && docker build -t="cytomineuliege/mongodb" .
cd ../auto_backup && docker build -t="cytomineuliege/backup" .
cd ../nginx && docker build -t="cytomineuliege/nginx" .
cd ../iip && docker build -t="cytomineuliege/iip" .
cd ../iip-jp2000 && docker build -t="cytomineuliege/iip-jp2000" .
cd ../bioformat && docker build -t="cytomineuliege/bioformat" .
cd ../ims && docker build -t="cytomineuliege/ims" .
cd ../core && docker build -t="cytomineuliege/core" .
cd ../software_router && docker build -t="cytomineuliege/software_router" .
cd ../retrieval && docker build -t="cytomineuliege/retrieval" .

if [ $IRIS_ENABLED = true ]
then
	cd ../iris && docker build -t="cytomineuliege/iris" .
fi

cd ../data_for_test && docker build -t="cytomineuliege/data_test" .

cd ..
echo DONE
