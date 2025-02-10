docker build -t github-pages-local .
docker create --name temp-container github-pages-local
docker run --rm -p 4000:4000 -v $(pwd)/blog:/site github-pages-local
