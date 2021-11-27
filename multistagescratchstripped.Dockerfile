## Build stage
FROM golang:1.17-alpine AS build

WORKDIR /app

COPY go.mod .
COPY *.go ./

RUN CGO_ENABLED=0 go build -ldflags="-s -w" -o /hello-docker


## Deploy
FROM scratch

WORKDIR /

COPY --from=build /hello-docker /hello-docker

EXPOSE 8080

CMD ["/hello-docker"]