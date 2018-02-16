# Print Public Key Tool of Github for Open SSH Server

* Build Status: [![CircleCI](https://circleci.com/gh/ssobue/gh-pubkey/tree/master.svg?style=svg)](https://circleci.com/gh/ssobue/gh-pubkey/tree/master)

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
