# hello-docker
A super simple demo to document my journey to reasonably sized docker
containers.

## Task at Hand
Build a docker container as small as possible for the simple http server
in main.go.

## Yeah... Why?
Actually because I was shocked how big images can become when you
use the same image to build and run your app.

I thought to myself, now we have it all in containers, but it
takes ages to download these things from a repo and to start them
just because they are huge?! Not a good practice.

## Docker Build
We will dockerize our little http server with different dockerfiles
and look at the sizes of the resulting containers. 

## Size Comparison
The size of the final version (hello-docker:scratch-stripped)
is actually only 0.5% of our naive starting point (hello-docker:golang).

* Built on Intel macOS targeting linux `GOOS=linux GOARCH=amd64 go build`
* Size in Bytes as reported by `ls` (for binaries) or
  `docker image inspect IMAGE --format='{{.Size}}'` (for images)
* Size in megabytes (MB) is calculated by Bytes/1024/1024
* Docker Size in MiB as reported by docker or calculated
  by Bytes/1000/1000 (for the binary)

### go 1.17
| Artefact                     | FROM                            | Size (Bytes) | Size (MB) | Docker Size (MiB) |
|------------------------------|---------------------------------|-------------:|----------:|------------------:|
| go binary                    | n/a                             |      6074550 |      5.79 |              6.07 |
| Build and run                | golang                          |    946851894 |    902.99 |            947.00 |
| Build and run                | golang:alpine                   |    321389403 |    306.50 |            321.39 |
| Multistage distroless        | gcr.io/distroless/base-debian10 |     25272869 |     24.10 |             25.30 |
| Multistage distroless-static | gcr.io/distroless/static        |      8427234 |      8.04 |              8.43 |
| Multistage scratch           | scratch                         |      6065490 |      5.78 |              6.07 |
| Multistage scratch stripped  | scratch                         |      4280320 |      4.08 |              4.28 |

### go 1.22
| Artefact                     | FROM                            | Size (Bytes) | Size (MB) | Docker Size (MiB) |
|------------------------------|---------------------------------|-------------:|----------:|------------------:|
| go binary                    | n/a                             |      7018400 |      6.69 |              7.02 |
| Build and run                | golang                          |    896479848 |    854.95 |            896.48 |
| Build and run                | golang:alpine                   |    302926120 |    288.89 |            302.92 |
| Multistage distroless        | gcr.io/distroless/base-debian10 |     26235740 |     25.02 |             26.24 |
| Multistage distroless-static | gcr.io/distroless/static        |      9571359 |      9.13 |              9.57 |
| Multistage scratch           | scratch                         |      7002237 |      6.67 |              7.00 |
| Multistage scratch stripped  | scratch                         |      4771992 |      4.55 |              4.77 |


## Reproducing the results
run `make` to get help and rebuild the parts yourself. See above how to get the numbers.

## Further Areas of Interest
It is obvious that size plays a role in everything related
to downloading and deploying images. What is the impact on
starting time?