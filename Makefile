.DEFAULT_GOAL := docs

OUT_NAME = data-structures-notes

MAIN_FILE = README.md

DOCKER_TAG = pandoc-pp

DIR_NAME := $(PWD)
DIST_DIR = dist
BUILD_DIR = build
TEMPLATE = eisvogel.latex

#######################################
# Build Targets

all: check dockerbuild docs pdf

dockerbuild:
	docker build -t $(DOCKER_TAG) .

docs: $(MAIN_FILE)
	mkdir -p $@
	docker run --rm -v $(DIR_NAME):/doc $(DOCKER_TAG) -img docs $< > docs/index.md
	echo "title: Data Structures Notes" > docs/_config.yml
	echo "markdown: kramdown" >> docs/_config.yml
	echo "theme: jekyll-theme-primer" >> docs/_config.yml
	echo "license: Creative Commons Attribution-ShareAlike 4.0 International" >> docs/_config.yml
	echo "license-file: https://creativecommons.org/licenses/by-sa/4.0/" >> docs/_config.yml

pdf: $(DIST_DIR)/pdf/$(OUT_NAME).pdf

$(BUILD_DIR)/$(MAIN_FILE): $(MAIN_FILE)
	mkdir -p $(BUILD_DIR)
	docker run --rm -v $(DIR_NAME):/doc $(DOCKER_TAG) -img build $< > $@

$(DIST_DIR)/pdf/$(OUT_NAME).pdf: $(BUILD_DIR)/$(MAIN_FILE)
	mkdir -p $(DIST_DIR)/pdf
	pandoc \
	  --from markdown \
	  --to latex \
	  --template $(TEMPLATE) \
	  --listings \
	  --number-sections \
	  -o $@ \
	  $<

check:
	@if ! which docker 2>&1 > /dev/null; then \
	  echo "ERROR: Docker must be installed as a dependency"; \
	fi

clean:  ## Cleans all temprary files
	rm -rf $(BUILD_DIR) $(DIST_DIR) docs
