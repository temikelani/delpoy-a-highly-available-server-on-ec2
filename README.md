# Deploy An Application to the Apache Web Server running on an EC2 instance. <a id ='top'></a>

<br>
<br>

## Summary

<br>
<br>

## Tech Stack

- AWS VPC
- AWS EC2
- AWS CLI
- AWS S3
- AWS CLoud Formation

## Architecture Diagram

<br>
<br>
<br>

# Contents

- [Objective](#obj)
- [Steps](#steps)
- [Via Cloud Formation](#0)
- [Via Terraform](#1)
- [Via CLI/Bash Script](#2)
- [Via Console](#3)
- [Resources](#res)
- [go to top](#top)

<br>
<br>

# Objective <a id='obj'></a> ([go to top](#top))

## Scenario

Your company is creating an Instagram clone called Udagram. Developers want to deploy a new application to the AWS infrastructure. You have been tasked with provisioning the required infrastructure and deploying a dummy application, along with the necessary supporting software.

This needs to be automated so that the infrastructure can be discarded as soon as the testing team finishes their tests and gathers their results.

## Objectives

- [ ] You'll need to create a `Launch Configuration` for your application servers in order to deploy `four servers,` `two located in each of your private subnets`. The launch configuration will be used by an auto-scaling group.

- [ ] You'll need `two vCPUs and at least 4GB of RAM.`
- [ ] The Operating System to be used is `Ubuntu 18`. So, choose an `Instance size and Machine Image (AMI) that best fits this spec`. Be sure to allocate `at least 10GB` of disk space so that you don't run into issues.
- [ ] Since you will be `downloading the application archive from an S3 Bucket`, you'll need to create an `IAM Role that allows your instances to use the S3 Service.`
- [ ] Udagram communicates on the default `HTTP Port: 80,` so your servers will need this inbound port open since you will use it with the Load Balancer and the Load Balancer Health Check. As for outbound, the servers will need unrestricted internet access to be able to download and update their software.
- [ ] The `load balancer `should `allow all public traffic (0.0.0.0/0) on port 80 inbound`, which is the default HTTP port. Outbound, it will only be` using port 80 to reach the internal servers.`
- [ ] The application needs to be `deployed into private subnets` with a Load Balancer located in a public subnet.
- [ ] One of the `output` exports of the CloudFormation script should be `the public URL of the LoadBalancer`. Bonus points if you `add http:// in front of the load balancer DNS Name `in the output, for convenience.
- [ ] Set up a `bastion host (jump box)` to allow you to `SSH into your private subnet servers.` This bastion host would be on a `Public Subnet with port 22 `open only to your home IP address, and it would need to have the `private key` that you use to `access the other servers.`

<br>
<br>
<br>

# Steps <a id='steps'></a> ([go to top](#top))

- Create a Key Pair named `asg-alb`
- Obtain latest Ami id of Ubuntu 18
  - Add values to [parameters.json ](./cloudformation/parameters.json)
  - `asgImageId"` and `asgKeyPair`
- deploy [cloudformation template](./cloudformation/main.yaml) which creates the following resources
  - a vpc
  - 2 public subnets, 1 public route etc...
  - 2 private subnets
  - etc

<br>
<br>
<br>

# Via CLoud Formation <a id='0'></a> ([go to top](#top))

<details>
<summary>> Expand For Details </summary>

</details>

<br>
<br>
<br>

# Via Terraform <a id='1'></a> ([go to top](#top))

<details>
<summary>> CLick to Expand</summary>

</details>

<br>
<br>
<br>

# Via CLI/Bash Script<a id='2'></a> ([go to top](#top))

<details>
<summary>> CLick to Expand</summary>

</details>

<br>
<br>
<br>

# Via Console <a id='3'></a> ([go to top](#top))

<details>
<summary>> CLick to Expand</summary>

</details>

<br>
<br>
<br>

# Resources <a id='res'></a> ([go to top](#top))

- simulate stress on ASG

- https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/finding-an-ami.html#finding-an-ami-console

- https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-ec2-internetgateway.html#cfn-ec2-internetgateway-tags
- https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-iam-role.html#cfn-iam-role-path
- https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-iam-instanceprofile.html
- https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_use_switch-role-ec2_instance-profiles.html
  ¡
- https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/pseudo-parameter-reference.html

- https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-autoscaling-launchconfiguration.html

- https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/device_naming.html

- https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-attribute-creationpolicy.html

- https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/quickref-autoscaling.html

- https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-attribute-updatepolicy.html

<br>
<br>
<br>

# To DO <a id='todo'></a> ([go to top](#top))

- add stress test to test sacling policies

