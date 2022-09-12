#!/bin/bash

usename = 'azureuser'

export VSTS_AGENT_INPUT_URL=""
export VSTS_AGENT_INPUT_AUTH=pat
export VSTS_AGENT_INPUT_TOKEN=""
export VSTS_AGENT_INPUT_POOL=""

cd /home/$username
 
yum update -y
yum install unzip -y
yum install git -y
wget https://vstsagentpackage.azureedge.net/agent/2.169.1/vsts-agent-linux-x64-2.169.1.tar.gz
mkdir myagent && cd myagent
tar zxvf ../vsts-agent-linux-x64-2.169.1.tar.gz
./bin/installdependencies.sh
chown -R $username:$username .
su $username -c './config.sh --unattended'
echo "HOME=/home/$username" >> .env
./svc.sh install
./svc.sh start

mkdir -p _work

chown -R $username:$username _work
