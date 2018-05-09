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

#URLs
CORE_URL=localhost-core
IMS_URLS="[localhost-ims,localhost-ims2]"
UPLOAD_URL=localhost-upload
SLURM_URL=localhost-slurm

#Backups
# BACKUP_BOOL : backup active or not
BACKUP_BOOL=false
# SENDER_EMAIL, SENDER_EMAIL_PASS, SENDER_EMAIL_SMTP : email params of the sending account
SENDER_EMAIL='your.email@gmail.com'
SENDER_EMAIL_PASS='passwd'
SENDER_EMAIL_SMTP_HOST='smtp.gmail.com'
SENDER_EMAIL_SMTP_PORT='587'
# RECEIVER_EMAIL : email adress of the receiver
RECEIVER_EMAIL='receiver@XXX.com'

#Paths
IMS_STORAGE_PATH=/data
IMS_BUFFER_PATH=/data/_buffer
BACKUP_PATH=/data/backup
ALGO_PATH=/data/algo/
KEY_PATH=/data/ssh/
IMAGES_PATH=/data/images
RETRIEVAL_PATH=/data/thumb
FAST_DATA_PATH=/data

#middlewares
RETRIEVAL_PASSWD='retrieval_default'
RABBITMQ_LOGIN="router"
RABBITMQ_PASSWORD="router"


#IRIS
IRIS_ENABLED=true
IRIS_URL=localhost-iris
IRIS_ID="LOCAL_CYTOMINE_IRIS"
IRIS_ADMIN_NAME="Ian Admin"
IRIS_ADMIN_ORGANIZATION_NAME="University of Somewhere, Department of Whatever"
IRIS_ADMIN_EMAIL="ian.admin@somewhere.edu"


# You don't to change the datas below this line instead of advanced customization
# ---------------------------

IS_LOCAL=true

#IIP_OFF_URL=localhost-iip-base
IIP_CYTO_URL=localhost-iip-cyto
IIP_JP2_URL=localhost-iip-jp2000
NB_IIP_PROCESS=20

RETRIEVAL_URL=localhost-retrieval

BIOFORMAT_ENABLED="true"

#possible values : memory, redis
RETRIEVAL_ENGINE=redis

MEMCACHED_PASS="mypass"

BIOFORMAT_ALIAS="bioformat"
BIOFORMAT_PORT="4321"


# DO NOT USE DATA BELOW EXCEPT YOU WANT TO INSTALL A DEVELOPMENT ENV.
DEV_CORE=true
DEV_IMS=false
# Complete the keys by running, for example $(cat /proc/sys/kernel/random/uuid) for each.
# For a production deployment, these keys are automatically generated !
IMS_PUB_KEY=088ad89f-1404-4eef-8c86-c50287f54ece
IMS_PRIV_KEY=77f922bf-81c4-4423-a791-24fb90a5c561
ADMIN_PUB_KEY=8dd40d4e-42d8-4fe0-88a1-a943d25035f5
ADMIN_PRIV_KEY=11b262d6-bd06-4468-b536-6c28344202e6
SUPERADMIN_PUB_KEY=c48a6252-26ad-408f-989a-df311efe0d3b
SUPERADMIN_PRIV_KEY=1003b5dc-b680-4106-b35b-faab0637f2b6
RABBITMQ_PUB_KEY=e61dd2b9-8edb-4f97-a50d-8ee39d016297
RABBITMQ_PRIV_KEY=66e6f160-f918-487e-b0d3-5107e9ad4510
