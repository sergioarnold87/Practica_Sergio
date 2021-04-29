#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Mon Mar 22 09:29:29 2021

@author: sergio
"""

import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

## IMPORTAR EL DATASET

dataset = pd.read_csv("/home/sergio/Documentos/GitHub/machinelearning-az/datasets/Part 2 - Regression/Section 4 - Simple Linear Regression/Salary_Data.csv")

X = dataset.iloc[:, :-1].values
y = dataset.iloc[:, 1].values

## DIVIDIR EL DATASET EN CONJUNTO DE ENTRENAMIENTO Y CONJUNTO DE TESTING 
from sklearn.model_selection import train_test_split

X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=1/3, random_state=0)
 
## CREAR MODELO DE REGRESION LINEAL SIMPLE CON EL CONJUNTO DE ENTRENAMIENTO

from sklearn.linear_model import  LinearRegression
regression = LinearRegression()
regression.fit(X_train, y_train)

## PREDECIR EL CONJUNTO DE TEST

y_pred = regression.predict(X_test)

## VISUALIZAR LOS RESULTADOS DE ENTRENAMIENTO

plt.scatter(X_train, y_train, color = "red")
plt.plot(X_train, regression.predict(X_train), color = "blue")
plt.title("Sueldo vs Años de Experiencia (Conjunto de Entrenamiento)")
plt.xlabel("Años de Experiencia")
plt.ylabel("Sueldo (en $)")
plt.show()

## VISUALIZAR LOS RESULTADOS DE TEST

plt.scatter(X_test, y_test, color = "red")
plt.plot(X_train, regression.predict(X_train), color = "blue")
plt.title("Sueldo Vs. Años de Experiencia (Conjunto de Testing)")
plt.xlabel("Años de Experiencia")
plt.ylabel("Sueldo (en $)")
plt.show()











