.PHONY: fmt test vet build check

fmt:
	gofmt -w $$(find . -name '*.go' -type f)

test:
	go test ./...

vet:
	go vet ./...

build:
	go build ./...

check: fmt test vet build
