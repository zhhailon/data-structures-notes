MAIN := notes.md
CHAPS  := $(wildcard chaps/*.md)
TARGET := README.md

PP_EXE := pandoc-pp

.DEFAULT_GOAL := $(TARGET)

#######################################
# Build Targets

$(TARGET): $(MAIN) $(CHAPS)
	mkdir -p imgs
	$(PP_EXE) $< > $@

clean:  ## Cleans all temprary files
	rm $(TARGET) imgs/*
