
FROM golang:latest
COPY http.go /go/bin/http.go
RUN set -eux; \
    go version; \
    cd /go/bin; \
    go build http.go; \
    rm http.go
EXPOSE 3000
ENTRYPOINT ["bash", "-c", "/go/bin/http", "&"]
