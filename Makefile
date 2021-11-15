help:
	@echo "use make [golang|alpine|alpine-static|distroless|scratch] to build an image"
	@echo "use make all to build all images (might take a while)"

all: golang alpine alpine-static distroless scratch

golang:
	docker build -t hello-docker:golang -f buildrun.Dockerfile .

alpine:
	docker build -t hello-docker:alpine -f buildrunalpine.Dockerfile .

alpine-static:
	docker build -t hello-docker:alpine-static -f buildrunstatic.Dockerfile .

distroless:
	docker build -t hello-docker:distroless -f multistagedistroless.Dockerfile .

scratch:
	docker build -t hello-docker:scratch -f multistagescratch.Dockerfile .
