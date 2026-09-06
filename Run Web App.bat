@echo off
setlocal
cd /d "%~dp0"

echo Starting Shopify Product Converter...

if not exist ".venv\Scripts\python.exe" (
    echo Creating Python environment...
    python -m venv .venv
    if errorlevel 1 (
        py -m venv .venv
    )
)

echo Installing required packages...
".venv\Scripts\python.exe" -m pip install -r requirements.txt
if errorlevel 1 (
    echo.
    echo Could not install required packages. Please check your internet connection.
    pause
    exit /b 1
)

echo.
echo Opening the app in your browser...
".venv\Scripts\python.exe" src\web_main.py

pause
