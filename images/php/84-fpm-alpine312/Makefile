
build-dev: ## Build the container for prod without watchman
	docker buildx build --push \
    --platform linux/arm64/v8,linux/amd64 \
    --file Dockerfile \
    --tag tomaskrcal99/php:${IMAGE_TAG} .

build: ## Build the container for prod without watchman
	docker buildx build --push \
	--file prod.Dockerfile \
	--platform linux/arm64/v8,linux/amd64 \
	--tag tomaskrcal99/php:${IMAGE_TAG} .

