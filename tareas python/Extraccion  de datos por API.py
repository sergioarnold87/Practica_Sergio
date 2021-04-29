"""
OBJETIVO:
    - Extraer nombre, reviews y rating de los cursos de Python.
    - Aprender a extraer datos de APIs.
    - Aprender a investigar y decifrar la forma en que una pagina web que carga sus datos por API.
    - Aprender a hacer requerimientos a un API del cual no tenemos documentacion.
    - Aprender a utilizar la consola de NETWORKS de Google Chrome.
    - Aprender a procesar datos en formato JSON.
CREADO POR: SERGIO
03 ABRIL 2021
"""
import requests

headers = {
# El encabezado de referer es importante. Sin esto, este API en especifico me respondera 403
"referer": "https://www.udemy.com/courses/search/?src=ukw&q=python",
"user-agent": "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/71.0.3578.80 Chrome/71.0.3578.80 Safari/537.36",

}
