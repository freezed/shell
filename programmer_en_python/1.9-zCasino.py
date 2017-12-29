#!/usr/bin/env python3
# -*- coding: utf-8 -*-

# 1.9-zCasino.py : petit jeu de roulette très simplifié

# OpenClassrooms - Apprenez à programmer en Python - TP : tous au ZCasino
# https://openclassrooms.com/courses/apprenez-a-programmer-en-python/tp-tous-au-zcasino

# Le joueur mise sur un numéro compris entre 0 et 49
# En choisissant son numéro, il mise
# Les numéros pairs sont de couleur noire, les numéros impairs sont de couleur rouge
# Quand la roulette s'arrête:
# -Si le numéro gagnant est celui du joueur: gain = mise + (3x la mise)
# -Si le numéro gagnant et celui misé sont de la même couleur: gain mise + (50% de la mise)
# -Sinon la mise est perdue

import math
import random

# Definition des variables
err_value = "Bah alors?? Il faut saisir un nombre correct!"
msg_valeur = "Votre nombre est gagnant! Votre gain: "
msg_couleur = "Votre couleur est gagnante! Votre gain: "
msg_perdu = "\nDommage! Vous perdez votre mise!"
msg_final = "\nBravo! Vous empochez: "
choix_check = False
mise_check = False
msg_resultat = "\nLa bille s'arrête sur le nunéro : "

# Saisie & validation du choix
while choix_check is False:
    try:
        choix_valeur = input("Quel numéro choisissez vous (0-49)?")
    except SyntaxError:
        print(err_value)
    except NameError:
        print(err_value)
    else:
        try:
            choix_valeur = int(choix_valeur)
            assert choix_valeur < 50 and choix_valeur >= 0
        except ValueError:
            print(err_value)
        except AssertionError:
            print(err_value)
        else:
            choix_check = True

# Saisie & validation de la mise
while mise_check is False:
    try:
        mise = input("Quelle est votre mise (mini. 1)?")
    except SyntaxError:
        print(err_value)
    except NameError:
        print(err_value)
    else:
        try:
            mise = int(mise)
            assert mise > 0
        except ValueError:
            print(err_value)
        except AssertionError:
            print(err_value)
        else:
            mise_check = True

# Roulette
result_valeur = random.randrange(50)

# Comparaison
result_couleur = result_valeur % 2
choix_couleur = choix_valeur % 2

if result_valeur == choix_valeur:
    gain = mise * 3
    msg = msg_valeur + str(gain) + "€" + msg_final + str(gain + mise) + "€"
elif result_couleur == choix_couleur:
    gain = math.ceil(mise / 2)
    msg = msg_couleur + str(gain) + "€" + msg_final + str(gain + mise) + "€"
else:
    gain = 0
    msg = msg_perdu

# Affichage
print(msg_resultat + str(result_valeur))
print(msg)
