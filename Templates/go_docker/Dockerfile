FROM golang:alpine as builder
RUN mkdir /build 
ADD . /build/
WORKDIR /build 
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -ldflags '-extldflags "-static"' go_docker_template .

FROM alpine
COPY --from=builder /build/go_docker_template /app/
WORKDIR /app
CMD ["./go_docker_template"]
