#!/bin/bash

#Script to Search a file in depth first search manner

#First check weather any folder exists in the directory or not

#To do this I create a function which checks that if any

#folder exist in current directory or not then again check in that

#folder and so on.. (Basically in depth first search manner)


function checkFolder() {

    #filename is $1
    FILE_NAME="$1"
    #current dir $2
    CURRENT_FOLDER="$2"

    #Loop through all of the itmes in current directory
    for item in "$CURRENT_FOLDER"/*; do


        #If the current item is a folder
        if [ -d "$item" ]; then

            # check for further folders in it
            checkFolder $FILE_NAME "$item"

        fi

        #If the item is a file then 
        if [ -f "$item" ]; then

            if [ "$item" == "$CURRENT_FOLDER/$FILE_NAME" ]; then

                echo "File found successfully:"

                echo "$item"

                exit 0
            fi

        fi

    done
}

if [ ! $# -lt 1 ]; then
    checkFolder $1 "$(pwd)"
    echo "File not found"
else
    echo "Invalid number of arguments"
    echo "Please provide filename"
fi
