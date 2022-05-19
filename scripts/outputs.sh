#!/bin/bash -ex

# export STACK_NAME=asg-alb
# aws cloudformation describe-stacks --stack-name $STACK_NAME
# aws cloudformation describe-stacks --stack-name $STACK_NAME --query "Stacks[].Outputs"

export BASTION_SSH_ADDRESS=$(aws cloudformation describe-stacks --stack-name $STACK_NAME --query "Stacks[*].Outputs[0].OutputValue" --output text)

export ALB_DNS=$(aws cloudformation describe-stacks --stack-name $STACK_NAME --query "Stacks[*].Outputs[3].OutputValue" --output text)

echo "alb-dns: $ALB_DNS"