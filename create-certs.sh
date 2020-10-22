#!/bin/bash

BASE=$(dirname "$0")

cd ${BASE}

. ./env.sh

count=0
for i in ${MACHINES[@]}; do
  ${BASE}/create-cert.sh ${i} ${PUBLIC_DNS[$count]}
  count=`expr $count + 1`
done

