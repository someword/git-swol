FROM golang:alpine AS builder
WORKDIR $GOPATH/src/some/thing
COPY main.go $GOPATH/src/some/thing/main.go
RUN go build -o /go/bin/blazers

FROM scratch
# Copy our executable from the builder
COPY --from=builder /go/bin/blazers /go/bin/blazers
# Run the hello binary.
ENTRYPOINT ["/go/bin/blazers"]
