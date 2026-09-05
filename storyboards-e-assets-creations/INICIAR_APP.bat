@echo off
chcp 65001 >nul
title Storyboard Animation Engine v2.0

echo ========================================================
echo   🎬 STORYBOARD ANIMATION ENGINE v2.0 PRO
echo   Iniciando ambiente local de criacao de storyboards...
echo ========================================================
echo.

:: Navega para a pasta do aplicativo
cd /d "%~dp0"
if exist "storyboards-e-assets-creations" (
    cd "storyboards-e-assets-creations"
)

:: Verifica instalacao do Node.js
where node >nul 2>nul
if %errorlevel% neq 0 (
    echo [ERRO] Node.js nao foi encontrado no sistema!
    echo Instale o Node.js LTS em https://nodejs.org antes de continuar.
    echo.
    pause
    exit /b 1
)

:: Verifica se as dependencias estao instaladas
if not exist "node_modules\" (
    echo [INFO] Instalando dependencias do projeto pela primeira vez...
    call npm install
    if %errorlevel% neq 0 (
        echo [ERRO] Falha ao instalar dependencias npm.
        pause
        exit /b 1
    )
)

echo [OK] Servidor iniciando em http://localhost:3000
echo [INFO] Abrindo navegador automaticamente em 2 segundos...
echo.

:: Abre o navegador padrao apos 2 segundos
start "" cmd /c "timeout /t 2 /nobreak >nul & start http://localhost:3000"

:: Executa o servidor de desenvolvimento Vite
call npm run dev

pause
