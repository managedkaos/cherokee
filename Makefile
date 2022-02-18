OS = alpine

all: $(OS)

$(OS):
	$(MAKE) -C $@

start run:
	docker run --rm -detach \
    --publish 80:80 \
    --publish 443:443 \
    --publish 9090:9090 \
    --name cherokee \
    managedkaos/cherokee

exec:
	docker exec -it cherokee sh
stop:
	docker stop cherokee

.PHONY: all start run stop $(OS)
