# SSL Utils

A tiny set of simple OpenSSL-based bash utilities to generate a self-signed certificates and even to maintain a simple chain of them. Sometimes you may need this, but you never remember how to do this!


## Generate a single self-signed certificate

To generate a single self-signed certificate, just run:

	./gen_plain.sh

After you have answered all the questions (you can just press Enter to leave default values), two files will be generated: server.crt (public certificate) and server.key (private keys).


## Generate a simple chain

This use-case has an advantage of root certificate: you can generate it once, redistribute it to your "clients", and then you can create numerous key-certificate pairs for your services, your clients will be able just to connect without installing (trusting) additional certificates.

### 1. Generate a root key-certificate pair (one time operation)

Run:

	./gen_ca.sh

You will be asked to type in a pass phrase, which will protect your private key. You may leave it empty.
As a result, files cakey.pem (private key) and cacert.pem (public certificate) will be generated. You have to keep cakey.pem secret.

You may want to edit openssl-ca.cnf __before__ running gen_ca.sh, but for test/internal use this one is OK.

### 2. Generate a certificate request (for each service)

Run:

	./gen_csr.sh

As a result, two files will be created: req.csr (certificate request to submit to Certificate Authority to sign and create a signed sertificate) and serverkey.pem (private key for this service). The latter one must be kept in secret.

You may want to edit openssl-server.cnf __before__ each run of ./gen_csr.sh, but for test/internal use this one is OK.

### 3. Sign a request with root certificate

Run:

	./sign.sh

You will be asked to enter root private key passphrase.

After that, a file cert.pem will be created, which is a signed certificate, made on the base of req.csr.
