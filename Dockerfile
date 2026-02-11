# 第一阶段：准备 Python 3.10 运行环境
FROM python:3.10-alpine AS python310

# 第二阶段：使用 Alpine 版 Zabbix
FROM zabbix/zabbix-server-pgsql:alpine-latest

USER root

# 复制 Python 3.10 运行时
COPY --from=python310 /usr/local /usr/local

# 验证版本
RUN python3 --version

# 复制依赖
COPY requirements.txt /tmp/

# 安装依赖
RUN pip3 install --no-cache-dir -r /tmp/requirements.txt && \
    rm /tmp/requirements.txt

USER zabbix
