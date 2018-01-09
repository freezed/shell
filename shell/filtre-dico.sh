#!/bin/zsh

# Script pour nettoyer le dico fourni dans l'exercice du cours
# «Reprenez le contrôle à l'aide de Linux»
# (https://openclassrooms.com/courses/reprenez-le-controle-a-l-aide-de-linux/exercises/85)
#

SUFFIX=("SSENT\\s" "SSIEZ\\s" "ERONT\\s" "AIENT\\s" "ANTE\\s" "SSEZ\\s" "AUX\\s" "S\\s")
SUFFIX2=("SSENT" "SSIEZ" "ERONT" "AIENT" "ANTE" "SSEZ" "AUX" "S")
DICO=`cat dico.txt`
TOTALDICO=`echo $DICO|wc -w`
TOTALSUFFIX=0

echo "Nombre initial de mot dans DICO :"$TOTALDICO
echo "Nombre de mots pour chaque SUFFIX :"

# On compte les occurences des PATTERN dans le DICO
for ((i=1; i <= ${#SUFFIX}; i++))
do
    COUNTSUFFIX=`echo $DICO|grep -cE "${SUFFIX[$i]}"`
    TOTALSUFFIX=`expr $TOTALSUFFIX + $COUNTSUFFIX`
    echo $i" "${SUFFIX[$i]}" : "${COUNTSUFFIX}
done

RESTEDICO=`expr $TOTALDICO - $TOTALSUFFIX`

echo "\nTOTAL = "$TOTALSUFFIX"\n"
echo "Le DICO après suppression devrait contenir "$RESTEDICO" mots ("$TOTALDICO"-"$TOTALSUFFIX")\n"
echo "Suppression des SUFFIX dans le DICO méthode 1:"

for ((i=1; i <= ${#SUFFIX}; i++))
do
    COUNTSUFFIX=`echo $DICO|grep -cE "${SUFFIX[$i]}"`
    DICO=`echo $DICO|grep -E "[^${SUFFIX[$i]}]"`
    COUNTDICO=`echo $DICO|wc -w`
    echo $i" "${SUFFIX[$i]}" : "${COUNTSUFFIX}" reste dans DICO : "${COUNTDICO}
    #echo $DICO > .dico-${i}
done

echo "\nNombre final de mot dans DICO :"$COUNTDICO
echo "\nSuppression des SUFFIX dans le DICO méthode 2:"

for ((i=1; i <= ${#SUFFIX2}; i++))
do
    COUNTSUFFIX=`echo $DICO|grep -cE "${SUFFIX2[$i]}\\s"`
    DICO=`echo $DICO|grep -E "[^${SUFFIX2[$i]}]\\s"`
    COUNTDICO=`echo $DICO|wc -w`
    echo $i" "${SUFFIX2[$i]}" : "${COUNTSUFFIX}" reste dans DICO : "${COUNTDICO}
    #echo $DICO > .dico-${i}
done

#echo $DICO > .dicolight
