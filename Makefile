USER := $(shell id -u)
GROUP := $(shell id -g)
TAG := "neworldlt/gollum:latest"

all: build run

build:
	docker build -t $(TAG) .

run:
	docker run --rm -p 4567:4567 --name gollum-test -it -u $(USER):$(GROUP) $(TAG)

publish:
	docker push $(TAG)
