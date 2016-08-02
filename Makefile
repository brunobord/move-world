PANDOC=pandoc --standalone -f markdown_github -t html --css=css/layout.css
PANDOC_PB=pandoc --standalone -f markdown_github -t html --css=../css/layout.css

.PHONY: build
build:
	# index
	mkdir -p build/css/
	mkdir -p build/playbooks/
	$(PANDOC) README.md -o build/index.html
	# Replace plabooks URLS
	sed -i '' 's/.md/.html/' build/index.html
	$(PANDOC_PB) playbooks/the-clumsy.md -o build/playbooks/the-clumsy.html
	$(PANDOC_PB) playbooks/the-jog.md -o build/playbooks/the-jog.html
	$(PANDOC_PB) playbooks/the-lifter.md -o build/playbooks/the-lifter.html
	$(PANDOC_PB) playbooks/the-nimble.md -o build/playbooks/the-nimble.html
	# Copy styles
	cp -r css/* build/css/
