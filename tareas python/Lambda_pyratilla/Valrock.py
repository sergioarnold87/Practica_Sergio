#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Thu Apr 29 11:25:02 2021

@author: sergio
"""

hits = {"brazaleteD": 8, "brazaleteI": 8, "cinturon": 14}

from functools import  reduce

total_hits = reduce(lambda x, y: x + y, hits.values())



