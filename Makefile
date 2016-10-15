
watch:
	jekyll serve --watch --draft

build:
	JEKYLL_ENV=production jekyll build --lsi

deploy:
	surge -p _site -d craigbeck.io

pdf:
	wkhtmltopdf --print-media-type  http://127.0.0.1:4000/resume/ public/resume.pdf

check:
	jekyll doctor
