#!/bin/bash

openssl req -newkey rsa:4096 -nodes -sha256 -keyout server.key -x509 -days 365 -out server.crt
