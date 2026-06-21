@echo off
setlocal
cd /d "%~dp0"
set "SITE_DIR=%~dp0"
set "SITE_DIR=%SITE_DIR:~0,-1%"

py -3 --version >nul 2>nul
if not errorlevel 1 (
  start "Portfolio Maira - server locale" /min py -3 -m http.server 4173 --bind 127.0.0.1 --directory "%SITE_DIR%"
  goto open_browser
)

set "CODEX_PYTHON=%USERPROFILE%\.cache\codex-runtimes\codex-primary-runtime\dependencies\python\python.exe"
if exist "%CODEX_PYTHON%" (
  start "Portfolio Maira - server locale" /min "%CODEX_PYTHON%" -m http.server 4173 --bind 127.0.0.1 --directory "%SITE_DIR%"
  goto open_browser
)

echo Python 3 non e' stato trovato sul PC.
echo Installa Python 3 oppure chiedi di configurare nuovamente il launcher.
pause
exit /b 1

:open_browser
timeout /t 2 /nobreak >nul
start "" "http://127.0.0.1:4173/?fixed=1"

echo Portfolio aperto nel browser.
echo Puoi chiudere questa finestra.
timeout /t 4 /nobreak >nul
