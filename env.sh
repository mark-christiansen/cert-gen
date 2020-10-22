#!/bin/bash

# certificate needed, brokers certificate should be based on hostname of the cerificate
declare -a MACHINES=("ip-172-30-5-139.us-west-2.compute.internal" "ip-172-30-5-158.us-west-2.compute.internal" "ip-172-30-5-136.us-west-2.compute.internal" "ip-172-30-5-62.us-west-2.compute.internal" "ip-172-30-5-48.us-west-2.compute.internal" "ip-172-30-5-133.us-west-2.compute.internal" "ip-172-30-5-153.us-west-2.compute.internal" "ip-172-30-5-57.us-west-2.compute.internal")
declare -a PUBLIC_DNS=("ec2-54-214-201-20.us-west-2.compute.amazonaws.com" "ec2-34-221-24-175.us-west-2.compute.amazonaws.com" "ec2-34-222-12-54.us-west-2.compute.amazonaws.com" "" "" "ec2-18-236-200-240.us-west-2.compute.amazonaws.com" "ec2-34-220-82-234.us-west-2.compute.amazonaws.com" "")


# location to create certificates
CERTS=certs

# the password of the root authority certificate
CA_PASSWORD=password

# the password if the intermediate certificate
INTERMEDIATE_PASSWORD=password

# the password of the broker certificate and the keystore
# keystore password and key password must be the same
BROKER_PASSWORD=password


## Make the CERTS directory and ensure that it wasn't removed above

if [ "${CERTS}" == "" ]; then
  echo "CERTS environment variable is missing"
  exit
fi
mkdir -p ${CERTS}

