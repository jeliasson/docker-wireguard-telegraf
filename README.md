# Wireguard-Telegraf Docker image

A example Docker image to extend [`linuxserver/wireguard`](https://github.com/linuxserver/docker-wireguard) with Telegraf.

**Build**

```bash
docker build --progress=plain \
             --no-cache \
             -t wireguard-telegraf:latest \
             .
```

**Run**

Modified example from
https://github.com/linuxserver/docker-wireguard#docker-cli-click-here-for-more-info

```bash
docker run --rm -it \
  --name=wireguard \
  --cap-add=NET_ADMIN \
  --cap-add=SYS_MODULE \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Europe/London \
  -e SERVERURL=wireguard.domain.com `#optional` \
  -e SERVERPORT=51820 `#optional` \
  -e PEERS=1 `#optional` \
  -e PEERDNS=auto `#optional` \
  -e INTERNAL_SUBNET=10.13.13.0 `#optional` \
  -e ALLOWEDIPS=0.0.0.0/0 `#optional` \
  -p 51820:51820/udp \
  -v /path/to/appdata/config:/config \
  -v /lib/modules:/lib/modules \
  --sysctl="net.ipv4.conf.all.src_valid_mark=1" \
  wireguard-telegraf:latest
```
