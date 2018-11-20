#!/bin/bash

# define the output rom
OUTPUT_ROM="ROM.smc"

# compile the source files to the out folder
pushd src > /dev/null

OUTFILE="../out/Main.obj"

wla-65816 -v -o $OUTFILE Main.asm

popd > /dev/null

# link the files
pushd out > /dev/null

wlalink -v -r "Objects.link" $OUTPUT_ROM

popd > /dev/null