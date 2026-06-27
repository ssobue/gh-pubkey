# Print Public Key Tool of Github for Open SSH Server

* Build Status: [![Go](https://github.com/ssobue/gh-pubkey/actions/workflows/go.yml/badge.svg?branch=master)](https://github.com/ssobue/gh-pubkey/actions/workflows/go.yml)

Build and Install the Binaries from Source
---
 
* get dependencies
```bash
$ make get
```

* build
```bash
$ make cross-build
```

* packaging
```bash
$ make dist
```

* set AuthorizedKeysCommand to Open SSH Server Configure File(`sshd_config`)
```
AuthorizedKeysCommand /path/to/gh-pubkey
AuthorizedKeysCommandUser nobody
```
