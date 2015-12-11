IMAGE       := ldejager/consul-agent
REPOSITORY  := docker.io/$(IMAGE)
VERSION     := 0.6.0
ROOTDIR     := $(abspath $(dir $(lastword $(MAKEFILE_LIST))))
BUILD_OPTS  :=

ifdef NOCACHE
	BUILD_OPTS	:= $(BUILD_OPTS) --no-cache
endif

.PHONY: all build tag tag/$(VERSION) push push/$(VERSION) clean

all: build tag tag/$(VERSION) push push/$(VERSION)

build:
	@docker build $(BUILD_OPTS) -t $(IMAGE) $(ROOTDIR)

tag/$(VERSION):
	@docker tag -f $(IMAGE):latest $(REPOSITORY):$(VERSION)

tag: tag/$(VERSION)
	@docker tag -f $(REPOSITORY):$(VERSION) $(REPOSITORY):latest

push/$(VERSION): tag
	@docker push $(REPOSITORY):$(VERSION)

push: | push/$(VERSION)
	@docker push $(REPOSITORY):latest

setversion:
	@sed -i s/'ENV VERSION .*$$'/'ENV VERSION $(VERSION)'/ $(ROOTDIR)/Dockerfile
	@sed -ie s/'^\(VERSION\s*:=\s\).*$$'/'\1$(VERSION)'/ $(ROOTDIR)/Makefile
	@git add $(ROOT)/Dockerfile $(ROOTDIR)/Makefile
	@git commit -m "Update to $(VERSION)"

clean:
	@docker rmi -f $(IMAGE)

