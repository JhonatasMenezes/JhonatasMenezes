#Mini-project for to see the wheater from the region you live.
#First, import this libs

#for the window
import tkinter as tk
#for the wheater
import requests as rq
from bs4 import BeautifulSoup

#Search -> 'Wheater in [your region]' -> search on google
search = 'Weather in São Bernardo do Campo'
url = f'https://www.google.com/search?&q={search}'

#climate search process 
r = rq.get(url)
#get the wheater for the html of page
s = BeautifulSoup(r.text,'html.parser')
update = s.find('div',class_='BNeawe').text

#make a window for show it
class MinhaGUI:
    def __init__(self):
        self.main_window = tk.Tk()
        self.main_window.minsize(60,80)
        self.main_window.title('Wheater Today!')
        self.label1 = tk.Label(self.main_window,text= '   Olá Jhonatas, essa é previsão do tempo hoje!   ')
        self.label2 = tk.Label(self.main_window,text= update)
        self.label1.pack()
        self.label2.pack()
        tk.mainloop()
        
minha_gui = MinhaGUI()
