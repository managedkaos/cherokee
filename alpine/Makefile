REPO        = managedkaos
IMAGE       = cherokee
COMMIT_HASH = $(shell git rev-parse --short HEAD)
TAGS        = latest alpine-$(COMMIT_HASH)

all: build tag push

build:
	docker build --no-cache --progress=plain --tag "local-$(IMAGE)" .

tag:
	$(foreach tag, $(TAGS), docker image tag "$(IMAGE)" "$(REPO)/$(IMAGE):$(tag)";)

run:
	docker run --rm -it --name cherokee "local-$(IMAGE)"

daemon:
	docker run --rm -d --name cherokee "local-$(IMAGE)"

exec:
	docker exec -it cherokee /bin/bash

clean:
	docker stop cherokee || true
	docker rm cherokee || true

nuke: clean
	docker rmi "local-$(IMAGE)" || true

push:
	docker push --all-tags "$(REPO)/$(IMAGE)"

.PHONY: all build tag push
