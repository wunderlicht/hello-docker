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
| Artefact                | Size (MB) |
|-------------------------|-----------|
|Binary                   |           |
|Build/run container      |           |
|Multistage distroless    |           |
|Multistage from scratch  |           |

## Further Areas of Interest
It is obvious that size plays a role in everything related
to downloading and deploying images. What is the impact on
starting time?