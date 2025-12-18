@echo off

REM Caminho para salvar o instalador
set INSTALLER_PATH=C:\Users\canal\Downloads\python-3.14.0-amd64.exe

REM URL do instalador
set PYTHON_URL=https://www.python.org/ftp/python/3.14.0/python-3.14.0-amd64.exe

REM Baixando o instalador pelo PowerShell
powershell -Command "Invoke-WebRequest -Uri %PYTHON_URL% -OutFile %INSTALLER_PATH%"

REM Verifica se o arquivo foi baixado
if exist "%INSTALLER_PATH%" (
    echo Instalador baixado!
) else (
    echo Falha ao baixar o instalador.
)

REM Caminho para o instalador (mesmo de la de cimaa)
set PYTHON_INSTALLER=C:\Users\canal\Downloads\python-3.14.0-amd64.exe

REM Instalação silenciosa
%PYTHON_INSTALLER% /quiet InstallAllUsers=1 PrependPath=1 Include_pip=1

set PATH=C:\Users\canal\AppData\Local\Python\pythoncore-3.14-64\;C:\Users\canal\AppData\Local\Python\pythoncore-3.14-64\Scripts\;%PATH%

REM Verifica se o python foi instalado
python --version
pip --version

cd "C:\"
if not exist "Scripts" mkdir "Scripts"
cd ".\Scripts"

xcopy "C:\Users\canal\Downloads\script.py" "C:\Scripts\" /Y

schtasks /create ^
 /tn "FreeGame Redeem" ^
 /tr "python.exe C:\Scripts\script.py" ^
 /sc daily ^
 /st 14:00 ^
 /f

if not exist "C:\Users\canal\AppData\Local\Python\pythoncore-3.14-64\Scripts\pip.exe" (
    python.exe "C:\Users\canal\Downloads\get-pip.py" >nul 2>&1
)

setx PATH "%PATH%;C:\Users\canal\AppData\Local\Python\pythoncore-3.14-64\;C:\Users\canal\AppData\Local\Python\pythoncore-3.14-64\Scripts\"

echo Script finalizado, ja pode fechar esta janela
