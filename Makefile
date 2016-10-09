
watch:
	jekyll serve --watch

build:
	jekyll build --lsi

deploy: build
	surge -p _site -d craigbeck.io

all: deploy

