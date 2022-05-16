#!/bin/bash



# create-stack update-stack or delete-stack
COMMAND=$1 

# Name of stack: vpc-subnets | asg-alb
STACK_NAME=$2

# Path to template file
TEMPLATE=$3

# Path to Parameters
PARAMS=$4

case $COMMAND in

  create)
    aws cloudformation create-stack \
    --stack-name $2 \
    --template-body file://$TEMPLATE \
    --parameters file://PARAMS\
    --capabilities "CAPABILITY_IAM" "CAPABILITY_NAMED_IAM" \
    ;;

  update)
    aws cloudformation update-stack \
    --stack-name $2\
    --template-body file://TEMPLATE \
    --parameters file://PARAM
    ;;

  delete)
    aws cloudformation delete-stack \
    --stack-name $2
    ;;

  *)
    echo -n "Wrong arguments : Run script as follows:" 
    echo -n "Wrong arguments : ./run.sh arg1 arg2 arg3:" 
    echo -n "Where arg1: create-stack | update-stack | delete delete-stack"
    echo -n "Where arg2: path-to-cloudformation-template"
    echo -n "Where arg3: path-to-tempplate-parametes"
    ;;
esac