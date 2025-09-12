package main

import (
	"fmt"
	"net/http"
	"os"
)

func main() {
	// os.Getenv() akan membaca variabel yang sudah disediakan oleh Docker Compose
	test := os.Getenv("TEST")

	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprintf(w, "Hello, %s!", test)
	})

	fmt.Println("Environment variable TEST:", test)
	fmt.Println("Server listening on port 8080...")
	http.ListenAndServe(":8080", nil)
}
