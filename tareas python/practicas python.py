#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Mon Mar 15 15:57:27 2021

@author: sergio
"""

n = int(input("Introduce el tamaño de la lista"))
l = []

for i in range(n):
    l.append(int(input()))

print("tu lista es: ", l)


names = ["Mario", "Cristian", "Juan", "Sergio"]
print(names)

for i in range(len(names)):
    print(names[i])

for name in names:
    print(name)
    

numbers = [0,1,1,2,2,2,3,3,3,3,3]

counted = []
for element in numbers:
    if element not in counted:
        counted.append(element)
        print("El elemento {} aparece {} veces".format(element, numbers.count(element)))
        
        
odd = list(range(1,30,2))

for i in range(len(odd)):
    print("El valor {} ocupa el indice {} ".format(odd[i], i))
    
    ################# SUMAS #################
    
A = [[1, 0, -3], [2, 0, 1], [-1, -1, 0]]
B = [[-1, -2, 0], [-2, 3, 0], [0, 0, -3]]

m = len(A)
n = len(B)
if len(A) == len(B) and len(A[0]) == len(B[0]):
    C = []
     
    for i in range(m):
       C.append([])
       for j in range(n):
         C[i].append(A[i][j] + B[i][j])
    print(C)

else:
    print("No se puede sumar, las dimensiones no coinciden.")
    
    ################# MULTIPLICACIÓN #################

A = [[1, 0, -3, 2], [2, 0, 1, 1], [-1, 0, -1, 0]]
B = [[-1, -2, 0], [-2, 3, 0], [0, 0, -3], [1, 1, -1]]

m,n,p = len(A), len(B), len(B[0])

C = []

for i in range(m):
    C.append([])
    for j in range(p):
        elemento = 0
        for k in range(n):
            elemento = elemento + A[i][k] * B[k][j]
        C[i].append(elemento)
        
for row in C:
    print (row)
        
############## crear manualmente una matriz 4x4 y guardar en una lista

A = []
for i in range(4):
    A.append([])
    for j in range(4):
        A[i].append(float(input("Introduce el elemento ({},{}): ".format(i, j))))
for i in range(4):
    for j in range(4):
        print(A[i][j], end = "  " if A[i][j] >= 0 else " ")
    print("")
    

#### SUMAR MATRICES PROPORCIONADAS POR EL USUARIO

n = int(input("Número de filas de las matrices: "))
m = int(input("Número de columnas de las matrices: "))

A = []

print("\n=== Matriz A ===")
for i in range(n):
    A.append([])
    for j in range(m):
        A[i].append((float(input("Introduce el elemento ({},{}) ".format(i,j)))))


B = []

print("\n=== Matriz B ===")
for i in range(n):
    B.append([])
    for j in range(m):
        B[i].append((float(input("Introduce el elemento ({},{}) ".format(i,j)))))
        
C = []
for i in range(n):
    C.append([])
    for j in range(m):
        C[i].append(A[i][j] + B[i][j])
        
print("\n === Matriz A + B ===")

for i in range(n):
    for j in range(m):
        print (C[i][j], end = "  " if C[i][j] >= 0 else " ")
    print("")


#### MULTIPLICAR MATRICES ####

n = int(input("Número de filas de la matriz A: "))
m = int(input("Número de columnas de la matriz A: "))
p = int(input("Número de columnas de la matriz B: "))

A = []
print("\n=== Matriz A ===")
for i in range(n):
    A.append([])
    for j in range(m):
        A[i].append(float(input("Introcue el elemento ({},{}) ".format(i,j))))
        
B = []
print("\n=== Matriz A ===")
for i in range(n):
    B.append([])
    for j in range(m):
        B[i].append(float(input("Introcue el elemento ({},{}) ".format(i,j))))

C = []

for i in range(n):
    C.append([])
    for j in range(p):
        elemento = 0
        for k in range(m):
            elemento += A[i][k] * B[k][j]
        C[i].append(elemento)
        

#### sumar dos matrices

import numpy as np
n = int(input("Numero de Filas: "))
m = int(input("Numero de Columnas: "))

A = np.empty((n,m))
print("\n === Matriz A ===")
for i in range(n):
    for j in range(m):
        A[i,j] = float(input("Introduce el elemento ({},{}) ".format(i,j)))
        
B = np.empty((n,m))
print("\n === Matriz B ===")
for i in range(n):
    for j in range(m):
        B[i,j] = float(input("Introduce el elemento ({},{}) ".format(i,j)))

print("\n ===Matriz A + B ===")
print(A+B)

### Multiplicar Matrices

import numpy as np
n = int(input("Número de filas de A: "))
m = int(input("Numero de columnas de A: "))
p = int(input("Numero de columnas de B: "))

A = np.empty((n,m))
print("\n === Matriz A ===")
for i in range(n):
    for j in range(m):
        A[i,j]= float(input("Introduce el elemento ({},{}) ".format(i,j)))
        

B = np.empty((m,p))
print("\n === Matriz B ===")
for i in range(m):
    for j in range(p):
        B[i,j]= float(input("Introduce el elemento ({},{}) ".format(i,j)))
print("\n === Matriz A . B ===")
print(A.dot(B))
        









        
        
        