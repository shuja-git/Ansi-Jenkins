#!/bin/bash

#1. Create a Spot Instance
#2. Take take instance IP and register in DNS

#--------------this is to create spot instance request
#aws ec2 request-spot-instances --instance-count 1 --type "persistent" --launch-specification file://spot.json --tag-specifications "ResourceType=spot-instances-request,Tags=[{Key=Name,Value=frontend}]" | jq
#-------------------------------------------------------------------------------------------

TEMP_ID="lt-06e98f843b7024a45"
TEMP_VER=5

aws ec2 run-instances --launch-template LaunchTemplateId=${TEMP_ID},Version=${TEMP_VER} | jq

