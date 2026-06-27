# AGENTS.md

## Repository Notes

- This repository is a Go CLI project. Prefer keeping build and dependency changes small and focused.
- The default branch is `master`.
- Local Go commands may fail in the Codex sandbox if Go tries to write under `$HOME/go` or `$HOME/Library/Caches/go-build`. When that happens, rerun with writable temporary caches, for example:

```sh
mkdir -p /tmp/gh-pubkey-gopath /tmp/gh-pubkey-gocache
GOPATH=/tmp/gh-pubkey-gopath GOCACHE=/tmp/gh-pubkey-gocache go test ./...
GOPATH=/tmp/gh-pubkey-gopath GOCACHE=/tmp/gh-pubkey-gocache make linux-amd64
GOPATH=/tmp/gh-pubkey-gopath GOCACHE=/tmp/gh-pubkey-gocache make linux-arm64
```

## Build And CI

- The GitHub Actions workflow is `.github/workflows/go.yml`.
- For Linux release binaries, build `linux-amd64` and `linux-arm64` using the existing Makefile targets.
- When changing artifact behavior, verify the completed workflow run and confirm expected artifacts exist, for example with:

```sh
gh run watch <run-id> --exit-status
gh api /repos/ssobue/gh-pubkey/actions/runs/<run-id>/artifacts --jq '.artifacts[] | .name'
```

## Commit Hygiene

- Split unrelated changes into meaningful commits. For example, keep README badge updates separate from CI behavior changes.
- Before committing, check `git status --short` and review the staged diff.
