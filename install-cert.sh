#!/bin/bash

#certstore=/usr/local/share/ca-certificates
cert=/home/eric/ca.crt
certstore=/usr/share/ca-certificates

# Must be run as ROOT
if [ $EUID != 0 ]; then
	echo "Must be run as root, exiting";
	exit 1;
fi

if [ ! -f $cert ]; then
	echo "Certificate $cert not found .. exiting";
	exit 1;
fi

if [ ! -d $certstore ]; then
	echo "Certificate destination $certstore doesn't exist";
	exit 1;
	#echo "Creating destination directory";
	#mkdir -v $cerstore/extra
fi

# Look for the 2nd certificate
echo "Copying 2nd certificate to the store";
cp -v $cert $certstore/;

# Modify certificate permissions
echo "Updating certificate permissions ...";
chmod 644 $cert

# Check if libnss3-tools is installed
PKG_OK=$(dpkg-query -W --showformat='${Status}\n' libnss3-tools | grep "install ok installed");
echo "Checking for libnss3-tools: $PKG_OK";
if [ "" == "$PKG_OK" ]; then
	echo "libnss3-tools is not installed, installing ...";
	apt install -y libnss3-tools
fi

# Import certificates with libnss3-tools
echo "Importing 2nd cert ...";
certutil -d sql:/home/eric/.pki/nssdb -A -n 'UWM cert authority' -i $cert -t "C,,"

# Update certificate store
echo "Updating the certificate store ... ";
update-ca-certificates;

# List all certificates
certutil -d sql:/home/eric/.pki/nssdb -L

# Test new certificates
echo "Testing configuration against nytimes.com";
curl -I https://www.nytimes.com




# Import existing GPG keys for git signing
if [ ! -d /home/eric/.secure ]; then
	echo "Directory with secure files doesn't exist";
	exit 1;
fi

gpg
/home/eric/.gnupg/pubring.kbx
-----------------------------
pub   rsa4096/8555B3787408B342 2019-07-23 [SC]
      599634D7E44F33BFE0C614AC8555B3787408B342
uid                 [ unknown] Eric Weissgerber (Github Signing Key) <eweissge@gmail.com>
sub   rsa4096/0917653DCA387CBE 2019-07-23 [E]

/home/eric/.gnupg/pubring.kbx
-----------------------------
sec   rsa4096/8555B3787408B342 2019-07-23 [SC]
      599634D7E44F33BFE0C614AC8555B3787408B342
uid                 [ unknown] Eric Weissgerber (Github Signing Key) <eweissge@gmail.com>
ssb   rsa4096/0917653DCA387CBE 2019-07-23 [E]

