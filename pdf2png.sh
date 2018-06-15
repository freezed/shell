#!/bin/bash

# pdf2png.sh : Convert each pages of a PDF file in PNG
#
# dependances : pdftk, imagemagick

# Author: freezed <freezed@users.noreply.github.com> 2018-06-14
# Licence: GNU GPL v3 [www.gnu.org/licenses/gpl.html]
# Version: 0.1

# TODO if file is not PDF
# TODO if file has no page
# TODO crop margins

#############
# VARIABLES #
#############
FILENAME=$1
TMPPATTERN="~\$-tmp_"

##########
# BLABLA #
##########
FILE_ERROR="\n/!\\ 1st argument must be an existing, consistant and readable file.\n"
ARG_ERROR="\n/!\\ One argument max.\n"
USAGE="Usage:\t${0} file.pdf\n"

############################
# TRAITEMENT DES ARGUMENTS #
############################

## Count arguments
if [ $# -ne 1 ]
then
    echo -e $ARG_ERROR
    echo -e $USAGE
    #~ exit 1

## Checks file
elif [ -s "$FILENAME" ] && [ -r "$FILENAME" ]
then
    PAGES=`pdftk $FILENAME dump_data | grep NumberOfPages | cut -d" " -f2`

    ## Do the conversion
    if [[ $PAGES -gt 1 ]]
    then
        for (( i=1 ; i <= $PAGES ; i++ ))
        do
            echo -e "Page : "$i"/"$PAGES
            pdftk $FILENAME cat $i-$i output $TMPPATTERN$i.pdf
            convert $TMPPATTERN$i.pdf -density 100 -flatten ${FILENAME%.pdf}_$i-$PAGES.png
            rm $TMPPATTERN$i.pdf
        done
        exit 0

    else

        convert $FILENAME -density 100 -flatten ${FILENAME%.pdf}.png
        exit 0

    fi

## Throw file error
else
    echo -e $FILE_ERROR
    echo -e $USAGE
    #~ exit 1
fi
