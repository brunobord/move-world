PANDOC_ROOT=pandoc --standalone -f markdown_github -t html
PANDOC=$(PANDOC_ROOT) --css=css/layout.css --css=css/styles.css
PANDOC_PB=$(PANDOC_ROOT) --css=../css/layout.css --css=../css/styles.css

.PHONY: build
build:
	# target directories
	mkdir -p build/css/
	mkdir -p build/playbooks/
	# build index
	$(PANDOC) README.md -o build/index.html
	# Replace playbooks URLS
	sed -i '' 's/.md/.html/' build/index.html
	# build playbooks
	$(PANDOC_PB) playbooks/the-clumsy.md -o build/playbooks/the-clumsy.html
	$(PANDOC_PB) playbooks/the-jog.md -o build/playbooks/the-jog.html
	$(PANDOC_PB) playbooks/the-lifter.md -o build/playbooks/the-lifter.html
	$(PANDOC_PB) playbooks/the-nimble.md -o build/playbooks/the-nimble.html
	# Copy styles
	cp -r css/* build/css/


.PHONY: clean
clean:
	# clean up the build directories
	rm -Rf build/
