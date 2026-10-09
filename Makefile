.PHONY: fmt test vet build check run

fmt:
	@files="$$(find . -name '*.go' -type f)"; \
	if [ -n "$$files" ]; then gofmt -w $$files; fi

test:
	go test ./...

vet:
	go vet ./...

build:
	go build ./...

run:
	go run ./cmd/nexhound help

check: fmt test vet build
