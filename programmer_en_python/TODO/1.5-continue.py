#!/usr/bin/env python3
# -*- coding: utf-8 -*-

# 1.5-continue.py : remplacer while/continue par une structure plus claire

# OpenClassrooms - Apprenez à programmer en Python - Les boucles
# https://openclassroom

i = 1
while i < 20: # Tant que i est inférieure à 20
    if i % 3 == 0:
        i += 4 # On ajoute 4 à i
        print("On incrémente i de 4. i est maintenant égale à", i)
        continue # On retourne au while sans exécuter les autres lignes
    print("La variable i =", i)
    i += 1 # Dans le cas classique on ajoute juste 1 à i
