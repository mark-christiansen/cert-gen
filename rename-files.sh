#!/bin/bash

BASE=$(dirname "$0")

cd ${BASE}

. ./env.sh

count=0
for i in ${MACHINES[@]}; do
  mv ${CERTS}/${i}.key ${CERTS}/${i}_key.pem
  mv ${CERTS}/${i}.crt ${CERTS}/${i}_cert.pem
  cp ${CERTS}/kafka.server.truststore.jks ${CERTS}/${i}.truststore.jks
  count=`expr $count + 1`
done