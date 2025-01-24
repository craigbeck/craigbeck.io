JEKYLL_VERSION=${JEKYLL_VERSION:-4}

watch:
	docker run \
	--rm \
	--volume="${PWD}:/srv/jekyll:Z" \
	-p 4000:4000 \
	--volume="${PWD}/vendor/bundle:/usr/local/bundle:Z" \
	"jekyll/jekyll:${JEKYLL_VERSION}" \
	jekyll serve

build:
	docker run \
	--rm \
	--volume="${PWD}:/srv/jekyll:Z" \
	--volume="${PWD}/vendor/bundle:/usr/local/bundle:Z" \
	"jekyll/jekyll:${JEKYLL_VERSION}" \
	jekyll build

deploy:
	surge -p _site -d craigbeck.io

pdf:
	wkhtmltopdf --print-media-type  http://127.0.0.1:4000/resume/ public/resume.pdf

clean:
	rm -rf _site

check:
	docker run --rm --volume="$PWD:/srv/jekyll:Z" -p 4000:4000 --volume="$PWD/vendor/bundle:/usr/local/bundle:Z" jekyll/jekyll:$JEKYLL_VERSION jekyll doctor

linkpost:
	bundle exec octopress new post "${title}" --template linkpost
