#!/usr/bin/env python3
# -*- coding: utf-8 -*-

# fonctions.py : essai d'utilisation d'un package

# OpenClassrooms - Apprenez à programmer en Python - Modularité
# https://openclassroom/courses/apprenez-a-programmer-en-python/pas-a-pas-vers-la-modularite-2-2

"""Module de test, contient une fonction _table_"""

def table(n, m=11):
    """Affiche la table de multiplication d'un nombre
    de 1 * n
    a m * n """
    for i in range(1, m):
        print(i,"x",n,"=",i * n)

# test de _table_
if __name__ == "__main__":
    table(3)
