FROM golang:1.22-alpine

WORKDIR /app

COPY go.mod .
COPY *.go ./

RUN CGO_ENABLED=0 go build -o /hello-docker

EXPOSE 8080

CMD [ "/hello-docker" ]