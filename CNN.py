#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Wed Mar 10 16:02:49 2021

@author: sergio
"""

# PArte 1 - Construir el modelo CNN

## Importar librerias

from keras.models import Sequential
from keras.layers import Conv2D
from keras.layers import MaxPooling2D
from keras.layers import Flatten
from keras.layers import Dense

### PARTE 1 ###
# Iniciar la CNN
classifier = Sequential()

#Convolución

classifier.add(Conv2D(filters = 32, kernel_size = (3,3),
                      input_shape = (64,64,3), activation="relu"))

# Max Pooling

classifier.add(MaxPooling2D(pool_size = (2,2)))

# Flattening

classifier.add(Flatten()) 

# Full Connection

classifier.add(Dense(units = 128, activation = "relu"))
classifier.add(Dense(units = 1, activation = "sigmoid"))

# Compilar la CNN
classifier.compile(optimizer = "adam", loss ="binary_crossentropy", metrics=["accuracy"])

### PARTE 2 ### Ajustar la CNN a las imagenes para entrenar

from keras.preprocessing.image import ImageDataGenerator

train_datagen = ImageDataGenerator(
        rescale=1./255,
        shear_range=0.2,
        zoom_range=0.2,
        horizontal_flip=True)
test_datagen = ImageDataGenerator(rescale=1./255)

train_generator = train_datagen.flow_from_directory(
        'dataset/training_set',
        target_size=(64, 64),
        batch_size=32,
        class_mode='binary')

validation_generator = test_datagen.flow_from_directory(
        'dataset/test_set',
        target_size=(64, 64),
        batch_size=32,
        class_mode='binary')

classifier.fit_generator(
        train_generator,
        steps_per_epoch=8000,
        epochs=25,
        validation_data=validation_generator,
        validation_steps=800)

 





