
all: build deploy

watch:
	jekyll serve --watch

build:
	jekyll build --lsi

deploy:
	surge -p _site -d craigbeck.io

