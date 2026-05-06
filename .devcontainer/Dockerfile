FROM ubuntu:22.04
RUN apt-get update && apt-get upgrade -y && apt-get install -y git curl ca-certificates \
    && curl -L -o /usr/local/bin/opa https://openpolicyagent.org/downloads/latest/opa_linux_amd64 \
    && chmod +x /usr/local/bin/opa \
    && apt-get clean && rm -rf /var/lib/apt/lists/*
