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

###### RUN ME WITH: sh ./inject_demo_data.sh $SUPERADMIN_PUB_KEY $SUPERADMIN_PRIV_KEY

#get all the config values.
. ./configuration.sh

# create test docker
docker run -d -p 22 \
--name data_test \
-e IS_LOCAL=$IS_LOCAL \
-e CORE_URL=$CORE_URL \
-e IMS_URLS=$IMS_URLS \
-e UPLOAD_URL=$UPLOAD_URL \
-e PUBLIC_KEY=$SUPERADMIN_PUB_KEY \
-e PRIVATE_KEY=$SUPERADMIN_PRIV_KEY \
cytomine/data_test > /dev/null


OUTPUT_DATA_CYTOMINE=$(docker logs data_test)
COUNTER_CYTOMINE=0
while [ "${OUTPUT_DATA_CYTOMINE#*END OF DATA INJECTION}" = "$OUTPUT_DATA_CYTOMINE" ] && [ $COUNTER_CYTOMINE -le 45 ]
do
   OUTPUT_DATA_CYTOMINE=$(docker logs data_test)
   OUTPUT_DATA_CYTOMINE=$(echo "$OUTPUT_DATA_CYTOMINE" | tail -n 100)
   COUNTER_CYTOMINE=$((COUNTER_CYTOMINE+1))
   sleep 60
done
if [ "${OUTPUT_DATA_CYTOMINE#*DATA SUCCESSFULLY INJECTED}" = "$OUTPUT_DATA_CYTOMINE" ]
then
   echo "Data are not plainfully injected. Please check the status with the command docker logs data_test."
else
   echo "Data successfully injected."
fi
