#!/bin/bash

#1. Create a Spot Instance
#2. Take take instance IP and register in DNS

aws ec2 request-spot-instances --instance-count 1 --type "persistent" --launch-specification file://spot.json --tag-specifications "ResourceType=spot-instances-request,Tags=[{Key=Name,Value=frontend}]"


