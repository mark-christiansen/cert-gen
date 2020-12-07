#!/bin/bash

# certificate needed, brokers certificate should be based on hostname of the certificate
declare -a MACHINES=("ip-10-101-1-62.us-west-2.compute.internal" "ip-10-101-1-56.us-west-2.compute.internal" "ip-10-101-1-45.us-west-2.compute.internal" "ip-10-101-1-36.us-west-2.compute.internal" "ip-10-101-1-42.us-west-2.compute.internal" "ip-10-101-1-151.us-west-2.compute.internal" "ip-10-101-1-153.us-west-2.compute.internal" "ip-10-101-1-133.us-west-2.compute.internal" "ip-10-101-1-158.us-west-2.compute.internal" "ip-10-101-1-144.us-west-2.compute.internal" "ip-10-101-1-140.us-west-2.compute.internal" "ip-10-101-1-141.us-west-2.compute.internal" "ip-10-101-2-42.us-west-2.compute.internal" "ip-10-101-2-60.us-west-2.compute.internal" "ip-10-101-2-44.us-west-2.compute.internal" "ip-10-101-1-60.us-west-2.compute.internal")
declare -a PUBLIC_DNS=("" "" "" "" "" "ec2-34-214-199-71.us-west-2.compute.amazonaws.com" "ec2-54-185-30-8.us-west-2.compute.amazonaws.com" "ec2-52-34-60-128.us-west-2.compute.amazonaws.com" "ec2-34-218-226-93.us-west-2.compute.amazonaws.com" "ec2-52-88-234-126.us-west-2.compute.amazonaws.com" "ec2-54-244-186-150.us-west-2.compute.amazonaws.com" "ec2-34-220-172-194.us-west-2.compute.amazonaws.com" "" "" "" "")

# location to create certificates
CERTS=../cluster/certs

# the password of the root authority certificate
CA_PASSWORD=C1sc0C3rt!

# the password if the intermediate certificate
INTERMEDIATE_PASSWORD=C1sc0C3rt!

# the password of the broker certificate and the keystore
# keystore password and key password must be the same
BROKER_PASSWORD=a1G0q@56!vuLrt8Sx


## Make the CERTS directory and ensure that it wasn't removed above

if [ "${CERTS}" == "" ]; then
  echo "CERTS environment variable is missing"
  exit
fi
mkdir -p ${CERTS}