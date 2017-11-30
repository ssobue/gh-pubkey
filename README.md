# Print Public Key Tool of Github for Open SSH Server

* Build Status: [![CircleCI](https://circleci.com/gh/ssobue/github_public_key/tree/master.svg?style=svg)](https://circleci.com/gh/ssobue/github_public_key/tree/master)

Build and Install the Binaries from Source
---
 
* get dependencies
```bash
$ go get -u golang.org/x/oauth2
$ go get -u github.com/google/go-github/github
```

* build
```bash
$ go build
```

* set AuthorizedKeysCommand to Open SSH Server Configure File(`sshd_config`)
```
AuthorizedKeysCommand /path/to/gh-pubkey
AuthorizedKeysCommandUser nobody
```
