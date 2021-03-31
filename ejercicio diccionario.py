#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Tue Mar 23 20:25:53 2021

@author: sergio
"""

    subjects = {"Math": [],
                 "English": [],
                 "History": [],
                 "Science": [],
                 "IT":[]}
    for key in subjects:
         print("===", key, "===")
         for i in range(1, 4):
             subjects[key].append(int(input("Nota Trimestre {} ".format(i))))
    print("\n Medias por asignatura: ")
    for key, val in subjects.items():
        print(key, ":", sum(val)/len(val))
        