#!/bin/bash -ex

# create-stack update-stack or delete-stack
COMMAND=$1 

# Name of stack: vpc-subnets | asg-alb

if [ "$COMMAND" == "create-stack" ] ||  [ "$COMMAND" == "update-stack" ]
then
    echo -n "----hey"
fi