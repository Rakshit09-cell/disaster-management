# 🛠️ Technology Stack & Architecture Specification (technologies.md)

Disaster Management is built on a modern, high-performance tech stack designed for sub-second mesoscale nowcasting and low-latency emergency dispatch.

---

## 1. Frontend Architecture
- **Framework**: React.js 18 (Vite Bundler for rapid HMR and optimized production builds).
- **Styling**: Tailwind CSS for responsive, accessible utility-first UI design.
- **Visualizations**: Recharts (for real-time rainfall nowcast area charts and CAPE/pressure trend lines).
- **Icons**: Lucide React (modern vector icons for meteorological telemetry).
- **Mapping & Geospatial Canvas**: Leaflet.js + OpenStreetMap (CartoDB Dark Matter tiles) overlaid with an HTML5 Canvas 2D render loop for Doppler Radar (dBZ) reflectivity cores and INSAT-3DR IR cloud shields.

---

## 2. Backend & API Service
- **Language & Framework**: Python 3.10+ with FastAPI and Uvicorn ASGI server.
- **Validation**: Pydantic v2 for strict type safety on telemetry payloads and CAP dispatch requests.
- **Async Concurrency**: Native Python `asyncio` for non-blocking telemetry ingestion and multi-channel alert dispatching.

---

## 3. AI / Machine Learning Engine
- **Core Architecture**: Spatio-Temporal 3D-Convolutional Neural Networks (3D-CNN) coupled with Convolutional LSTMs (ConvLSTM).
- **Training Frameworks**: PyTorch & TensorFlow.
- **Preprocessing**: OpenCV & NumPy for satellite image tensor transformations; Pandas for time-series feature extraction.

---

## 4. Geospatial Database
- **DBMS**: PostgreSQL 15 with **PostGIS** spatial extension.
- **Indexing**: R-Tree spatial indexing for 2 km × 2 km micro-grid polygon lookups and watershed vulnerability queries.

---

## 5. External APIs & Gateways
- **Open-Meteo API**: Live weather forecasts, hourly CAPE, soil moisture, and surface pressure telemetry.
- **Satellite & Radar**: Ingestion pipelines for INSAT-3DR thermal infrared (10.8 µm) and IMD Doppler Weather Radar max-Z reflectivity feeds.
- **Alert Gateways**: Twilio SMS API, Firebase Cloud Messaging (FCM) push notifications, and simulated NDMA Common Alerting Protocol (CAP) cell broadcast nodes.