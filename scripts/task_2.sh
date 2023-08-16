#!/bin/bash

# Creating three files in task2 folder

FIRST_FOLDER_PATH="$(pwd)/task_2"

# Changing directory to task2 folder
cd $FIRST_FOLDER_PATH

# Creating three files in task2 folder

for i in {1..3}; do
    echo "Creating file no $i"
    touch "file$i.txt"
done

# Creating second folder

mkdir task2_temp

SECOND_FOLDER_PATH="$(pwd)/task2_temp"

# Copying the files from one folder to other

for i in {1..3}; do
    echo "Copying file$i.txt to $SECOND_FOLDER_PATH"
    cp "file$i.txt" $SECOND_FOLDER_PATH
done



# Replacing names of folder

mv task2_temp task_2

# cd to previous directory

cd ..

mv task_2 task2_temp

