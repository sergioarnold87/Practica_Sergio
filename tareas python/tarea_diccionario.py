#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Wed Mar 24 10:31:11 2021

@author: sergio
"""

## Cree un programa que pida un numero entero positivo por teclado y cree un diccionario
## cuyas claves sean desde el numero 1 hasta el numero indicado, Los valores de cada clave serán 
## las propias claves elevadas al cubo 
    
    n = int(input("Introduce un numero entero positivo"))
    
    d = {}
    for i in range(1 , n+1):
         d[i] = i**3
    print(d)
      
## Escribe un programa que pregunte al usuario su nombre, edad y telefono y lo guarde en un diccionario
## Después, debe mostrar por pantalla el mensae '{nombre} tiene {edad} años y su número de telefono 
## es {telefono}.

    user = {}
    
    user["Name"] = str(input("Introduce tu nombre "))
    user["Age"] = int(input("Introduce tu edad "))
    user["Phone"] = int(input("Introduce tu numero de telefono "))
    
    print("\n {} tiene {} años, y su telefono es {}".format(user["Name"], user["Age"], user["Phone"]))

## Escribe un programa que cree un diccionario simulando una cesta de compra. El programa debe preguntar
## el artículo y su precio por unidad. El artículo será la clave y el valor el precio, hasta que el usuario
## decida terminar. Después se debe mostrar por pantalla la lista de la compra y el coste total, con
## el siguiente formato.

##    _____________________________
#      Articulo 1      Precio
#      Articulo 2      Precio
#      Articulo 3      Precio
#        ...            ...
#        Total        Precio Total
      _____________________________ 
      
    shopping_list = {}
    key = input("Indica el articulo: ")
    
    while key != "":
        shopping_list[key] = float(input("Indica el precio: "))
        key = input("Indica el articulo: ")
        
    print("")
    for key, val in shopping_list.items():
        print("|" + " " * (20 - 2 - len(key)) + key + "   |   " + str(val) +
              " " * (9 - len(str(val))) + " | ")

## Crea un programa que lea números enteros hasta que introduzca el 0 y devuelva un diccionario
## con la cantidad de números positivos y negativos introducidos.
    
    n = int(input("Introduce un número entero: "))
    
    pos = 0
    total = 0
    
    while n != 0:
        if n > 0:
            pos += 1
            total += 1
            n = int(input("Introduce un número entero: "))
        
    nums = {"positive": pos, "negative": total - pos}
    print(nums)
    
## Crea un programa que lea numeros enteros hasta que introduzca el 0 y devuelva un diccionario
## con la cantidad de números pares e impares

n = int(input("Introduce un número entero: "))
even = 0
total = 0

while n != 0:
    if n % 2 == 0:
        even += 1
    total += 1
    n = int(input("Introduce un número entero: "))
    
nums = {"even": even, "odd":  total - even }
print(nums)

##      Crea un programa que permita al usuario introducir los nombres de los alumnos de una clase y las 
#  notas que han obtenido, cada alumno puede tener distintas cantidades de notas. Guarda a informacion 
#  en un diccionario cuyas claves serán los nombres de los alumnos y los valores serán listas con las 
#  notas de cada alumno.
#       El programa va a pedir el número de alumnos que vamos a introducir, pedirá su nombre e irá pidiendo
#  sus notas hasta que introduzcamos un número negativo. Al final el programa nos mostrará la lista de
#  alumnos PISTA: Vas a necesitar la función sum().

students = {}
name = input("Nombre del estudiante: ")

while name != "":
    students[name] = []
    grade
  
    
    
    



























      
        


