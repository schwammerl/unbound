Lightweight unbound image
=========================

Based on Alpine, this unbound image serves local development by providing an easy way to use local Domains.

# Usage
Define a sensible, free udp port, e.g. `MYPORT=8053` and run

```
docker build --no-cache -t unbound .
docker run -d -p "${MYPORT}":53/udp --name unbound unbound
```

Check if things are working:
```
dig +short myawesomehost.docker @127.0.0.1 -p "${MYPORT}"
```
dig should return `127.0.0.1`.