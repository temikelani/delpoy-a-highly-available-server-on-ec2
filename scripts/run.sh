#!/bin/bash -ex

# create-stack update-stack or delete-stack
COMMAND=$1 

# Name of stack: vpc-subnets | asg-alb
export STACK_NAME=asg-alb

# Path to template file
TEMPLATE="./cloudformation/main.yaml"

# Path to Parameters
PARAMS="./cloudformation/parameters.json"

case $COMMAND in

  create-stack)
    aws cloudformation create-stack \
    --stack-name $STACK_NAME \
    --template-body file://$TEMPLATE \
    --parameters file://$PARAMS \
    --capabilities "CAPABILITY_IAM" "CAPABILITY_NAMED_IAM" \

    chmod u+x ./scripts/outputs.sh
    chmod u+x ./scripts/bastion-ssh.sh
    chmod 400 ./keypair/asg-alb.cer
    sleep 420
    source ./scripts/outputs.sh
    source ./scripts/bastion-ssh.sh
    ;;

  update-stack)
    aws cloudformation update-stack \
    --stack-name $STACK_NAME\
    --template-body file://$TEMPLATE \
    --parameters file://$PARAMS \
    --capabilities "CAPABILITY_IAM" "CAPABILITY_NAMED_IAM" 

    chmod u+x ./scripts/outputs.sh
    chmod u+x ./scripts/bastion-ssh.sh
    chmod 400 ./keypair/asg-alb.cer
    sleep 420
    source ./scripts/outputs.sh
    source ./scripts/bastion-ssh.sh
    ;;

  delete-stack)
    aws cloudformation delete-stack \
    --stack-name $STACK_NAME
    ;;

  *)
    echo -n "Wrong arguments : Run script as follows:" 
    echo -n "Wrong arguments : ./run.sh arg1:" 
    echo -n "Where arg1: create-stack | update-stack | delete delete-stack"
    ;;
esac

# if [ "$COMMAND" == "create-stack" ] ||  [ "$COMMAND" == "update-stack" ]
# then
#     sleep 400
#     source ./scripts/outputs.sh
#     source ./scripts/bastion-ssh.sh
# fi