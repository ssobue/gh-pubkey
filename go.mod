module github.com/ssobue/gh-pubkey

go 1.26.5

require (
	github.com/google/go-github/v50 v50.2.0
	golang.org/x/oauth2 v0.37.0
)

// Fixes for CVE-2024-24786
replace google.golang.org/protobuf => google.golang.org/protobuf v1.36.8

// Keep the transitive module graph fixed even when no x/net packages are imported.
replace golang.org/x/net => golang.org/x/net v0.62.0

require (
	github.com/ProtonMail/go-crypto v1.3.0 // indirect
	github.com/cloudflare/circl v1.6.3 // indirect
	github.com/google/go-querystring v1.1.0 // indirect
	golang.org/x/crypto v0.58.0 // indirect
	golang.org/x/sys v0.49.0 // indirect
)
