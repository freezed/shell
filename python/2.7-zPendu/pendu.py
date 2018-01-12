#!/usr/bin/env python3
# -*- coding: utf-8 -*-
import random
import os
from fonctions import check_letter

# 2.7-zPendu.py: Jeu de pendu avec cumul des scores des differant joueurs

# OpenClassrooms - Apprenez a programmer en Python -
# https://openclassrooms.com/courses/apprenez-a-programmer-en-python/tp-un-bon-vieux-pendu

# Le joueur donne son nom au debut (enregistrement du score)
# Le script choisit un mot (8 lettres max) au hasard dans une liste
# Le joueur a chaque tour saisit une lettre
# Si la lettre figure dans le mot, l'ordinateur affiche le mot avec
# les lettres deja trouvees. Celles qui ne le sont pas encore sont
# remplacees par des etoiles (*). Le joueur a autant de chances que
# le nombre de lettre du mot. Au dela, perdu.
# Le score: score courant (0 si aucun score deja enregistre), a
# chaque partie, ajoute le nombre de coups restants (non utilise)

# Constantes
SCORE_FILE = ".score"
WORD_LIST_FILE = "dicolight.txt"
ASK_NAME = "ASK_NAME : "
ASK_LETTER = "ASK_LETTER : "
ERR_LETTER_TYPE = "ERR_LETTER_TYPE"
ERR_VALUE_ERR = "ERR_VALUE_ERR"
ERR_WORD_LIST_FILE = "ERR_WORD_LIST_FILE"

# Le joueur donne son nom
player_name = str(input(ASK_NAME))

# Chargement du dictionnaire
if os.path.isfile(WORD_LIST_FILE) is True:
    with open(WORD_LIST_FILE, "r") as word_list_file:
        word_list = word_list_file.read().splitlines()
else:
    raise ValueError(ERR_WORD_LIST_FILE)

# Choix du mot cible
target_word = list(word_list[random.randrange(0, len(word_list))])
player_word = list("*" * len(target_word))

# Debut de partie

# Debut de tour, le joueur choisi une lettre
letter = str(input(ASK_LETTER))

# Recherche si la lettre est presente: on la place dans player_word
if check_letter(letter, target_word) is not False:
    positions = check_letter(letter, target_word)
    for i in positions:
        player_word[i] = letter


# Affichage de la fin de tour
print(player_word)
print(target_word)

# Fin de partie
print(player_word.count("*"))
print(len(target_word))

# Affichage du score de la partie et des highscores

# Enregistrement du score
