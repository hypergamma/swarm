#!/bin/bash

###
# Script for initializing gamma-controller
###

###
# Install docker TODO
###



###
# Install docker-machine TODO
###



###
# Prepare ssh pair
###
#generate ssh keypair
#ssh-keygen -t rsa

#Copy ssh id
ssh-copy-id gamma@52.185.151.222
ssh-copy-id gamma@13.76.246.233
ssh-copy-id gamma@52.163.60.150
ssh-copy-id gamma@52.187.40.252
ssh-copy-id gamma@52.163.62.148
ssh-copy-id gamma@13.76.246.135
ssh-copy-id gamma@207.46.226.210
ssh-copy-id gamma@52.163.94.98
ssh-copy-id gamma@13.76.142.26
ssh-copy-id gamma@52.187.46.38


-H tcp://0.0.0.0:2376 --tlsverify --tlscacert=/home/gamma/.certs/ca.pem --tlscert=/home/gamma/.certs/cert.pem --tlskey=/home/gamma/.certs/key.pem


openssl genrsa -out ca-priv-key.pem 2048
echo subjectAltName = IP:127.0.0.1 > extfile.cnf
openssl req -config /usr/lib/ssl/openssl.cnf -new -key ca-priv-key.pem -x509 -days 1825 -out ca.pem
openssl x509 -in ca.pem -noout -text

openssl genrsa -out dc01-priv-key.pem 2048
openssl req -subj "/CN=dc01" -new -key dc01-priv-key.pem -out dc01.csr
openssl x509 -req -days 1825 -in dc01.csr -CA ca.pem -CAkey ca-priv-key.pem -CAcreateserial -out dc01-cert.pem -extensions v3_req -extfile /usr/lib/ssl/openssl.cnf
openssl rsa -in dc01-priv-key.pem -out dc01-priv-key.pem

openssl x509 -req -days 3650 -in dc02.csr -CA ca.pem -CAkey CAkey.pem -CAcreateserial -out dc02CRT.pem -extensions v3_req -extfile openssl.cnf
openssl rsa -in dc02KEY.pem -out dc02KEY.pem

ssh gamma@52.185.151.222 'mkdir -p /home/gamma/.certs'

scp ./ca.pem gamma@52.185.151.222:/home/gamma/.certs/ca.pem
scp ./dc01-cert.pem gamma@52.185.151.222:/home/gamma/.certs/cert.pem
scp ./dc01-priv-key.pem gamma@52.185.151.222:/home/gamma/.certs/key.pem


openssl genrsa -out dc02-priv-key.pem 2048
openssl req -subj "/CN=dc02" -new -key dc02-priv-key.pem -out dc02.csr
openssl x509 -req -days 1825 -in dc02.csr -CA ca.pem -CAkey ca-priv-key.pem -CAcreateserial -out dc02-cert.pem -extensions v3_req -extfile /usr/lib/ssl/openssl.cnf
openssl rsa -in dc02-priv-key.pem -out dc02-priv-key.pem

openssl x509 -in dc02-priv-key.pem -noout -text

ssh gamma@13.76.246.233 'mkdir -p /home/gamma/.certs'

scp ./ca.pem gamma@13.76.246.233:/home/gamma/.certs/ca.pem
scp ./dc02-cert.pem gamma@13.76.246.233:/home/gamma/.certs/cert.pem
scp ./dc02-priv-key.pem gamma@13.76.246.233:/home/gamma/.certs/key.pem


scp ./CAkey.pem gamma@13.76.246.233:/home/gamma/.certs/ca.pem
scp ./dc02CRT.pem gamma@13.76.246.233:/home/gamma/.certs/cert.pem
scp ./dc02KEY.pem gamma@13.76.246.233:/home/gamma/.certs/key.pem
