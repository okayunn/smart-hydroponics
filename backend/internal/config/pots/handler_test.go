package pots

import (
	"net/http"
	"net/http/httptest"
	"testing"
)

func TestList(t *testing.T) {
	req := httptest.NewRequest(http.MethodGet, "/api/v1/pots", nil)
	rec := httptest.NewRecorder()

	List(rec, req)

	if rec.Code != http.StatusOK {
		t.Fatalf("status = %d, want %d", rec.Code, http.StatusOK)
	}

	want := `[{"id":"6ba7b810-9dad-41d1-80b4-00c04fd430c8","plant_name":"スイートバジル","conditions":[]}]` + "\n"
	if rec.Body.String() != want {
		t.Fatalf("body = %s, want %s", rec.Body.String(), want)
	}
}

func TestDetail(t *testing.T) {
	mux := http.NewServeMux()
	mux.HandleFunc("GET /api/v1/pots/{potId}", Detail)

	req := httptest.NewRequest(http.MethodGet, "/api/v1/pots/{6ba7b810-9dad-41d1-80b4-00c04fd430c8}", nil)
	rec := httptest.NewRecorder()

	mux.ServeHTTP(rec, req)

	if rec.Code != http.StatusOK {
		t.Fatalf("status = %d, want %d", rec.Code, http.StatusOK)
	}

	want := `{"id":"6ba7b810-9dad-41d1-80b4-00c04fd430c8","plant_name":"スイートバジル","conditions":["WATER_LEVEL_LOW","WATER_TEMPERATURE_LOW"],"latest_measurement":{"temperature_c":16,"humidity_percent":30,"illuminance_lux":200,"water_temperature_c":15,"water_level_percent":30,"water_volume_l":3.3,"measured_at":"2026-11-13T09:30:00+09:00"}}` + "\n"

	if rec.Body.String() != want {
		t.Fatalf("body = %s, want %s", rec.Body.String(), want)
	}
}
