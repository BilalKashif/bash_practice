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

# Back to the first directory
cd ..

# Creating second folder

mkdir task2_temp

SECOND_FOLDER_PATH="$(pwd)/task2_temp"

# Cd to te first folder
cd $FIRST_FOLDER_PATH
# Copying the files from one folder to other

for i in {1..3}; do
    echo "Copying file$i.txt to $SECOND_FOLDER_PATH"
    cp "file$i.txt" $SECOND_FOLDER_PATH
done

# Back in the previous directory
cd ..

# Replacing names of folder

echo "Swaping folder names" 

mv task2_temp task

mv task_2 task2_temp

mv task task_2


