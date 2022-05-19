#!/bin/bash -ex

# create-stack update-stack or delete-stack
COMMAND=$1 

# Name of stack: vpc-subnets | asg-alb

if [ $COMMAND == create-stack ]
then
  echo '--------Hey hey hey'
fi

# if [$COMMAND == "update-stack"]
# then
#     sleep 8m
#     ./scripts/outputs.sh
#     ./scripts/bastion-ssh.sh
# fi