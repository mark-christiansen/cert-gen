#!/bin/bash

# certificate needed, brokers certificate should be based on hostname of the cerificate
declare -a MACHINES=("ip-10-151-1-44.ap-southeast-2.compute.internal" "ip-10-151-1-61.ap-southeast-2.compute.internal" "ip-10-151-1-52.ap-southeast-2.compute.internal" "ip-10-151-1-55.ap-southeast-2.compute.internal" "ip-10-151-1-62.ap-southeast-2.compute.internal" "ip-10-151-1-135.ap-southeast-2.compute.internal" "ip-10-151-1-144.ap-southeast-2.compute.internal" "ip-10-151-1-134.ap-southeast-2.compute.internal" "ip-10-151-1-137.ap-southeast-2.compute.internal" "ip-10-151-1-146.ap-southeast-2.compute.internal" "ip-10-151-1-136.ap-southeast-2.compute.internal" "ip-10-151-1-145.ap-southeast-2.compute.internal" "ip-10-151-2-40.ap-southeast-2.compute.internal" "ip-10-151-2-43.ap-southeast-2.compute.internal" "ip-10-151-2-55.ap-southeast-2.compute.internal" "ip-10-151-1-40.ap-southeast-2.compute.internal")
declare -a PUBLIC_DNS=("" "" "" "" "" "ec2-54-252-219-72.ap-southeast-2.compute.amazonaws.com" "ec2-3-25-191-126.ap-southeast-2.compute.amazonaws.com" "ec2-13-211-214-88.ap-southeast-2.compute.amazonaws.com" "ec2-54-66-206-237.ap-southeast-2.compute.amazonaws.com" "ec2-3-104-63-162.ap-southeast-2.compute.amazonaws.com" "ec2-54-79-64-133.ap-southeast-2.compute.amazonaws.com" "ec2-13-236-162-100.ap-southeast-2.compute.amazonaws.com" "" "" "" "")

#declare -a MACHINES=("cisco")
#declare -a PUBLIC_DNS=("")

# location to create certificates
CERTS=certs

# the password of the root authority certificate
CA_PASSWORD=D@t@MartU@t!

# the password if the intermediate certificate
INTERMEDIATE_PASSWORD=D@t@MartU@t!

# the password of the broker certificate and the keystore
# keystore password and key password must be the same
BROKER_PASSWORD=urE8q\$nmHSXo75d!w
#BROKER_PASSWORD=Hcv45kaxyU89!\(iqw

## Make the CERTS directory and ensure that it wasn't removed above

if [ "${CERTS}" == "" ]; then
  echo "CERTS environment variable is missing"
  exit
fi
mkdir -p ${CERTS}

