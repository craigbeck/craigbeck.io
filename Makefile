# JEKYLL_VERSION=${JEKYLL_VERSION:-4}

build:
	docker run --rm --volume="$${PWD}:/srv/jekyll:Z" --volume="$${PWD}/vendor/bundle:/usr/local/bundle:Z" jekyll/jekyll:4 jekyll build --incremental

watch:
	docker run --rm --volume="$${PWD}:/srv/jekyll:Z" -p 4000:4000 --volume="$${PWD}/vendor/bundle:/usr/local/bundle:Z" jekyll/jekyll:4 jekyll serve

serve: watch
	open http://localhost:4000

deploy:
	surge -p _site -d craigbeck.io

publish: deploy

clean:
	rm -rf _site

check:
	docker run --rm --volume="$${PWD}:/srv/jekyll:Z" -p 4000:4000 --volume="$${PWD}/vendor/bundle:/usr/local/bundle:Z" jekyll/jekyll:4 jekyll doctor

