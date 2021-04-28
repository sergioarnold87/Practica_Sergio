#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Tue Apr 27 16:41:35 2021

@author: sergio
"""

# Crear funcion lamba que devuekve un tupla donde en la primera posicion esté 
# número introducido por parametro, en la segunda, su doble, y e la tercera 
# su cuadrado

double_Square = lambda x: (x,2 * x, x ** 2)
double_Square(5)

#Dada una lista numerica , vamos a filtrarla y quedarnos con los numeros
#positivos, el resultado sera mostrado en una lista

nums = [-5, -3, 5, 2, 1, 3, -2, -9, 0.4, -0.01]
list (filter(lambda x: x > 0, nums))

# Con la ayuda de las funciones lambda, apliquemos reduce() para calcular
# el producto de todos los elementos de una lista

from functools import reduce
nums = [1, 2, 3, 4, 5, 6]
reduce(lambda x, y: x * y, nums)

# vamos a obtener el máximo de una lista dada, haciendo uso de reduce() y 
# la función creada bigger_than():
    
def bigger_than(a, b):
  if a > b:
    return a
  return b
bigger_than(14, 7)

nums = [-10, 5, 7, -3, 16, -30, 2, 33]
reduce(bigger_than, nums)   

# Dada una lista de palabras, vamos a quedarnos con la palabra con más "a".

from functools import reduce

def total_a(w):
  """
  Devuelve el total de apariciones de la letra a
  Args:
    w: Palabra en formato string
  Returns:
    a: Número entero
  """
  a = 0
  for c in w.lower():
    if c == "a":
      a += 1
  return a

def more_a(w1, w2):
  """
  Devuelve la palabra con mayor número de a
  Args:
    w1: Palabra en formato string
    w2: Palabra en formato string
  Returns:
    Palabra en formato string
  """
  if total_a(w1) >= total_a(w2):
    return w1
  return w2

words = ["zapato", "amigo", "cosa", "amargada", "césped"]
reduce(lambda w1, w2: more_a(w1,w2), words)

#Vamos a convertir una lista de grados Celsius a grados Fahrenheit.
#  El resultado lo mostraremos como una lista.

def from_C_to_F(celsius):
  """
  Convierte grados celsius en Fahrenheit
  Args:
    celsius: Número real
  Returns:
    fahrenheit: Número real
  """
  fahrenheit = (celsius * 9 / 5) + 32
  return fahrenheit

celsius = [0, 5, 10, 15, 20, 25, 50, 100, 200]
list(map(from_C_to_F, celsius))

"""
Vamos a ordenar una lista de palabras por el número de apariciones de
 la letra indicada por el usuario. El orden será descendente.
"""

def total_letter(w, l):
  """
  Devuelve el total de apariciones de la letra indicada por parámetro en la palabra w
  Args:
    w: Palabra en formato string
    l: Letra en formato string
  Returns:
    letter: Número entero
  """
  letter = 0
  for c in w.lower():
    if c == l.lower():
      letter += 1
  return letter

l = input("Introduce una letra: ")
words = ["tutu", "jugueteria", "violonchelo", "fanfarron", "piano", "murcielago"]
sorted(words, key = lambda w: total_letter(w, l), reverse = True)