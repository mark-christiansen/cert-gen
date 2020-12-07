#!/bin/bash

# certificate needed, brokers certificate should be based on hostname of the cerificate
declare -a MACHINES=("ip-10-150-1-51.ap-southeast-2.compute.internal" "ip-10-150-1-48.ap-southeast-2.compute.internal" "ip-10-150-1-54.ap-southeast-2.compute.internal" "ip-10-150-1-58.ap-southeast-2.compute.internal" "ip-10-150-1-36.ap-southeast-2.compute.internal" "ip-10-150-1-136.ap-southeast-2.compute.internal" "ip-10-150-1-138.ap-southeast-2.compute.internal" "ip-10-150-1-153.ap-southeast-2.compute.internal" "ip-10-150-1-134.ap-southeast-2.compute.internal" "ip-10-150-1-139.ap-southeast-2.compute.internal" "ip-10-150-1-156.ap-southeast-2.compute.internal" "ip-10-150-1-147.ap-southeast-2.compute.internal" "ip-10-150-2-40.ap-southeast-2.compute.internal" "ip-10-150-2-44.ap-southeast-2.compute.internal" "ip-10-150-2-48.ap-southeast-2.compute.internal" "ip-10-150-1-56.ap-southeast-2.compute.internal")
declare -a PUBLIC_DNS=("" "" "" "" "" "ec2-3-25-195-66.ap-southeast-2.compute.amazonaws.com" "ec2-13-211-200-224.ap-southeast-2.compute.amazonaws.com" "ec2-52-62-197-88.ap-southeast-2.compute.amazonaws.com" "ec2-3-25-69-212.ap-southeast-2.compute.amazonaws.com" "ec2-3-26-51-99.ap-southeast-2.compute.amazonaws.com" "ec2-3-25-134-64.ap-southeast-2.compute.amazonaws.com" "ec2-13-55-194-251.ap-southeast-2.compute.amazonaws.com" "" "" "" "")


# location to create certificates
CERTS=certs

# the password of the root authority certificate
CA_PASSWORD=D@t@MartD3v!

# the password if the intermediate certificate
INTERMEDIATE_PASSWORD=D@t@MartD3v!

# the password of the broker certificate and the keystore
# keystore password and key password must be the same
BROKER_PASSWORD=YuI6#hsCcQb550z!


## Make the CERTS directory and ensure that it wasn't removed above

if [ "${CERTS}" == "" ]; then
  echo "CERTS environment variable is missing"
  exit
fi
mkdir -p ${CERTS}

