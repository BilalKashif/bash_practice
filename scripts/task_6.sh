#!/bin/bash

function printString() {

    STRING=$2
    CHAR=$4

    # Check for first flag which is at 1 position
    # then check for second flag which is at 3 position
    if [ $1 == "-s" ]; then
        if [ $3 == "-c" ]; then
            
            # Check for character length
            if [ "${#CHAR}" -gt 1 ]; then
                echo "Character lenght must be equle to 1"
                exit 0
            fi
            
            for ((i = 0; i < ("${#STRING}" + 4); i += 1)); do
                echo -n $CHAR
            done
            # For printing in newline
            echo -e

            echo "$CHAR $STRING $CHAR"

            for ((i = 0; i < ("${#STRING}" + 4); i += 1)); do
                echo -n $CHAR
            done

            echo -e

        else
            echo "Invalid Character Flag"
        fi
    else
        echo "Invalid String Flag"
    fi

    exit 0
}

if [ "$#" -eq 4 ]; then
    # Print String with character
    printString $*
fi

if [ "$#" -eq 2 ]; then
    # Simply Print the string

    echo $2

    exit 0
fi

echo "Invalid Number of arguments"
