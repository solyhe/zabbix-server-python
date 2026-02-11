FROM zabbix/zabbix-server-pgsql

USER root

COPY requirements.txt /tmp/

RUN apk add --no-cache python3.10 py3-pip \
 && pip3 install --no-cache-dir --break-system-packages -r /tmp/requirements.txt \
 && rm /tmp/requirements.txt

USER zabbix
