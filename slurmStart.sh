#!/usr/bin/env bash


# Create server SSH keys if needed
NAMEOFFILE="idLocal_rsa"
SSHKEYSPATH="/data/ssh"
SERVER_SSHKEYS_FILE="/data/ssh/$NAMEOFFILE"
echo "$SERVER_SSHKEYS_FILE"
if [ ! -e $SERVER_SSHKEYS_FILE ]
then
    if [[ "$OSTYPE" == "linux-gnu" ]]; then
        apt-get install -y ssh-keygen
    fi
    ssh-keygen -t rsa -N "" -C localhost-core -f $SERVER_SSHKEYS_FILE
fi

if [[ true = true ]]
then
    docker volume create --name slurm_data > /dev/null
    docker create --name slurmf -t -h cytomine-slurm \
    --privileged \
    -v slurm_data:/var/lib/mysql \
    -v /data/softwares/images:/data/softwares/images \
    -e SSHKEYSPATH="/data/ssh/idLocal_rsa" \
    -p 10022:22 \
    --restart=unless-stopped \
    cytomineuliege/slurm:1.42.0 > /dev/null

    docker cp $PWD/hosts/slurm/addHosts.sh slurm:/tmp/addHosts.sh
    docker cp /data/ssh/$NAMEOFFILE.pub slurm:/data/ssh
    #on remove l'extension ici. c'est bien la public!!!!!
    docker start slurm

    if [[ true = true ]]
    then
         #we will retrieve the ip of the slurm container. Because we need it for the softwareRouter

         var=$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' slurm)
         sed -i "s/SLURM_IP_CONTAINER/$var/g" configs/software_router/config.groovy
         cp configs/software_router/config.groovy /home/gvissers/IdeaProjects/Cytomine-software-router2
    fi

fi


grails.prefixNameOfSSHFile='$PREFIX_SSH_FILE'
grails.serverSshKeysPath='$SERVER_SSHKEYS_PATH'
grails.serverSshKeysPathPrivate='$SERVER_SSHKEYS_PATH_PRIVATE'
grails.serverSshKeysPathPublic='$SERVER_SSHKEYS_PATH_PUBLIC'