#!/bin/zsh

# Script pour nettoyer le dico fourni ici:
# https://openclassrooms.com/uploads/fr/ftp/mateo21/cpp/dico.zip

SUFFIX=("\-{1,}" "SSENT\\s" "SSIEZ\\s" "ERONT\\s" "AIENT\\s" "ANTE\\s" "SSEZ\\s" "AUX\\s" "S\\s" "^.{1,3}\\s" "^.{9,}\\s")
DICO=$(cat dico.txt)
TOTALDICO=$(echo $DICO|wc -w)
TOTALSUFFIX=0

echo "Nombre initial de mot dans DICO :"$TOTALDICO
echo "Nombre de mots pour chaque SUFFIX :"

for ((i=1; i <= ${#SUFFIX}; i++))  # On compte les occurences des PATTERN dans le DICO
do
    COUNTSUFFIX=$(echo $DICO|grep -cP "${SUFFIX[$i]}")
    TOTALSUFFIX=$(expr $TOTALSUFFIX + $COUNTSUFFIX)
    echo $i" "${SUFFIX[$i]}" : "${COUNTSUFFIX}
done

RESTEDICO=$(expr $TOTALDICO - $TOTALSUFFIX)

echo "\nTOTAL = "$TOTALSUFFIX"\n"
echo "Le DICO après suppression devrait contenir "$RESTEDICO" mots ("$TOTALDICO"-"$TOTALSUFFIX")\n"
echo "Suppression des SUFFIX dans le DICO:"

for ((i=1; i <= ${#SUFFIX}; i++))
do
    COUNTSUFFIX=$(echo $DICO|grep -cP "${SUFFIX[$i]}")
    DICO=$(echo $DICO|grep -vP "${SUFFIX[$i]}")
    COUNTDICO=$(echo $DICO|wc -w)
    echo $i" "${SUFFIX[$i]}" : "${COUNTSUFFIX}" reste: "${COUNTDICO}
done

echo "\nNombre final de mot dans DICO :"$COUNTDICO
echo $DICO > .dicolight
