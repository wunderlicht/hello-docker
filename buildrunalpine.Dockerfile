FROM golang:1.22-alpine

WORKDIR /app

COPY go.mod .
COPY *.go ./

RUN go build -o /hello-docker

EXPOSE 8080

CMD [ "/hello-docker" ]