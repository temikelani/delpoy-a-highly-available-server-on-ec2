#!/bin/bash -ex

# transfer keypair to bastion host
scp -i "./keypair/asg-alb.cer" ./keypair/asg-alb.cer $BASTION_SSH_ADDRESS:/home/ec2-user

# save instance details as text and sendbastiion host
aws ec2 describe-instances --query "Reservations[*].Instances[*].PrivateIpAddress[]" --output text > ./scripts/instance-details.txt

scp -i "./keypair/asg-alb.cer" ./scripts/instance-details.txt $BASTION_SSH_ADDRESS:/home/ec2-user


# ssh to bastion host
ssh -i "./keypair/asg-alb.cer" $BASTION_SSH_ADDRESS
