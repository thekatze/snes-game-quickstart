#!/bin/bash

# define the output rom
OUTPUT_ROM="ROM.smc"

# compile the source files to the out folder
pushd src > /dev/null

SOURCE_FILES=$(ls | grep .asm)

for FILE in $SOURCE_FILES
do
    OUTFILE="../out/"${FILE%.*}".obj"

    echo "Compiling" $FILE "to" $OUTFILE

    wla-65816 -v -o $OUTFILE $FILE
done

popd > /dev/null

# link the files
pushd out > /dev/null

wlalink -v -r "Objects.link" $OUTPUT_ROM

popd > /dev/null