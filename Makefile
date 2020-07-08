ENTRYPOINT = main.go

.PHONY: run build test

run:
	@HOST=localhost PORT=8080 go run $(ENTRYPOINT)

unit-test:
	docker build -f Dockerfile.test .

build:
	docker build -f Dockerfile .

test: unit-test build
