#!/bin/bash

URL="https://picsum.photos"
BASE_DIR=$(pwd)
TEMP_DIR="$(pwd)/temp"

function printHelpMessage() {
    # user is asking for help
    echo -e
    echo "* -p to save image on specific path"
    echo "* -t to save in /temp directory"
    echo "* -o to save image with specific name"
    echo "* -r to set custom resolution of image"
    echo -e
}

function downloadImage() {

    IMAGE_PATH=$1
    FILE_NAME=$2
    RESOLUTION=$3

    # Split the resolution into width and height
    RES_ARRAY=(${RESOLUTION//x/ })

    WIDTH=${RES_ARRAY[0]}
    HEIGHT=${RES_ARRAY[1]}

    cd $IMAGE_PATH

    wget $URL/$WIDTH/$HEIGHT -O $FILE_NAME

    # Return back to the base directory

    cd $BASE_DIR
}

function saveImage() {

    IMAGE_PATH=$TEMP_DIR
    IMAGE_RESOLUTION="1920x1080"
    IMAGE_NAME=image

    OUTPUT_FLAG=$3
    OUTPUT_NAME=$4

    RES_FLAG=$5
    RES=$6

    echo $#

    case $2 in
    -t)
        echo "Saving image in /temp dir"
        # Checking weather the temp dir exists or not
        if [ ! -e $TEMP_DIR ]; then
            # if not then create one
            mkdir temp
        fi

        IMAGE_PATH=$TEMP_DIR

        ;;
    -p)
        echo "Saving image in given path"

        # Check that path exist or not
        if [ -e $3 ]; then
            IMAGE_PATH=$3
        else
            echo "Invalid path"
        fi

        OUTPUT_FLAG=$4
        OUTPUT_NAME=$5

        RES_FLAG=$6
        RES=$7
        ;;
    ? | -h | --help)
        printHelpMessage
        ;;
    esac

    # Check for output name flag
    if [ ! -z $OUTPUT_FLAG ]; then
        if [ $OUTPUT_FLAG=="-o" ]; then
            # Check for valid filename
            if [ ! -z $OUTPUT_NAME ]; then
                # Set the filename
                IMAGE_NAME=$OUTPUT_NAME
            else
                echo "Enter Valid name"
            fi

        else
            echo "Invalid filename Flag"
        fi
    fi

    # Check for resolution flag
    if [ ! -z $RES_FLAG ]; then
        if [ $RES_FLAG=="-r" ]; then
            # Check for valid resolution
            if [ ! -z $RES ]; then
                # Set the resolution
                IMAGE_RESOLUTION=$RES
            else
                echo "Enter Valid Resolution"
            fi

        else
            echo "Invalid Resolution Flag"
        fi
    fi


    # Finally downloading the image
    downloadImage $IMAGE_PATH $IMAGE_NAME $IMAGE_RESOLUTION

}

if [ $# -lt 2 ]; then
    printHelpMessage
else
    saveImage $*
fi
