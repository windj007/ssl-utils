#!/bin/bash

openssl req -x509 -config openssl-ca.cnf -newkey rsa:4096 -sha256 -out cacert.pem -outform PEM
