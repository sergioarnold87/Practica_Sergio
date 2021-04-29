#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sun Apr  4 12:39:33 2021

@author: sergio
"""

"""
Haz que un usuario introduzca un número real y evalúa si dicho número es positivo, negativo o cero. Devuelve
por pantalla el resultado en cada caso.
"""
print("Por Favor, introduzca número real:  ")
number = float(input())

if (number > 0):
    print("El número introducido es positivo")
elif (number == 0):
    print ("El número introducido es cero")
else:
    print ("El número introducido es negativo")
    
"""
Haz que un usuario introduzca su nombre y evalúa con operadores if y else si dicho nombre tiene una
longitud mayor a 10 caracteres o no. Devuelve por pantalla el resultado en cada caso.
"""

print("Introducir nombre: ")
name = input()
if (len(name) > 10):
    print("Su nombre tiene mas de 10 caracteres")
else:
    print("Su nombre tiene una longitud de 10 o menos caracteres")

"Realiza el ejercicio anterior con el uso del operador ternario."

print("Por favor, introduzca su nombre: ")
name = input()
messageTrue = "Su nombre tiene una longitud mayor a 10 caracteres"
messageFalse = "Su nombre tiene una longitud de 10 o menos caracteres"
print(messageTrue) if len(name) > 10 else print(messageFalse)

"""
Haz que un usuario introduzca dos números enteros positivos. Comprueba si el 
primer número introducido
por el usuario es mayor o igual que el segundo número introducido por el usuario. 
Devuelve por pantalla el
resultado en cada caso.
PISTA: Asegúrate de hacer uso de la función int() donde pertoque.
"""

print("Por favor, introduzca dos números enteros positivos.")
print("Primer número: ")
firstNumber = int(input())
print("Segundo número: ")
secondNumber = int(input())
if firstNumber >= secondNumber:
    print("{} es mayor o igual que {}".format(firstNumber, secondNumber))
else:
    print("{} es mayor que {}".format(secondNumber, firstNumber))
    
"""
Haz que un usuario introduzca dos números enteros positivos. Suponiendo que 
el primer número introducido
por el usuario es mayor o igual al segundo número introducido por el usuario, 
comprueba que la división del
primer número entre el segundo número es entera.
En caso de la división ser entera, devuelve el cociente por pantalla e indica
 que la división en efecto es entera.
En caso de la división no ser entera, devuelve el cociente y el resto por pantalla
 e indica que la división entre
los dos números no es entera.
"""
print("Introducir dos numeros enteros positivos")
print("El primer número debe ser mayor o igual al segundo")
FirstNumber = int(input())
print("Segundo numero: ")
SecondNumber = int(input())

if FirstNumber % SecondNumber == 0:
    print("La division de {} entre {} es entera y el cociente es {}".
          format(FirstNumber, SecondNumber, FirstNumber // SecondNumber))
else:
    print("La división de {} entre {} no es entera. El cociente es {} y el resto,{}"
          .format()


    