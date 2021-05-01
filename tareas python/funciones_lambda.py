#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sat May  1 07:58:15 2021

@author: sergio
"""
"""
1- Crea una función lambda que dado un número entero multiplique por su 
   anterior y su siguiente. Por ejemplo,
   si proporcionamos n = 3, nos tendrá que devolver 2 · 3 · 4 = 24.
"""
plus_before_after = lambda n: (n-1) * n * (n+1)
plus_before_after(5) 

"""
2- Crea una función lambda que dados dos números devuelva si
el primero es mayor.
"""

first_is_bigger = lambda x,y: x > y 

first_is_bigger(2,4)

"""
3- Dada una lista de palabras, quédate con filter() con las que tengan 
   más vocales que consonantes. Nece-
   sitarás una función que devuelva si una palabra tiene más vocales que
   consonantes.
"""
def more_vowels(w):
    """
    Devuelve si hay más vocales que consonantes en una palabra
    Args:
    w: Palabra en formato string
    Returns:
    Booleano
    """
    consonant = 0
    vowels = 0
    for c in w.lower():
        if c in ["a", "e", "i", "o", "u",]:
            vowels += 1
        else:
            consonants =+ 1
    return vowels > consonants
words = ["castaña", "lea", "asa", "boli", "mando", "aminoacido"]
list(filter(more_vowels, words))

"""
4- Dada una lista de números enteros, quédate con filter() con los que 
   tengan más de 5 divisores. Necesitarás una función que devuelva el número 
   de divisores de un número dado.
"""

def total_divisors(n):
    """
    Calcula el número de divisores de un número entero positivo.
    Args:
    n: Número entero positivo
    Returns:
    divisors: Lista de divisores de n
    """

if type(n) == int and n > 0:
    divisors = []
    for i in range(1, n + 1):
        if n % i == 0: divisors.append(i)
    return len(divisors)
nums = [49, 1024, 666, 147, 2101, 12]
list(filter(lambda n: total_divisors(n) > 5, nums))

"""
5- Dada una lista de palabras, quédate con reduce() con la palabra más larga.
   Necesitarás una función que
   compare dos palabras y devuelva la que tenga mayor longitud.
"""
from functools import  reduce
def longer_word(w1, w2):
    """
    Devuelve la palabra de mayor longitud
    Args:
    w1: Palabra en formato string
    w2: Palabra en formato string
    Returns
    Palabra en formato string
    """
    if len(w1) >= len(w2):
        return w1
    return w2
words = ["castaña", "termodinamico", "asa", "boli", "mando", "aminoacido"]
reduce(longer_word, words)

"""
6- Dada una lista de palabras, calcula el número de vocales de cada una
   con map().
"""
def total_vowels(w):
    """
    Devuelve el total de vocales de una palabra
    Args:
    w: Palabra en formato string
    Returns:
    consonants: Número entero
    """
    vowels = 0
    for c in w:
        if c in ["a", "e", "i", "o", "u"]:
            vowels += 1
    return vowels
words = ["castaña", "termo", "casa", "boligrafo", "mando", "aminoacido"]
list(map(lambda w: total_vowels(w), words))

"""
7- Dada una lista de palabras, quédate con reduce() y map() con la palabra con
   más consonantes. Necesitarás una función que cuente el número de consonantes
   de una palabra y otra que dados dos números, devuelva el mayor.
"""
from functools import reduce
def total_consonants(w):
    """
    Devuelve el total de consonantes de una palabra
    Args:
    w: Palabra en formato string
    Returns:
    consonants: Número entero
    """
    consonants = 0
    for c in w:
        if c not in ["a", "e", "i", "o", "u"]:
            consonants += 1
    return consonants

def bigger_than(a,b):
    """
    Devuelve el máximo entre dos números
    Args:
    a: Número real
    b: Número real
    Returns
    Número real
    """
    if a > b:
        return a
    return b
words = ["castaña", "termo", "casa", "boligrafo", "mando", "aminoacido"]
print(words)
num_consonants = list(map(lambda w: total_consonants(w), words))
print(num_consonants)
reduce(bigger_than, num_consonants)

"""
8- Dada una lista de números enteros, calcula el número anterior con map().
"""
nums = [-10, 5, 7, -3, 16, -30, 2, 33]
list(map(lambda n: n-1, nums))

"""
9- Dada una lista de números reales, ordénalos con sorted() por valor absoluto
   de menor a mayor.
"""
def absolute_value(x):
    """
    Devuelve el valor absoluto de un número real.
    Args:
    x: Número real
    Returns:
    Número real
    """
    if x >= 0:
        return x
    return -x
nums = [-10.5, 5.4, 7.2, -3.3, 16.1, -30, 2.9, 33.7]
sorted(nums, key = absolute_value)

"""
10- Dada una lista de palabras, ordénalos con sorted() por número de 
    consonates de mayor a menor.
"""
def total_consonants(w):
    """
    Devuelve el total de consonantes de una palabra
    Args:
    w: Palabra en formato string
    Returns:
    consonants: numero entero
    """
    consonants = 0
    for c in w :
        if c not in ["a", "e", "i", "o", "u"]:
            consonants += 1
    return consonants
words = ["castaña", "termo", "casa", "boligrafo", "mando", "aminoacido"]
sorted(words, key=total_consonants, reverse=True)























