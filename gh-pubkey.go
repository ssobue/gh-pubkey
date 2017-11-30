package main

import (
	"os"
	"fmt"
	"context"
	"golang.org/x/oauth2"
	"github.com/google/go-github/github"
)

func main() {
	// Get Token from System Environment
	token := os.Getenv("GITHUB_TOKEN")
	if token == "" {
		fmt.Fprint(os.Stderr,"NO TOKEN\n")
		os.Exit(1)
	}

	// Get User Name from Command Line Argument
	if len(os.Args) == 1 {
		fmt.Fprint(os.Stderr,"NO USER NAME\n")
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
