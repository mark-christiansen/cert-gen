#!/bin/bash

BASE=$(dirname "$0")

cd ${BASE}

. ./env.sh

CA_PW=${CA_PASSWORD}
IN_PW=${INTERMEDIATE_PASSWORD}

#
# Subject should be adjusted for your location, with the CN record being the hostname.
#
COUNTRY=US
STATE=MN
CITY=MINNEAPOLIS
ORG=IDS
UNIT=IT

#
# the subject name for your certificate authority certificate
#
subject="/C=${COUNTRY}/ST=${STATE}/L=${CITY}/O=${ORG}/OU=${UNIT}/CN=${INT_DOMAIN}"

key=intermediate.key
req=intermediate.csr
crt=intermediate.crt

echo ""
echo "==============================="
echo "create intermediate certificate"
echo "==============================="
echo ""

printf "\n\ncreated IN key and IN csr\n=========================\n\n"
openssl req -newkey rsa:3072 -sha384 -passout pass:${IN_PW} -keyout ${CERTS}/${key} -out ${CERTS}/${req} -subj ${subject}
	-extensions ca \
	-config <(cat ./openssl.cnf <(printf "\n[ext]\nbasicConstraints=CA:TRUE,pathlen:4"))
[ $? -eq 1 ] && echo "unable to create IN key and csr" && exit

printf "\n\nverify IN key\n=============\n\n"
openssl rsa -check -in ${CERTS}/${key} -passin pass:${IN_PW} 
[ $? -eq 1 ] && echo "unable to verify IN key" && exit

printf "\n\nverify IN csr\n=============\n\n"
openssl req -text -noout -verify -in ${CERTS}/${req}
[ $? -eq 1 ] && echo "unable to verify IN csr" && exit

printf "\n\nsign IN csr\n===========\n\n"
openssl x509 -req -CA ${CERTS}/ca.crt -CAkey ${CERTS}/ca.key -passin pass:${CA_PW} -in ${CERTS}/${req} -sha384 -days 3650 -out ${CERTS}/${crt} -CAcreateserial \
	-extensions ext \
	-extfile <(cat ./openssl.cnf <(printf "\n[ext]\nbasicConstraints=CA:TRUE,pathlen:4"))
[ $? -eq 1 ] && echo "unable to sign IN csr" && exit

printf "\n\nverify CS crt\n=============\n\n"
openssl x509 -in ${CERTS}/${crt} -text -noout
[ $? -eq 1 ] && echo "unable to verify IN crt" && exit

printf "\n\n"
