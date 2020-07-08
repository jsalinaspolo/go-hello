package main

import (
	"auth0/internal/service"
	"fmt"
	"net/http"
	"os"
)

type HelloServer interface {
	SayHello(string) string
}

var helloServer HelloServer

func main() {
	host := os.Getenv("HOST")
	port := os.Getenv("PORT")
	address := fmt.Sprintf("%s:%s", host, port)

	fmt.Printf("Listening at %s\n", address)

	helloServer = &service.HelloService{}

	http.HandleFunc("/", handler)
	http.ListenAndServe(address, nil)
}

func handler(w http.ResponseWriter, r *http.Request) {
	fmt.Fprint(w, helloServer.SayHello(r.URL.Path[1:]))
}
