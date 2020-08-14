OS = alpine

all: $(OS)

$(OS):
	$(MAKE) -C $@

.PHONY: all $(OS)
