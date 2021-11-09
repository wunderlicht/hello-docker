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
| Artefact                | Size (Bytes) | Size (MB) |Docker Size (MiB)|
|-------------------------|-------------:|----------:|-------:|
|Binary                   |      5988608 |      5.71 | -  
|Build/run container      |    321389403 |    306.50 | 321.39 |
|Multistage distroless    |              |           |
|Multistage from scratch  |              |           |

* Size in Bytes as reported by
`docker image inspect IMAGE --format='{{.Size}}'`
* Size in megabytes (MB) is calculated by Bytes/1024/1024
* Docker Size in MiB is reported by docker and calculated by Bytes/1000/1000

## Further Areas of Interest
It is obvious that size plays a role in everything related
to downloading and deploying images. What is the impact on
starting time?