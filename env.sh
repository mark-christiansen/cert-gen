#!/bin/bash

# set the env (CA) and region (intermediate CA) domains
CA_DOMAIN="dev.stream.idscloud.io"
INT_DOMAIN="ap-southeast-2.${CA_DOMAIN}"
PRIVATE_DOMAIN="ap-southeast-2.compute.internal"

# certificate needed, brokers certificate should be based on hostname of the cerificate
declare -a MACHINES=("ip-10-150-1-51.${PRIVATE_DOMAIN}" "ip-10-150-1-48.${PRIVATE_DOMAIN}" "ip-10-150-1-54.${PRIVATE_DOMAIN}" "ip-10-150-1-58.${PRIVATE_DOMAIN}" "ip-10-150-1-36.${PRIVATE_DOMAIN}" "broker-0.${INT_DOMAIN}" "broker-1.${INT_DOMAIN}" "broker-2.${INT_DOMAIN}" "broker-3.${INT_DOMAIN}" "broker-4.${INT_DOMAIN}" "schema-0.${INT_DOMAIN}" "schema-1.${INT_DOMAIN}" "ip-10-150-2-40.${PRIVATE_DOMAIN}" "ip-10-150-2-44.${PRIVATE_DOMAIN}" "ip-10-150-2-48.${PRIVATE_DOMAIN}" "ip-10-150-1-56.${PRIVATE_DOMAIN}")
declare -a PUBLIC_DNS=("" "" "" "" "" "kafka.${INT_DOMAIN}" "kafka.${INT_DOMAIN}" "kafka.${INT_DOMAIN}" "kafka.${INT_DOMAIN}" "kafka.${INT_DOMAIN}" "kafka.${INT_DOMAIN}" "kafka.${INT_DOMAIN}" "" "" "" "")

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