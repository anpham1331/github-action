FROM golang:1.15-alpine AS build
WORKDIR /go/src/github.com/anpham1331/github-action/lab11
COPY go.mod .
RUN go mod download
COPY ./lab11/github-action/main.go .
ADD ./lab11/github-action/microservice ./microservice
RUN CGO_ENABLED=0 go build -o /bin/helloserver
FROM scratch
COPY --from=build /bin/helloserver /bin/helloserver
ENTRYPOINT ["/bin/helloserver]
