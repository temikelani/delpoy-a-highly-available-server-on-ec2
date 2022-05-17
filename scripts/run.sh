#!/bin/bash



# create-stack update-stack or delete-stack
COMMAND=$1 

# Name of stack: vpc-subnets | asg-alb
STACK_NAME=$2

# Path to template file
TEMPLATE="../cloudformation/main.yaml"

# Path to Parameters
PARAMS="../cloudformation/parameters.json"

case $COMMAND in

  create)
    aws cloudformation create-stack \
    --stack-name $2 \
    --template-body file://$TEMPLATE \
    --parameters file://$PARAMS \
    --capabilities "CAPABILITY_IAM" "CAPABILITY_NAMED_IAM" \
    ;;

  update)
    aws cloudformation update-stack \
    --stack-name $2\
    --template-body file://$TEMPLATE \
    --parameters file://$PARAMS \
    --capabilities "CAPABILITY_IAM" "CAPABILITY_NAMED_IAM" 
    ;;

  delete)
    aws cloudformation delete-stack \
    --stack-name $2
    ;;

  *)
    echo -n "Wrong arguments : Run script as follows:" 
    echo -n "Wrong arguments : ./run.sh arg1 arg2:" 
    echo -n "Where arg1: create-stack | update-stack | delete delete-stack"
    echo -n "Where arg2: path-to-cloudformation-template"
    ;;
esac