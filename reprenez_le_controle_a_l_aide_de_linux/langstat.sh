#!/bin/bash
#
# langstat.sh - script qui fournit des statistiques sur l'utilisation des lettres dans une langue
# 	Cours OpenClassrooms - Reprenez le contrôle à l'aide de Linux
# 	https://openclassrooms.com/courses/reprenez-le-controle-a-l-aide-de-linux/exercises/85
#
#	* Afficher le nombre de fois que chaque lettre est utilisée au moins une fois dans un mot (mission n°1)
#	* Vérifier la présence du paramètre indiquant le nom du fichier dictionnaire à utiliser
#	* Vérifier que le fichier dictionnaire existe bel et bien
#	* Ne pas laisser de fichier temporaire de travail sur le disque
#	* Proposer une seconde fonctionnalité originale à partir d'un second paramètre (mission n°2)
#	* Fournir quelques commentaires dans le script expliquant son fonctionnement

#############
# VARIABLES #
#############
ALPHABET='A B C D E F G H I J K L M O P Q R S T U V W X Y Z'
TEMP_FILE='.langstat'
FILENAME=$1
ARG2='--ratio'

##########
# BLABLA #
##########
DISCLAIMER="\nPour le fichier «${FILENAME}», voici le nombre de fois où chaque lettre est utilisée au moins une fois par mot (par ordre décroissant)"
HEADER=''
FILE_ERROR="\n/!\\ Le 1er argument DOIT être un fichier qui existe ET être lisible ET avoir une taille non nulle!\n"
ARG_ERROR="\n/!\\ Ce script n'accèpte qu'un maximum de 2 arguments!\n"
USAGE="Usage:\t${0} fichier ["$ARG2"]\n"

#############
# FONCTIONS #
#############
function COUNT_LETTERS {

	for LETTER in $ALPHABET
	do
		COUNTER=`cat $FILENAME|grep -ic $LETTER`
		echo -e $COUNTER '\t- '$LETTER >> $TEMP_FILE
	done
}

function BONUS_FUNCTION {

	TOTAL=`cat $FILENAME|wc -w`	

	for LETTER in $ALPHABET
	do
		COUNTER=`cat $FILENAME|grep -ic $LETTER`
		RATIO=$(echo "scale=3; ($COUNTER/$TOTAL)*100"|bc|sed -e 's/00$/%/g')
		echo -e $COUNTER '\t  |  '$RATIO'\t| ' $LETTER >> $TEMP_FILE
	done
	echo -e $DISCLAIMER" avec le pourcentage de représentation.\n"
	echo -e 'Occurence |   Ratio\t| Lettre'
}

############################
# TRAITEMENT DES ARGUMENTS #
############################
## >2 arguments
if [ $# -gt 2 ]
then
	echo -e $ARG_ERROR
	echo -e $USAGE
	exit 1
fi

## Contrôle du fichier
if [ -s "$FILENAME" ] && [ -r "$FILENAME" ]
then
	touch $TEMP_FILE
else
	echo -e $FILE_ERROR
	echo -e $USAGE
	exit 1
fi

# Génération du résultat adequat
if [ "$2" == "$ARG2" ] && [ -r "$TEMP_FILE" ]
then
	BONUS_FUNCTION
else
	COUNT_LETTERS
fi

# Affichage du résultat
cat $TEMP_FILE |sort -rn

# Suppression du fichier temporaire
rm -rf $TEMP_FILE
