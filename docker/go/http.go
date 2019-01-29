package main

import (
    "fmt"
    "os"
    "net/http"
)

func main() {
	name, err := os.Hostname()
	if err != nil {
		panic(err)
	}

    http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "Hello, from: %s\n", name)
    })

    http.ListenAndServe(":3000", nil)
}
