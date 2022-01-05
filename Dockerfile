FROM linuxserver/wireguard:latest

# Install deps
RUN apt-get update && apt-get install wget

# Install Telegraf
RUN wget -qO- https://repos.influxdata.com/influxdb.key | tee /etc/apt/trusted.gpg.d/influxdb.asc >/dev/null && export ID=$(cat /etc/os-release | egrep '^ID\=.*' | cut -d '=' -f2) && export VERSION_CODENAME=$(cat /etc/os-release | egrep '^VERSION_CODENAME\=.*' | cut -d '=' -f2) && echo "deb https://repos.influxdata.com/${ID} ${VERSION_CODENAME} stable" | tee /etc/apt/sources.list.d/influxdb.list && apt-get update && apt-get install telegraf

# Copy in telegraf.conf
COPY telegraf.conf /etc/telegraf/telegraf.conf

# Display config
RUN cat /etc/telegraf/telegraf.conf

# Start telegraf
RUN service telegraf start && sleep 5 && service telegraf status
