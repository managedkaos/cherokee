MARKDOWN_FILES := $(shell find . -type f -name '*.md' -not -path './.git/*')

OS := alpine

all: $(OS)

$(OS):
	$(MAKE) -C $@

lint:
	@echo "### Linting Markdown files..."
	@docker run --rm -v $(PWD):/workdir davidanson/markdownlint-cli2:v0.13.0 $(CONTENT_FILES) 2>&1 | \
		docker run --rm --interactive ghcr.io/managedkaos/summarize-markdown-lint:main
	@echo

spellcheck:
	@echo "### Spell checking Markdown files..."
	@for file in $(MARKDOWN_FILES); do \
		aspell check --mode=markdown --lang=en $$file; \
	done
	@echo "### Spell checking prompt generation files..."
	@find . -type f -name ./80-prompts/generation\*txt -exec aspell check --mode=markdown {} \; -print
	@echo

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
