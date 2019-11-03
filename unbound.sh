#!/bin/sh -v

# Download root hints
wget -S -N https://www.internic.net/domain/named.cache -O /etc/unbound/root.hints

# Adjust file settings
#chmod g+w /etc/unbound/root.key
#chown :unbound /etc/unbound/root.key

# Initialize unbound
unbound-checkconf
unbound-anchor -a /etc/unbound/root.key
unbound-control-setup
unbound-control start

exit 0