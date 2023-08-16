#!/bin/bash

# Get all IPs

ALL_IPS="$(hostname -I)"

# Split the array with space as delimiter

IPS_ARRAY=(${ALL_IPS// / })

# print the first one

echo "${IPS_ARRAY[0]}"
