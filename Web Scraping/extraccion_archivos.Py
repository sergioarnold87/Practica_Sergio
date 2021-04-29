#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Thu Apr 29 08:45:35 2021

@author: sergio
"""

"""
OBJETIVO: 
    - Extraer archivos utilizando Web Scraping
"""
import requests
from bs4 import BeautifulSoup

url_semilla = "https://file-examples.com/index.php/sample-documents-download/sample-xls-download/"

resp = requests.get(url_semilla)
soup = BeautifulSoup(resp.text)

urls = []

descargas = soup.find_all('a', class_="download-button")
for descarga in descargas:
    urls.append(descarga["href"])

i = 0
for url in urls: # Por cada url de los archivos que quiero descargar
    r = requests.get(url, allow_redirects=True)
    file_name = '../Practica_Sergio/Web Scraping/excel-file-' + str(i) + '.xls'
    output = open(file_name, 'wb')
    output.write(r.content) # Escribir el archivo en mi PC
    output.close()
    i += 1

