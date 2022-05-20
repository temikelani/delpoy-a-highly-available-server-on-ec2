#!/bin/bash -ex

# transfer keypair to bastion host
scp -i "./keypair/asg-alb.cer" ./keypair/asg-alb.cer $BASTION_SSH_ADDRESS:/home/ec2-user

# copy script to obtain ip addresses of instances to astion host
scp -i "./keypair/asg-alb.cer" ./scripts/instance-details.sh $BASTION_SSH_ADDRESS:/home/ec2-user


# ssh to bastion host
ssh -i "./keypair/asg-alb.cer" $BASTION_SSH_ADDRESS
