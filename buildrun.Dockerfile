FROM golang:1.17-alpine

WORKDIR /app

COPY go.mod .
COPY *.go ./
# build
RUN go build -o /hello-docker

EXPOSE 8080

# Run
CMD [ "/hello-docker" ]