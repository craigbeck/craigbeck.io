watch:
  jekyll serve --watch --draft --port 4001

build:
	JEKYLL_ENV=production jekyll build --lsi

deploy:
	surge -p _site -d craigbeck.io

pdf:
	wkhtmltopdf --print-media-type  http://127.0.0.1:4000/resume/ public/resume.pdf

clean:
	rm -rf _site

check:
	jekyll doctor

linkpost:
	bundle exec octopress new post "${title}" --template linkpost
