// Launch microservice server- main.go
package main

import (
	"log"

	"github.com/anpham1331/github-action/lab11/microservice"
)

func main() {
	s := microservice.NewServer("", "8000")
	log.Fatal(s.ListenAndServe())
}
