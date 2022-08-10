help:
	@echo "USAGE:"
	@echo "make [golang|alpine|alpine-static|distroless|distroless-static|scratch|scratch-stripped]"
	@echo "	build an image"
	@echo "make images"
	@echo "	build all images (might take a while)"
	@echo "make [exe|exe-static|exe-stripped]"
	@echo "	build an executable"
	@echo "make executables"
	@echo "	build all executables"
	@echo "make all"
	@echo "	build all images and all executables (might take a while)"

all: images executables

images: golang alpine alpine-static distroless distroless-static scratch scratch-stripped

executables: exe exe-static exe-stripped

golang:
	docker build -t hello-docker:golang -f buildrun.Dockerfile .

alpine:
	docker build -t hello-docker:alpine -f buildrunalpine.Dockerfile .

alpine-static:
	docker build -t hello-docker:alpine-static -f buildrunstatic.Dockerfile .

distroless:
	docker build -t hello-docker:distroless -f multistagedistroless.Dockerfile .

distroless-static:
	docker build -t hello-docker:distroless-static -f multistagedistrolessstatic.Dockerfile .

scratch:
	docker build -t hello-docker:scratch -f multistagescratch.Dockerfile .

scratch-stripped:
	docker build -t hello-docker:scratch-stripped -f multistagescratchstripped.Dockerfile .

exe:
	go build

exe-static:
	CGO_ENABLED=0 go build -o hello-docker-static

exe-stripped:
	CGO_ENABLED=0 go build -ldflags="-s -w" -o hello-docker-stripped
