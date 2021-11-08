package main

import (
	"fmt"
	"net/http"
)

// all errors are ignored, which is highly discouraged in any
// circumstances other than this tiny little demo.
// It's about the containers, not their content ;-)

func hello(w http.ResponseWriter, _ *http.Request) {
	_, _ = fmt.Fprintf(w, "hello\n")
}

func main() {
	http.HandleFunc("/", hello)
	_ = http.ListenAndServe(":8080", nil)
}
