@echo off
set USER_HOME=%USERPROFILE%
set PYTHON_EXE=%USER_HOME%\AppData\Local\Python\pythoncore-3.14-64\python.exe

if not exist "C:\Scripts" mkdir "C:\Scripts"

copy "%USER_HOME%\Downloads\script.py" "C:\Scripts\script.py" /Y

schtasks /create ^
 /tn "FreeGame Redeem" ^
 /tr "\"%PYTHON_EXE%\" C:\Scripts\script.py" ^
 /sc daily ^
 /st 14:00 ^
 /f

if not exist "%USER_HOME%\AppData\Local\Python\pythoncore-3.14-64\Scripts\pip.exe" (
    "%PYTHON_EXE%" "%USER_HOME%\Downloads\get-pip.py" >nul 2>&1
)

setx PATH "%PATH%;%USER_HOME%\AppData\Local\Python\pythoncore-3.14-64\;%USER_HOME%\AppData\Local\Python\pythoncore-3.14-64\Scripts\"

%PYTHON_EXE% -m pip install pyautogui plyer
%PYTHON_EXE% -m pip install --upgrade pillow

echo Script finalizado, ja pode fechar esta janela
echo Pressione qualquer tecla para fechar...
pause > nul