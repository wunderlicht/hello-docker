FROM golang:1.25-alpine

WORKDIR /app

COPY go.mod .
COPY *.go ./

RUN go build -o /hello-docker

EXPOSE 8080

CMD [ "/hello-docker" ]