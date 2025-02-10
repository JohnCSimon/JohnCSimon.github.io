rm -rf ./docs
docker build -t github-pages-local .
docker create --name temp-container github-pages-local
docker cp temp-container:/output ./docs
docker rm temp-container
