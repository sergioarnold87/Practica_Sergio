# -*- coding: utf-8 -*-
"""
Spyder Editor

This is a temporary script file.
"""

## Predecir los precios de los diamantes


s = input("Introduce una frase: ")

letters = set()

for c in s.lower():
    if c != " ":
        letters.add(c)
        
print(letters)

word1 = input("Palabra 1: ")
word2 = input("Palabra 2: ")

letters1 = set()
letters2 = set()

for l in word1.lower():
    letters1.add(l)
for l in word2.lower():
    letters2.add(l)
    
common = letters1 & letters2
print(common)

## Vamos a guardar en un conjunto los numeros primos comprendidos entre el 3
# y el numero n que nos inidque el usuario mediante la criba de eratóstenes

n = int(input("Introduce un número entero mayor que 2: "))
primes = set(range(2, n+1))
numbers = list(range(2,n+1))
multiples = [True for x in range(len(numbers))]

for i in range(len(numbers)):
    if multiples[1] == False:
        continue
    for j in range(i + 1, len(numbers)):
        if numbers[j] % numbers[i] == 0:
            multiples[j] = False
            primes.discard(numbers[j])
print(primes)

## devuelce el valor maximo de un conjunto 

myset = {20,5,4,8,70,-8}
max = -999999

for e in myset:
    if e > max:
        max = e
print("El máximo de {} es {}".format(myset,max))


 