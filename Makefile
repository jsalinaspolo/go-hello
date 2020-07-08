IMAGE_NAME := go-hello
ENTRYPOINT = main.go
VERSION := 1.0

.PHONY: run build test

run:
	@HOST=localhost PORT=8080 go run $(ENTRYPOINT)

unit-test:
	docker build -f Dockerfile.test .

build:
	docker build --tag $(IMAGE_NAME) -f Dockerfile .

test: unit-test build

tag:
	@echo "***Tagging $(IMAGE_NAME) $(VERSION)***"
    docker tag $(IMAGE_NAME) $(IMAGE_NAME):$(VERSION)
#     docker tag $(IMAGE_NAME) $(DOCKER_REGISTRY)/$(IMAGE_NAME):$(VERSION)
#     docker tag $(IMAGE_NAME) $(DOCKER_REGISTRY)/$(IMAGE_NAME):latest

publish-artifact:
	@echo "***Pushing $(IMAGE_NAME) $(VERSION)***"
# 	docker push $(DOCKER_REGISTRY)/$(IMAGE_NAME):$(VERSION)
# 	docker push $(DOCKER_REGISTRY)/$(IMAGE_NAME):latest

publish: build tag publish-artifact

