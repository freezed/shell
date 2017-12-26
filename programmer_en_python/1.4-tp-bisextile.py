#!/usr/bin/env python3
# -*- coding: utf-8 -*-

# 1.4-tp-bisextile : Déterminer si une année saisie par l'utilisateur est bissextile

# OpenClassrooms - Apprenez à programmer en Python - Les structures conditionnelles
# https://openclassrooms.com/courses/apprenez-a-programmer-en-python/les-structures-conditionnelles#/id/r-231173

annee = input("Saisir une année:")
annee = int(annee)

if (annee % 400) == 0 :
    print(annee," est bisextile (divisible par 400)")
elif (annee % 4) == 0 and (annee % 100) != 0:
    print(annee," est bisextile (divisible par 4, mais pas par 100)")
else:
    print(annee," n'est PAS bisextile.")
liste = []
