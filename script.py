from datetime import datetime
from datetime import date
import pyautogui
import subprocess
import time
from plyer import notification
import sys

subprocess.run(['taskkill', '/f', '/im', 'EpicGamesLauncher.exe'])
time.sleep(5)

hoje = datetime.today()
dia = hoje.day
print(hoje)
sucefull = None

if hoje.date() == date(2026, 1, 2):
    subprocess.run(r".\finisher.bat", shell=True)

subprocess.Popen(r"C:\Program Files\Epic Games\Launcher\Portal\Binaries\Win64\EpicGamesLauncher.exe")

pyautogui.moveTo(379, 571)
time.sleep(10)
pyautogui.click()
time.sleep(5)     
pyautogui.click()
pyautogui.scroll(-2500)
time.sleep(5) 
pyautogui.moveTo(931, 540)
pyautogui.click()
time.sleep(8) 
pyautogui.moveTo(1534, 763)
pyautogui.click()
time.sleep(8) 
pyautogui.moveTo(1434, 898)
pyautogui.click()
time.sleep(10) 

try:
    posicao = pyautogui.locateOnScreen("image.png")
except pyautogui.ImageNotFoundException:
    posicao = None 

status = "Sucesso" if posicao else "Falha"

with open("log.txt", "a") as arquivo:
    if posicao:
        sucefull = True
        arquivo.write(f"Parabéns! Seu jogo grátis foi resgatado com sucesso!\nDia: {hoje.strftime('%d/%m/%Y')} - Horário: {hoje.strftime('%H:%M:%S')} - {status}\n")
        notification.notify(
            title="Parabéns!",
            message="Seu jogo grátis foi resgatado com sucesso!",
            app_name="script.py",
            timeout=5
        )
    else:
        sucefull = False
        arquivo.write(f"Falha! Seu jogo grátis não pôde ser resgatado.\nDia: {hoje.strftime('%d/%m/%Y')} - Horário: {hoje.strftime('%H:%M:%S')} - {status}\n")
        notification.notify(
            title="Erro!",
            message="Seu jogo grátis não pôde ser resgatado.\nEntre na Epic Games Store até as 12:59 para tentar novamente",
            app_name="script.py",
            timeout=5
        )

time.sleep(7)
subprocess.run(['taskkill', '/f', '/im', 'EpicGamesLauncher.exe'])
sys.exit()

