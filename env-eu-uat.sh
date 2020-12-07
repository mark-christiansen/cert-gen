#!/bin/bash

# certificate needed, brokers certificate should be based on hostname of the cerificate
declare -a MACHINES=("ip-10-161-1-40.eu-west-2.compute.internal" "ip-10-161-1-51.eu-west-2.compute.internal" "ip-10-161-1-36.eu-west-2.compute.internal" "ip-10-161-1-38.eu-west-2.compute.internal" "ip-10-161-1-52.eu-west-2.compute.internal" "ip-10-161-1-153.eu-west-2.compute.internal" "ip-10-161-1-152.eu-west-2.compute.internal" "ip-10-161-1-144.eu-west-2.compute.internal" "ip-10-161-1-139.eu-west-2.compute.internal" "ip-10-161-1-138.eu-west-2.compute.internal" "ip-10-161-1-154.eu-west-2.compute.internal" "ip-10-161-1-149.eu-west-2.compute.internal" "ip-10-161-2-42.eu-west-2.compute.internal" "ip-10-161-2-50.eu-west-2.compute.internal" "ip-10-161-2-36.eu-west-2.compute.internal" "ip-10-161-1-47.eu-west-2.compute.internal")
declare -a PUBLIC_DNS=("" "" "" "" "" "ec2-18-133-33-246.eu-west-2.compute.amazonaws.com" "ec2-3-10-54-151.eu-west-2.compute.amazonaws.com" "ec2-18-133-254-201.eu-west-2.compute.amazonaws.com" "ec2-18-133-223-4.eu-west-2.compute.amazonaws.com" "ec2-3-8-155-150.eu-west-2.compute.amazonaws.com" "ec2-18-130-187-219.eu-west-2.compute.amazonaws.com" "ec2-3-8-189-7.eu-west-2.compute.amazonaws.com" "" "" "" "")

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
BROKER_PASSWORD=FV410vb!xi8rb#jqk
#BROKER_PASSWORD=bkJG833pwA#!Ihasd

## Make the CERTS directory and ensure that it wasn't removed above

if [ "${CERTS}" == "" ]; then
  echo "CERTS environment variable is missing"
  exit
fi
mkdir -p ${CERTS}