all: build

build:
	make build -C consul
	make build -C consul-agent
	make build -C consul-server
	make build -C consul-standalone

push:
	make push -C consul
	make push -C consul-agent
	make push -C consul-server
	make push -C consul-standalone
