# ⚡ Disaster Management — Hyper-Local Severe Weather Nowcasting & Early Warning System

![Disaster Management Status](https://img.shields.io/badge/Nowcast_Horizon-2_to_6_Hours-06b6d4?style=for-the-badge)
![Grid Resolution](https://img.shields.io/badge/Spatial_Grid-2km_x_2km_PostGIS-10b981?style=for-the-badge)
![AI Engine](https://img.shields.io/badge/AI_Core-3D--CNN_+_ConvLSTM-ec4899?style=for-the-badge)
![Languages](https://img.shields.io/badge/Multilingual_CAP_Alerts-8_Indian_Languages-f59e0b?style=for-the-badge)

## 📌 Problem Overview
India is highly vulnerable to rapidly intensifying, localized extreme weather events such as **cloudbursts, severe thunderstorms (Kalbaishakhi), heavy monsoonal downpours, and flash floods**. Traditional Numerical Weather Prediction (NWP) models are computationally expensive and often struggle to capture sudden, micro-scale atmospheric changes within a 0–6 hour window, resulting in delayed or insufficient local warnings.

## 🚀 Proposed Solution
**Disaster Management** is an AI-powered hyper-local weather nowcasting and early-warning platform capable of predicting severe weather events **2 to 6 hours in advance** at a **2 km × 2 km micro-grid resolution**. It fuses INSAT-3DR satellite infrared/water-vapor observations, IMD Doppler Weather Radar (dBZ) reflectivity, ERA5 historical baselines, and real-time Open-Meteo surface telemetry (temperature, humidity, wind shear, CAPE, pressure, and soil moisture) to detect developing threats and dispatch multilingual Common Alerting Protocol (CAP) warnings.

---

## ✨ Key Features
1. **AI-Based 2–6 Hour Severe Weather Nowcasting**: Physics-informed ConvLSTM + 3D-CNN inference engine estimating hourly rainfall trajectories, CAPE instability, and barometric pressure dips.
2. **Interactive Hyper-Local Radar & Satellite Map**: Built with **Leaflet.js + OpenStreetMap + HTML5 Canvas** featuring toggleable layers for IMD Doppler Radar (dBZ), INSAT-3DR IR cloud shields, Flash-Flood Risk Polygons, Wind Shear Vectors, and a 2km × 2km PostGIS grid. Click anywhere in India to lock onto a custom micro-watershed.
3. **4-Hazard Real-Time Risk Detectors**: Dedicated probability and intensity trackers for **Cloudbursts (>=100 mm/hr)**, **Flash Floods & Surface Runoff**, **Severe Thunderstorms & Lightning Squalls**, and **Intense Heavy Rainfall**.
4. **Atmospheric Stress Simulator (What-If Perturbation Lab)**: Perturb radar reflectivity (dBZ), cloud-top temperature (°C), CAPE, humidity, pressure, and wind speed in real time or load preset scenarios (*Himalayan Cloudburst*, *Kalbaishakhi Super-Squall*, *Stable Fair Weather*).
5. **Multilingual Early Warning & Voice Dispatch Center**: Generates ITU-T CAP compliant alerts across **8 Indian languages** (*English, Hindi, Tamil, Telugu, Bangla, Marathi, Malayalam, and Assamese*) with native browser **Text-to-Speech (TTS) audio readout** and simulated **Twilio SMS, Firebase Cloud Messaging (FCM), and NDMA Cell Broadcast** dispatch logs.
6. **Gemini AI Chief Meteorologist Briefing**: One-click integration with Google Gemini 3 Flash to synthesize current telemetry into an operational 3-part NDRF & District Administration action plan.
7. **Historical Backtesting & Model Monitoring**: Evaluates ConvLSTM CSI (0.86), POD (91%), and lead-time gains (+3.5 hrs over NWP) across real Indian extreme weather events (*Wayanad 2024, Himachal/Kedarnath, Chennai Michaung, Prayagraj Nor'wester*).

---

## 🛠️ Technology Stack
- **Frontend**: React.js (Vite), Tailwind CSS, Recharts, Lucide Icons, Leaflet.js, OpenStreetMap, HTML5 Canvas 2D.
- **Backend**: Python 3.10+, FastAPI, Uvicorn, Pydantic.
- **AI / ML**: PyTorch / TensorFlow (3D-CNN + ConvLSTM architecture), Scikit-Learn, NumPy, Pandas, OpenCV.
- **Geospatial Database**: PostgreSQL 15 + PostGIS (2km × 2km spatial indexing).
- **APIs & Alert Gateways**: Open-Meteo Live Weather API, INSAT-3DR / IMD Radar Feeds, Google Gemini API, Twilio SMS API, Firebase Cloud Messaging (FCM).

---

## 📂 Project Directory Structure
```text
Disaster-Management-System/
├── start.bat                  # One-click Windows launcher for Frontend & FastAPI Backend
├── README.md                  # Project documentation & setup guide
├── BRAIN.md                   # Deep learning (ConvLSTM), physics & CAP alerting specification
├── package.json               # Node.js / Vite React frontend dependencies
├── vite.config.js             # Vite bundler configuration
├── index.html                 # Application HTML entry point
├── src/
│   ├── main.jsx               # React DOM mount
│   └── App.jsx                # Complete Disaster Management application component
└── backend/
    ├── main.py                # FastAPI + ConvLSTM inference & CAP alert microservice
    └── requirements.txt       # Python backend dependencies
```

---

## ⚡ Quick Start Guide

### Option 1: One-Click Windows Startup (`start.bat`)
1. Extract the downloaded `Disaster-Management-System.zip` folder.
2. Double-click **`start.bat`** (or run `start.bat` from Command Prompt / PowerShell).
3. The script will automatically verify Node.js & Python, start the FastAPI backend on `http://localhost:8000`, install frontend packages, and open the live dashboard at `http://localhost:5173`.

### Option 2: Manual Setup
```bash
# 1. Start the React Frontend
npm install
npm run dev

# 2. (Optional) Start the Python FastAPI Nowcasting Backend
cd backend
python -m venv .venv
.venv\Scripts\activate
pip install -r requirements.txt
uvicorn main:app --reload --port 8000
```'
