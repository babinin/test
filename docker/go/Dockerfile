
FROM ubuntu:rolling

RUN apt-get update && apt-get install -y --no-install-recommends wget ca-certificates mc && rm -rf /var/lib/apt/lists/*
RUN set -eux; \
    mkdir /opt/go; \
    mkdir /opt/go/hello

COPY http.go /opt/go/hello/http.go

RUN set -eux; \
    wget https://dl.google.com/go/go1.11.5.linux-amd64.tar.gz -O go.tgz; \
    tar -xzf go.tgz -C /opt/; \
    rm go.tgz; \
    export PATH="/opt/go/bin:$PATH"; \
    go version; \
    cd /opt/go/hello; \
    go build http.go

RUN apt-get -y purge --autoremove wget ca-certificates

EXPOSE 3000
ENV GOPATH /opt/go
ENV PATH $GOPATH/bin:/opt/go/bin:$PATH
WORKDIR $GOPATH

ENTRYPOINT ["bash", "-c", "/opt/go/hello/http", "&"]
