IMAGE       = cherokee
REPO        = managedkaos
COMMIT_HASH = $(shell git rev-parse --short HEAD)
TAGS        = alpine latest $(COMMIT_HASH)

all: build tag push

build:
	docker build --tag "$(IMAGE)" .
tag:
	$(foreach tag, $(TAGS), docker image tag "$(IMAGE)" "$(REPO)/$(IMAGE):$(tag)";)

push:
	docker push --all-tags "$(REPO)/$(IMAGE)"

.PHONY: all build tag push
