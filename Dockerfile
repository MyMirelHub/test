# Use the official Golang image as the base image
FROM golang:1.23 AS builder

WORKDIR /app

COPY go.mod ./

RUN go mod download

COPY . .

RUN go build -o app .

FROM alpine:latest
WORKDIR /root/
COPY --from=builder /app/app .

EXPOSE 8080

CMD ["./app"]