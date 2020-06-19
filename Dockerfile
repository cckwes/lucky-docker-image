FROM crystallang/crystal:0.35.0

RUN apt-get update && apt-get install -y git wget postgresql-client

RUN set -ex \
    && git clone https://github.com/luckyframework/lucky_cli \
    && cd lucky_cli \
    && git checkout v0.22.0 \
    && shards install \
    && crystal build src/lucky.cr --release --no-debug \
    && mv lucky /usr/local/bin/lucky \
    && cd .. \
    && rm -rf lucky_cli

RUN set -ex \
    && wget -q https://github.com/DarthSim/overmind/releases/download/v2.1.1/overmind-v2.1.1-linux-amd64.gz \
    && gunzip overmind-v2.1.1-linux-amd64.gz \
    && chmod +x overmind-v2.1.1-linux-amd64 \
    && mv overmind-v2.1.1-linux-amd64 /usr/local/bin/overmind

