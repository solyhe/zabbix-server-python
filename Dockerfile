FROM zabbix/zabbix-server-pgsql

USER root

RUN apk add --no-cache \
    python3 \
    py3-pip \
 && pip3 install --no-cache-dir --break-system-packages pymodbus

USER zabbix
