Lightweight unbound image
=========================

Based on Alpine, this unbound image serves local development by providing an easy way to use local Domains.

# Usage
Check if 127.0.0.1:53/udp is in use, then, from the repo dir, run

```
docker build --no-cache -t unbound .
docker run -d -p 53:53/udp --name unbound unbound
```

Adjust the ports if necessary.

# Todo
* run as unbound user