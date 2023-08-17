#!/bin/bash

function printBox() {

    STRING=$@

    for ((i = 0; i < (${#STRING} + 4); i += 1)); do

        echo -n "*"

    done

    echo -e

    echo "* $STRING *"

    for ((i = 0; i < (${#STRING} + 4); i += 1)); do

        echo -n "*"

    done
}

# If number of arguments are not less then 1
if [ ! $# -lt 1 ]; then

    printBox $1

else

    echo "Invalid number of arguments"

fi
