#!/bin/bash

# default file name
filename="thesis"

# get file name from parameter
if [ $1 ]; then
    filename=$1
fi

# make .dvi and .pdf file
platex $filename
pbibtex $filename
pbibtex main.aux
platex $filename
pbibtex $filename
pbibtex main.aux
platex $filename
dvipdfmx -p a4 $filename

# preview
open $filename.pdf
