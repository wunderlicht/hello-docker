# chose your docker runtime command
# CRCLI = docker
CRCLI = container

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
	@echo "make clean"
	@echo " CAUTION! Prunes docker from ALL images and deletes the created executables"

all: images executables

images: golang alpine alpine-static distroless distroless-static scratch scratch-stripped

executables: exe exe-static exe-stripped

golang:
	$(CRCLI) build -t hello-docker:golang -f buildrun.Dockerfile .

alpine:
	$(CRCLI) build -t hello-docker:alpine -f buildrunalpine.Dockerfile .

alpine-static:
	$(CRCLI) build -t hello-docker:alpine-static -f buildrunstatic.Dockerfile .

distroless:
	$(CRCLI) build -t hello-docker:distroless -f multistagedistroless.Dockerfile .

distroless-static:
	$(CRCLI) build -t hello-docker:distroless-static -f multistagedistrolessstatic.Dockerfile .

scratch:
	$(CRCLI) build -t hello-docker:scratch -f multistagescratch.Dockerfile .

scratch-stripped:
	$(CRCLI) build -t hello-docker:scratch-stripped -f multistagescratchstripped.Dockerfile .

exe:
	go build

exe-static:
	CGO_ENABLED=0 go build -o hello-docker-static

exe-stripped:
	CGO_ENABLED=0 go build -ldflags="-s -w" -o hello-docker-stripped

clean:
ifeq ($(CRCLI),docker)
	docker system prune --all --force
else ifeq ($(CRCLI), container)
	container prune
	container image delete --all --force
endif

	-rm hello-docker
	-rm hello-docker-static
	-rm hello-docker-stripped