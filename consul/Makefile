IMAGE       := ldejager/consul
REPOSITORY  := docker.io/$(IMAGE)
VERSION     := 0.6.4
ROOTDIR     := $(abspath $(dir $(lastword $(MAKEFILE_LIST))))
BUILD_OPTS  :=

ifdef NOCACHE
	BUILD_OPTS	:= $(BUILD_OPTS) --no-cache
endif

.PHONY: all build tag tag/$(VERSION) push push/$(VERSION) clean

all: build tag tag/$(VERSION) push push/$(VERSION)

build:
	@echo "==> Building docker image: $(IMAGE)"
	@docker build $(BUILD_OPTS) -t $(IMAGE) $(ROOTDIR)

tag/$(VERSION):
	@echo "==> Tagging docker image $(IMAGE) with version $(VERSION)"
	@docker tag -f $(IMAGE):latest $(REPOSITORY):$(VERSION)

tag: tag/$(VERSION)
	@echo "==> Tagging docker image $(IMAGE) with version $(VERSION)"
	@docker tag -f $(REPOSITORY):$(VERSION) $(REPOSITORY):latest

push/$(VERSION): tag
	@echo "==> Pushing docker image $(IMAGE) version $(VERSION)"
	@docker push $(REPOSITORY):$(VERSION)

push: | push/$(VERSION)
	@echo "==> Pushing docker image $(IMAGE) version $(VERSION)"
	@docker push $(REPOSITORY):latest

setversion:
	@echo "==> Setting new version: $(VERSION)"
	@sed -i s/'ENV VERSION .*$$'/'ENV VERSION $(VERSION)'/ $(ROOTDIR)/Dockerfile
	@sed -ie s/'^\(VERSION\s*:=\s\).*$$'/'\1$(VERSION)'/ $(ROOTDIR)/Makefile
	@git add $(ROOT)/Dockerfile $(ROOTDIR)/Makefile
	@git commit -m "Update to $(VERSION)"

clean:
	@echo "==> Cleaning docker image: $(IMAGE)"
	@docker rmi -f $(IMAGE)
