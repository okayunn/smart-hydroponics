package main

import (
	"hydroponics/backend/internal/config/pots"
	"log"
	"net/http"
)

func main() {
	mux := http.NewServeMux()
	mux.HandleFunc("GET /api/v1/pots", pots.List)
	mux.HandleFunc("GET /api/v1/pots/{potId}", pots.Detail)

	log.Fatal(http.ListenAndServe(":8080", mux))
}
