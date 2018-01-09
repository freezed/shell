#!/bin/zsh

# Script pour nettoyer le dico fourni dans l'exercice du cours
# «Reprenez le contrôle à l'aide de Linux»
# (https://openclassrooms.com/courses/reprenez-le-controle-a-l-aide-de-linux/exercises/85)
#

SUFFIX=("SSENT" "SSIEZ" "ERONT" "AIENT" "ANTE" "SSEZ" "AUX" "S")
DICO=`cat dico.txt`
TOTALDICO=`echo $DICO|wc -w`
TOTALSUFFIX=0

echo "Nombre initial de mot dans DICO :"$TOTALDICO
echo "Nombre de mots pour chaque SUFFIX :"

# On compte les occurences des PATTERN dans le DICO
for ((i=1; i <= ${#SUFFIX}; i++))
do
    COUNTSUFFIX=`echo $DICO|grep -cE "${SUFFIX[$i]}\\s"`
    TOTALSUFFIX=`expr $TOTALSUFFIX + $COUNTSUFFIX`
    echo $i" "${SUFFIX[$i]}" : "${COUNTSUFFIX}
done

RESTEDICO=`expr $TOTALDICO - $TOTALSUFFIX`

echo "TOTAL = "$TOTALSUFFIX"\n"
echo "Le DICO après suppression devrait contenir "$RESTEDICO" mots ("$TOTALDICO"-"$TOTALSUFFIX")\n"
echo "Suppression des SUFFIX dans le DICO :"

#On supprime une apres l'autre les occurences des PATTERN dans le DICO
for ((i=1; i <= ${#SUFFIX}; i++))
do
    COUNTSUFFIX=`echo $DICO|grep -cE "${SUFFIX[$i]}\\s"`
    DICO=`echo $DICO|grep -E "[^${SUFFIX[$i]}]\\s"`
    TOTALDICO=`echo $DICO|wc -w`
    echo $i" "${SUFFIX[$i]}" : "${COUNTSUFFIX}" reste dans DICO : "${TOTALDICO}
done

echo "Nombre final de mot dans DICO :"$TOTALDICO
#echo $DICO > .dicolight
