#!/bin/bash
echo -n "Enter server's name you want to create: "
read server
yum -y install httpd mod_ssl
mkdir /var/www/html/secret
chmod 777 /var/www/html/secret
cp httpd.conf /etc/httpd/conf/httpd.conf
systemctl restart httpd
systemctl status httpd
systemctl enable httpd
cd /etc/pki/tls/certs/
openssl genpkey -algorithm rsa -pkeyopt rsa_keygen_bits:2048 -out ${server}.key
openssl req -new -key $server.key -out $server.csr -passin pass:$password -subj "/C=India/ST=Karnataka/L=Bangalore/O=Home/OU=room/CN=${server}/emailAddress=arun92venkat@gmail.com"
openssl x509 -req -days 365 -signkey client1.key -in client1.csr -out client1.crt
cp ssl.conf /etc/httpd/conf.d/ssl.conf
systemctl restart httpd
