FROM golang:1.23 AS builder

WORKDIR /app

COPY . .

# Build the Go app
RUN go mod init example.com/k8s-go-app
RUN go build -o app .

FROM alpine:latest
WORKDIR /root/
COPY --from=builder /app/app .

EXPOSE 8080

CMD ["./app"]