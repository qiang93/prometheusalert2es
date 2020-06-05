FROM golang:latest AS builder

# RUN go get -u github.com/qiang93/prometheusalert2es
COPY . /go/src/github.com/qiang93/prometheusalert2es
WORKDIR /go/src/github.com/qiang93/prometheusalert2es
RUN go build -o prometheusalert2es main.go

FROM reg.deeproute.ai/deeproute-public/ubuntu:18.04
COPY --from=builder /go/src/github.com/qiang93/prometheusalert2es/prometheusalert2es /usr/local/bin/
ENTRYPOINT ["prometheusalert2es"]

