#!/bin/bash

openssl req -config openssl-server.cnf -newkey rsa:2048 -sha256 -nodes -out req.csr -outform PEM
