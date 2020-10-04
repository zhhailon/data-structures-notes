.DEFAULT_GOAL := docs

DOCKER_TAG = pandoc-pp
DIR_NAME := $(PWD)

#######################################
# Build Targets

all: check dockerbuild docs

dockerbuild:
	docker build -t $(DOCKER_TAG) .

docs: README.md
	docker run --rm -v $(DIR_NAME):/doc $(DOCKER_TAG) -img docs $< > docs/index.md

check:
	@if ! which docker 2>&1 > /dev/null; then \
	  echo "ERROR: Docker must be installed as a dependency"; \
	fi

clean:  ## Cleans all temprary files
	rm -rf docs/index.md
