# Constants
NAME     := gh-pubkey
VERSION  := v0.0.2
REVISION := $(shell git rev-parse --short HEAD)

SRCS    := $(shell find . -type f -name '*.go')
LDFLAGS := -ldflags="-s -w -X \"main.Version=$(VERSION)\" -X \"main.Revision=$(REVISION)\" -extldflags \"-static\""

PACKS   := golang.org/x/oauth2 github.com/google/go-github/github

.PHONY: clean
clean:
	@rm -fvr ./dist

.PHONY: get
get:
	@for pack in $(PACKS); do go get $$pack; done

.PHONY: cross-build
cross-build: get darwin-amd64 linux-amd64 linux-arm

.PHONY: darwin-amd64
darwin-amd64:
	GOOS=darwin GOARCH=amd64 CGO_ENABLED=0 go build -a -tags netgo -installsuffix netgo $(LDFLAGS) -o dist/darwin-amd64/$(NAME)

.PHONY: linux-amd64
linux-amd64:
	GOOS=linux GOARCH=amd64 CGO_ENABLED=0 go build -a -tags netgo -installsuffix netgo $(LDFLAGS) -o dist/linux-amd64/$(NAME)

.PHONY: linux-arm
linux-arm:
	GOOS=linux GOARCH=arm CGO_ENABLED=0 go build -a -tags netgo -installsuffix netgo $(LDFLAGS) -o dist/linux-arm/$(NAME)

.PHONY: dist
dist: cross-build
	@cd dist && find * -type d -exec tar -zcf $(NAME)-$(VERSION)-{}.tar.gz {} \; && cd ..
