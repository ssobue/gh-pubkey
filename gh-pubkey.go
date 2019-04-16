package main

import (
	"context"
	"fmt"
	"github.com/google/go-github/github"
	"golang.org/x/oauth2"
	"io/ioutil"
	"os"
)

func main() {
	// Get Token from System Environment
	token := os.Getenv("GITHUB_TOKEN")
	if token == "" {
		dat, err := ioutil.ReadFile("/etc/github-token")
		if err != nil {
			_, _ = fmt.Fprint(os.Stderr, "NO TOKEN\n")
			os.Exit(1)
		}
		token = string(dat)
	}

	// Get User Name from Command Line Argument
	if len(os.Args) == 1 {
		_, _ = fmt.Fprint(os.Stderr, "NO USER NAME\n")
		os.Exit(2)
	}
	user := os.Args[1]

	// Initialize Client
	ctx := context.Background()
	ts := oauth2.StaticTokenSource(
		&oauth2.Token{AccessToken: token},
	)
	tc := oauth2.NewClient(oauth2.NoContext, ts)
	client := github.NewClient(tc)

	// Get User's Public Keys
	keys, _, _ := client.Users.ListKeys(ctx, user, nil)

	// Print Keys
	for i := 0; i < len(keys); i++ {
		fmt.Println(keys[i].GetKey())
	}
}
