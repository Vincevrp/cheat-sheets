# Define input and output directories
INPUT := src
OUTPUT := docs
TEMPLATES := templates

# Define input and output files
INPUT_FILES := $(wildcard $(INPUT)/*.md)
OUTPUT_FILES := $(patsubst %.md,%.pdf,$(subst $(INPUT),$(OUTPUT),$(INPUT_FILES)))

all: $(OUTPUT_FILES)

# Pandoc
$(OUTPUT)/%.pdf: $(INPUT)/%.md
	mkdir -p docs
	pandoc \
		--number-sections \
		--metadata-file=$(TEMPLATES)/meta.yml \
		--include-in-header=$(TEMPLATES)/header.tex \
		--listings \
		-f markdown  $< \
		-o $@

.PHONY : clean

clean:
	rm -f $(OUTPUT)/*

