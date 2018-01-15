#!/usr/bin/env python3
# -*- coding: utf-8 -*-
import random
import os
import pickle
from fonctions import check_letter, cls

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

# TODO

# Constantes
SCORES_FILE = ".scores"
WORD_LIST_FILE = "dicolight.txt"
ASK_NAME = "ASK_NAME : "
ASK_LETTER = "ASK_LETTER : "
ERR_LETTER_TYPE = "ERR_LETTER_TYPE"
ERR_VALUE_ERR = "ERR_VALUE_ERR"
ERR_WORD_LIST_FILE = "ERR_WORD_LIST_FILE"
ERR_LETTER_LEN = "ERR_LETTER_LEN"
ERR_LETTER_ALPHA = "ERR_LETTER_ALPHA"
ERR_LETTER_USED = "ERR_LETTER_USED"
MAX_TURNS = 18
MSG_END_GAME = "MSG_END_GAME : "
MSG_1ST_GAME = "MSG_1ST_GAME"
MSG_NEW_GAME = "MSG_MEW_GAME"

# Variables
game_continue = True
player_name = str()
letter = str()
turns = 0
alphabet = [
    'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M',
    'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'
]

while player_name.isalnum() is False:  # Le joueur donne son nom
    player_name = str(input(ASK_NAME))

    if player_name.isalnum() is False:
        print(ERR_LETTER_ALPHA)

if os.path.isfile(WORD_LIST_FILE) is True:  # Chargement du dictionnaire
    with open(WORD_LIST_FILE, "r") as word_list_file:
        word_list = word_list_file.read().splitlines()
else:
    raise ValueError(ERR_WORD_LIST_FILE)

# Choix du mot cible
target_word = list(word_list[random.randrange(0, len(word_list))])
player_word = list("*" * len(target_word))

# Debut de partie
while game_continue is True:

    while (
        len(letter) != 1
        or letter.isalpha() is False
        or alphabet.count(letter) != 1
    ):  # Le joueur choisi une lettre

            letter = str(input(ASK_LETTER)).upper()

            if len(letter) != 1:
                print(ERR_LETTER_LEN)

            elif letter.isalpha() is False:
                print(ERR_LETTER_ALPHA)

            elif alphabet.count(letter) != 1:
                print(ERR_LETTER_USED)

    # Presence de la lettre?
    if check_letter(letter, target_word) is not False:
        positions = check_letter(letter, target_word)
        for i in positions:
            player_word[i] = letter

    alphabet[alphabet.index(letter)] = '_'
    turns += 1
    if turns == MAX_TURNS or player_word.count("*") == 0:  # Fin de partie?
        game_continue = False

    # TODO Affichage de la fin de tour
    cls()
    print(alphabet)
    print("tour : ", turns, "sur ", MAX_TURNS)
    print(player_word)


# TODO Fin de partie
points = MAX_TURNS - turns
cls()
print(MSG_END_GAME, points)
print(target_word)

# TODO Affichage du score de la partie et des highscores
if os.path.isfile(SCORES_FILE) is True:  # Ouverture du fichier
    with open(SCORES_FILE, "rb") as scores_file:
        scores = pickle.Unpickler(scores_file).load()
        print(MSG_NEW_GAME)

else:
    scores = {player_name: 0}
    print(MSG_1ST_GAME)

# Calcul du score
if scores.get(player_name, False) is False:  # Nouveau joueur
    scores.update({player_name: 0})

scores[player_name] = scores[player_name] + points

# TODO Enregistrement du score
with open(SCORES_FILE, "wb") as scores_file:
    pickle.Pickler(scores_file).dump(scores)

print(scores)
