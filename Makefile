
all: build deploy

watch:
	jekyll serve --watch --draft

build:
	jekyll build --lsi

deploy:
	surge -p _site -d craigbeck.io

check:
	jekyll doctor
