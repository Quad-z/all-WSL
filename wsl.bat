@echo off
setlocal EnableDelayedExpansion
chcp 65001 >nul

:: Первичная проверка прав администратора (способ 1: net session)
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Запуск с правами администратора...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

cls
echo ================================================================
echo === Скрипт установки WSL и различных Linux-дистрибутивов       ===
echo ================================================================
echo.

:: Дополнительная проверка прав администратора (способ 2: openfiles)
openfiles >nul 2>&1
if %errorlevel% neq 0 (
    echo Требуются права администратора. Запустите скрипт от имени администратора.
    pause
    exit /b 1
)

:: Включение необходимых компонентов:
echo Включение компонентов WSL и Virtual Machine Platform...
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart

echo.
echo Если у вас не установлен обновленный WSL2 Kernel, скачайте его по ссылке:
echo   https://aka.ms/wsl2kernel
echo.

:: Установка WSL2 по умолчанию
wsl --set-default-version 2

echo.
echo Выберите дистрибутив для установки:
echo -------------------------------------------------------------
echo  1.  Ubuntu
echo  2.  Ubuntu-22.04
echo  3.  Ubuntu-20.04
echo  4.  Ubuntu-18.04
echo  5.  Debian
echo  6.  Kali Linux
echo  7.  openSUSE Leap
echo  8.  openSUSE Tumbleweed
echo  9.  SUSE Linux Enterprise Server (SLES)
echo 10.  Oracle Linux
echo 11.  AlmaLinux
echo 12.  Rocky Linux
echo 13.  Fedora Remix for WSL
echo 14.  Alpine
echo 15.  Arch Linux
echo 16.  Pengwin
echo 17.  Pengwin Enterprise
echo 18.  Установить все дистрибутивы
echo 19.  Выход
echo -------------------------------------------------------------
echo.
set /p choice="Введите номер: "

if "%choice%"=="1" (
    echo Установка Ubuntu...
    wsl --install -d Ubuntu
    goto end
) else if "%choice%"=="2" (
    echo Установка Ubuntu-22.04...
    wsl --install -d Ubuntu-22.04
    goto end
) else if "%choice%"=="3" (
    echo Установка Ubuntu-20.04...
    wsl --install -d Ubuntu-20.04
    goto end
) else if "%choice%"=="4" (
    echo Установка Ubuntu-18.04...
    wsl --install -d Ubuntu-18.04
    goto end
) else if "%choice%"=="5" (
    echo Установка Debian...
    wsl --install -d Debian
    goto end
) else if "%choice%"=="6" (
    echo Установка Kali Linux...
    wsl --install -d Kali-linux
    goto end
) else if "%choice%"=="7" (
    echo Установка openSUSE Leap...
    wsl --install -d "openSUSE Leap"
    goto end
) else if "%choice%"=="8" (
    echo Установка openSUSE Tumbleweed...
    wsl --install -d "openSUSE Tumbleweed"
    goto end
) else if "%choice%"=="9" (
    echo Установка SUSE Linux Enterprise Server (SLES)...
    wsl --install -d "SUSE Linux Enterprise Server (SLES)"
    goto end
) else if "%choice%"=="10" (
    echo Установка Oracle Linux...
    wsl --install -d "Oracle Linux"
    goto end
) else if "%choice%"=="11" (
    echo Установка AlmaLinux...
    wsl --install -d AlmaLinux
    goto end
) else if "%choice%"=="12" (
    echo Установка Rocky Linux...
    wsl --install -d "Rocky Linux"
    goto end
) else if "%choice%"=="13" (
    echo Установка Fedora Remix for WSL...
    wsl --install -d "Fedora Remix for WSL"
    goto end
) else if "%choice%"=="14" (
    echo Установка Alpine...
    wsl --install -d Alpine
    goto end
) else if "%choice%"=="15" (
    echo Установка Arch Linux...
    wsl --install -d "Arch Linux"
    goto end
) else if "%choice%"=="16" (
    echo Установка Pengwin...
    wsl --install -d Pengwin
    goto end
) else if "%choice%"=="17" (
    echo Установка Pengwin Enterprise...
    wsl --install -d "Pengwin Enterprise"
    goto end
) else if "%choice%"=="18" (
    echo Установка всех дистрибутивов...
    wsl --install -d Ubuntu
    wsl --install -d Ubuntu-22.04
    wsl --install -d Ubuntu-20.04
    wsl --install -d Ubuntu-18.04
    wsl --install -d Debian
    wsl --install -d Kali-linux
    wsl --install -d "openSUSE Leap"
    wsl --install -d "openSUSE Tumbleweed"
    wsl --install -d "SUSE Linux Enterprise Server (SLES)"
    wsl --install -d "Oracle Linux"
    wsl --install -d AlmaLinux
    wsl --install -d "Rocky Linux"
    wsl --install -d "Fedora Remix for WSL"
    wsl --install -d Alpine
    wsl --install -d "Arch Linux"
    wsl --install -d Pengwin
    wsl --install -d "Pengwin Enterprise"
    goto end
) else (
    echo Выход из программы.
    goto end
)

:end
echo.
echo Операции завершены.
echo Рекомендуется перезагрузить систему для вступления изменений в силу.
pause
