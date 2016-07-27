#!/bin/bash

openssl ca -config openssl-ca.cnf -policy signing_policy -extensions signing_req -out cert.pem -infiles req.csr
