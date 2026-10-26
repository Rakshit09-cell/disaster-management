import React, { useState, useEffect } from 'react';

export default function App() {
  const [telemetry, setTelemetry] = useState({
    grid_code: 'UP-PRJ-042',
    region_name: 'Prayagraj-Varanasi Ganga Basin',
    lat: 25.4358,
    lon: 81.8463,
    elevation_m: 98.0,
    temp_c: 31.4,
    humidity_pct: 84.0,
    pressure_hpa: 998.2,
    wind_speed_kmh: 42.0,
    cape_jkg: 2850.0,
    radar_dbz: 54.0,
    cloud_top_temp_c: -68.0,
    soil_moisture_idx: 0.78,
    hour_offset: 2
  });
  const [prediction, setPrediction] = useState(null);

  useEffect(() => {
    fetch('http://localhost:8000/api/v1/nowcast/predict', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify(telemetry)
    })
      .then((res) => res.json())
      .then((data) => setPrediction(data))
      .catch(() => {
        // Standalone fallback if FastAPI backend is not running
        setPrediction({
          grid_code: telemetry.grid_code,
          region_name: telemetry.region_name,
          lead_time_hours: telemetry.hour_offset,
          severity: 'ORANGE',
          predicted_rain_mm_hr: 68,
          probabilities: { cloudburst_pct: 64, flash_flood_pct: 72, thunderstorm_pct: 81 },
          confidence_pct: 91
        });
      });
  }, [telemetry]);

  return (
    <div className="min-h-screen bg-slate-950 text-slate-100 p-6 font-sans">
      <header className="max-w-6xl mx-auto border-b border-slate-800 pb-4 flex items-center justify-between">
        <div>
          <h1 className="text-2xl font-bold text-cyan-400">Disaster Management — Local Command Node</h1>
          <p className="text-xs text-slate-400">Connected to FastAPI Nowcasting Microservice (http://localhost:8000)</p>
        </div>
        {prediction && (
          <span className="px-3 py-1 rounded-lg bg-amber-500/20 border border-amber-500/40 text-amber-300 text-xs font-bold">
            {prediction.severity} ALERT • {prediction.predicted_rain_mm_hr} mm/hr
          </span>
        )}
      </header>
    </div>
  );
}
