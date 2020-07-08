FROM golang:1.14.4-buster AS builder

WORKDIR /build/
COPY . .

RUN go build -mod=vendor -tags netgo -o app .

FROM debian:buster-slim

COPY --from=builder /build/app /

CMD ["/app"]