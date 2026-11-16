package pots

import (
	"encoding/json"
	"net/http"
	"time"
)

type Pot struct {
	ID         string   `json:"id"`
	PlantName  string   `json:"plant_name"`
	Conditions []string `json:"conditions"`
}

type PotDetail struct {
	ID                string            `json:"id"`
	PlantName         string            `json:"plant_name"`
	Conditions        []string          `json:"conditions"`
	LatestMeasurement LatestMeasurement `json:"latest_measurement"`
}

type LatestMeasurement struct {
	TemperatureC      float64   `json:"temperature_c"`
	HumidityPercent   float64   `json:"humidity_percent"`
	IlluminanceLux    int       `json:"illuminance_lux"`
	WaterTemperatureC float64   `json:"water_temperature_c"`
	WaterLevelPercent int       `json:"water_level_percent"`
	WaterVolumeL      float64   `json:"water_volume_l"`
	MeasuredAt        time.Time `json:"measured_at"`
}

func List(w http.ResponseWriter, r *http.Request) {
	pots := []Pot{
		{
			ID:         "6ba7b810-9dad-41d1-80b4-00c04fd430c8",
			PlantName:  "スイートバジル",
			Conditions: []string{},
		},
	}

	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(pots)
}

func Detail(w http.ResponseWriter, r *http.Request) {

	potID := r.PathValue("potId")

	// DB取得処理の仮実装
	dbSearch := func(potId string) PotDetail {

		return PotDetail{
			ID:         "6ba7b810-9dad-41d1-80b4-00c04fd430c8",
			PlantName:  "スイートバジル",
			Conditions: []string{"WATER_LEVEL_LOW", "WATER_TEMPERATURE_LOW"},
			LatestMeasurement: LatestMeasurement{
				TemperatureC:      16.0,
				HumidityPercent:   30,
				IlluminanceLux:    200,
				WaterTemperatureC: 15.0,
				WaterLevelPercent: 30,
				WaterVolumeL:      3.3,
				MeasuredAt:        time.Date(2026, 11, 13, 9, 30, 0, 0, time.Local),
			},
		}
	}

	detail := dbSearch(potID)

	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(detail)
}
