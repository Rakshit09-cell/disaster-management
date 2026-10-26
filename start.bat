@echo off
title Disaster Management - Hyper-Local Severe Weather Nowcasting System
color 0B

echo ===============================================================================
echo    DISASTER MANAGEMENT : HYPER-LOCAL SEVERE WEATHER NOWCASTING SYSTEM (2-6 HR)
echo    ConvLSTM + INSAT-3DR + IMD Doppler Radar + Open-Meteo Early Warning Platform
echo ===============================================================================
echo.

:: 1. Check for Node.js
where node >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    color 0C
    echo [ERROR] Node.js is not installed or not in your system PATH.
    echo Please install Node.js (v18+) from https://nodejs.org/ and run start.bat again.
    pause
    exit /b 1
)

for /f "tokens=*" %%i in ('node -v') do set NODE_VER=%%i
echo [OK] Detected Node.js version: %NODE_VER%

:: 2. Check for Python & Launch FastAPI Backend if present
where python >nul 2>nul
if %ERRORLEVEL% EQU 0 (
    if exist "backend\main.py" (
        echo [INFO] Python detected. Preparing FastAPI Nowcasting Backend Service...
        if not exist "backend\.venv" (
            echo [INFO] Creating Python virtual environment in backend\.venv...
            python -m venv backend\.venv
        )
        echo [INFO] Starting FastAPI Server on http://localhost:8000 ...
        start "Disaster Management - FastAPI Backend" cmd /k "cd backend && call .venv\Scripts\activate && pip install -r requirements.txt --quiet && uvicorn main:app --reload --host 0.0.0.0 --port 8000"
    )
) else (
    echo [WARN] Python not found in PATH. Running in standalone React + Live Open-Meteo mode.
)

:: 3. Install Frontend Dependencies if node_modules is missing
if not exist "node_modules" (
    echo.
    echo [INFO] Installing React, Vite, Tailwind, Leaflet, and Recharts dependencies...
    call npm install
    if %ERRORLEVEL% NEQ 0 (
        color 0C
        echo [ERROR] npm install failed. Please check your internet connection.
        pause
        exit /b 1
    )
)

:: 4. Launch Vite Development Server and Open Browser
echo.
echo [SUCCESS] Launching Disaster Management Command Dashboard on http://localhost:5173 ...
echo ===============================================================================
call npm run dev -- --open
pause
