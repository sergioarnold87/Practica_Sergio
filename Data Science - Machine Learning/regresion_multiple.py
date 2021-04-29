#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Mon Mar 22 10:53:14 2021

@author: sergio
"""

# Cómo importar las librerías
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

# Importar el data set
dataset = pd.read_csv('/home/sergio/Documentos/GitHub/machinelearning-az/datasets/Part 2 - Regression/Section 5 - Multiple Linear Regression/50_Startups.csv')
X = dataset.iloc[:, :-1].values
y = dataset.iloc[:, 4].values


# Codificar datos categóricos
from sklearn.preprocessing import LabelEncoder, OneHotEncoder
from sklearn.compose import make_column_transformer

labelencoder_X = LabelEncoder()
X[:, 3] = labelencoder_X.fit_transform(X[:, 3])
onehotencoder = make_column_transformer((OneHotEncoder(), [3]), remainder = "passthrough")
X = onehotencoder.fit_transform(X)

# EVITAR LA TRAMPA DE LAS VARIABLES FICTICIAS 
X = X[:, 1:]

## DIVIDIR EL CONJUNTO DE ENTRENAMIENTO Y CONJUNTO DE TESTING

from sklearn.model_selection import train_test_split
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size= 0.2, random_state=0)

## AJUSTAR EL MODELO DE REGRESION LINEAL MULTIPLE CON EL CONJUNTO DE ENTRENAMIENTO 

from sklearn.linear_model import LinearRegression
regression = LinearRegression()
regression.fit(X_train, y_train)

# PREDICCION DE LOS RESULTADOS EN EL CONJUNTO DE TESTING

y_pred = regression.predict(X_test)

##  construir el modelo optimo de RLM utilizando la eliminacion hacia atras

import statsmodels.api as sm

X = np.append(arr = np.ones((50,1)).astype(int), values = X, axis = 1)

#Se ha añadido el modificador .tolist() al X_opt para adaptarse a Python 3.7

X_opt = X[:,[0,1,2,3,4,5]]
regression_OLS = sm.OLS(endog = y, exog = X_opt.tolist()).fit()
regression_OLS.summary()

X_opt = X[:,[0,1,3,4,5]]
regression_OLS = sm.OLS(endog = y, exog = X_opt.tolist()).fit()
regression_OLS.summary()


X_opt = X[:,[0,3,4,5]]
regression_OLS = sm.OLS(endog = y, exog = X_opt.tolist()).fit()
regression_OLS.summary()


X_opt = X[:,[0,3,5]]
regression_OLS = sm.OLS(endog = y, exog = X_opt.tolist()).fit()
regression_OLS.summary()


X_opt = X[:,[0,3]]
regression_OLS = sm.OLS(endog = y, exog = X_opt.tolist()).fit()
regression_OLS.summary()



