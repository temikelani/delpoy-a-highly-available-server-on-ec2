#!/bin/bash -ex

export REGION=us-east-1

# chmod the key pair
chmod 400 asg-alb.cer

# output private IPs of all instances in region US-EAST-1 to file instance-details.txt

aws ec2 describe-instances --region $REGION --query "Reservations[*].Instances[*].PrivateIpAddress[]" --output text > instance-details.txt