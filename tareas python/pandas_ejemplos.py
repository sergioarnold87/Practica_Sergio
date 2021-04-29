#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Thu Apr 29 07:19:00 2021

@author: sergio
"""

"""
Vamos a crear un dataframe de 10 filas y 5 columnas.

La primera columna será word y contendrá 10 palabras.
La segunda columna será length y contendrá la longitud de cada palabra.
La tercera columna será start y contendrá la primera letra de cada palabra.
La cuarta columna será end y contendrá la última letra de cada palabra.
La quinta columna será isPalindrome y contedrá valores booleanos indicando si 
cada palabra es o no un palíndromo.
A continuación, vamos a transformar la columna word en los nombres de las
 filas utilizando el método .set_index().
Finalmente, calcularemos las dimensiones de nuestro dataframe.
"""

def is_palindrome(word):
  """
  Devuelve si la palabra word es palíndroma.
  Args:
    word: Palabra en formato string
  Returns:
    isPalindrome: Booleano
  """
  
  word = word.lower()
  l = []
  isPalindrome = True
  for c in word:
      l.append(c)
  n = len(l)
  for i in range(int(n/2)):
      if l[i] != l[n - (i + 1)]:
          isPalindrome = False
  return isPalindrome


words = ["sol", "ala", "cama", "duro", "bueno", "kayak", "marea", "rotor", "misterio", "acurruca"]
data = {"word": words,
        "length": map(len, words),
        "start": map(lambda w: w[0], words),
        "end": map(lambda w: w[-1], words),
        "isPalindrome": map(is_palindrome, words)}

import pandas as pd
words = pd.DataFrame(data)

words.head()

words = words.set_index("word")

words.index.names = [None] 

words.shape 

##############################################################################










