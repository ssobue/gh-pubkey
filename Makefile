# Constants
NAME     := gh-pubkey
VERSION  := v0.3.0
REVISION := $(shell git rev-parse --short HEAD)

SRCS    := $(shell find . -type f -name '*.go')
LDFLAGS := -ldflags="-s -w -X \"main.Version=$(VERSION)\" -X \"main.Revision=$(REVISION)\" -extldflags \"-static\""

.PHONY: clean
clean:
	rm -fvr ./dist

.PHONY: get
get:
	go get github.com/ssobue/$(NAME)

.PHONY: cross-build
cross-build: get windows-amd64 darwin-amd64 darwin-arm64 linux-amd64 linux-arm linux-arm64

.PHONY: windows-amd64
windows-amd64:
	GOOS=windows GOARCH=amd64 CGO_ENABLED=0 go build -a -tags netgo -installsuffix netgo $(LDFLAGS) -o dist/windows-amd64/$(NAME)

.PHONY: darwin-amd64
darwin-amd64:
	GOOS=darwin GOARCH=amd64 CGO_ENABLED=0 go build -a -tags netgo -installsuffix netgo $(LDFLAGS) -o dist/darwin-amd64/$(NAME)

.PHONY: darwin-arm64
darwin-arm64:
	GOOS=darwin GOARCH=arm64 CGO_ENABLED=0 go build -a -tags netgo -installsuffix netgo $(LDFLAGS) -o dist/darwin-arm64/$(NAME)

.PHONY: linux-amd64
linux-amd64:
	GOOS=linux GOARCH=amd64 CGO_ENABLED=0 go build -a -tags netgo -installsuffix netgo $(LDFLAGS) -o dist/linux-amd64/$(NAME)

.PHONY: linux-arm
linux-arm:
	GOOS=linux GOARCH=arm CGO_ENABLED=0 go build -a -tags netgo -installsuffix netgo $(LDFLAGS) -o dist/linux-arm/$(NAME)

.PHONY: linux-arm64
linux-arm64:
	GOOS=linux GOARCH=arm64 CGO_ENABLED=0 go build -a -tags netgo -installsuffix netgo $(LDFLAGS) -o dist/linux-arm64/$(NAME)

.PHONY: dist
dist: cross-build
	cd dist && find * -type d -exec tar -zcf $(NAME)-$(VERSION)-{}.tar.gz {} \; && cd ..
