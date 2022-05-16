aws cloudformation create-stack --stack-name $1 --template-body file://$2  --parameters file://$3 --capabilities "CAPABILITY_IAM" "CAPABILITY_NAMED_IAM" --region=us-east-1


#./create.sh ourdemoservers servers.yml server-parameters.json

#jumpbox
# scp -i jumpbox-key.pem private-server-devops-key.pem ec2-user@3.17.80.159:/home/ec2-user/private-server-devops-key.pem

#ssh ec2-user@3.17.80.159 -i jumpbox-key.pem