#!/bin/sh -v

# Download root hints
wget -S -N https://www.internic.net/domain/named.cache -O /etc/unbound/root.hints

# Adjust file settings; required for running as unbound
chown -R unbound:unbound /etc/unbound

# Initialize unbound
unbound-checkconf
unbound-anchor -a /etc/unbound/root.key
unbound-control-setup
unbound-control start

exit 0