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