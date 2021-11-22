# hello-docker
A super simple demo to document my journey to reasonably sized docker
containers.

## Task at Hand
Build a docker container as small as possible for the simple http server
in main.go.

## Yeah... Why?
Actually because I was shocked how big images can become when you
use the same image to build and run you app.

I thought to myself, now we have it all in containers, but it
takes ages to download these things from a repo and to start them
just because they are huge?! Not a good practice.

## Docker Build
We will dockerize our little http server with different dockerfiles
and look at the sizes of the resulting containers. 

## Size Comparison
| Artefact                | FROM  |  Size (Bytes) | Size (MB) |Docker Size (MiB)|
|-------------------------|---------------------------------|----------:|-------:|-------:|
|go binary                | n/a                             |   6074550 |   5.79 |   6.07 |
|Build and run            | golang                          | 946851894 | 902.99 | 947.00    |
|Build and run            | golang:alpine                   | 321389403 | 306.50 | 321.39 |
|Multistage distroless    | gcr.io/distroless/base-debian10 |  25272869 |  24.10 |  25.30  |
|Multistage from scratch  | scratch                         |   6065490 |   5.78 |   6.07 |

* Built on MacOS targeting linux `GOOS=linux GOARCH=amd64 go build`
* Size in Bytes as reported by `ls` (binary) or
`docker image inspect IMAGE --format='{{.Size}}'` (images)
* Size in megabytes (MB) is calculated by Bytes/1024/1024
* Docker Size in MiB as reported by docker or calculated
  by Bytes/1000/1000 (for the binary)

## Further Areas of Interest
It is obvious that size plays a role in everything related
to downloading and deploying images. What is the impact on
starting time?