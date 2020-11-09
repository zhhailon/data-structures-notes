MAIN := notes.md
CHAPS  := $(wildcard chaps/*.md)
TARGET := README.md

DOCKER_TAG := pandoc-pp

.DEFAULT_GOAL := $(TARGET)

#######################################
# Build Targets

all: check dockerbuild $(TARGET)

dockerbuild:
	docker build -t $(DOCKER_TAG) .

$(TARGET): $(MAIN) $(CHAPS)
	mkdir -p imgs
	docker run --rm -v $(PWD):/doc $(DOCKER_TAG) -img imgs $< > $@

check:
	@if ! which docker 2>&1 > /dev/null; then \
	  echo "ERROR: Docker must be installed as a dependency"; \
	fi

clean:  ## Cleans all temprary files
	rm $(TARGET) imgs/* code/*
