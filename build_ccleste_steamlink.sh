#!/bin/bash
#
echo "Checking For SDK..."
source "../../setenv.sh"

# Prepare package directory
rm "./output/ccleste-steamlink/ccleste"
rm "./output/ccleste"

# Build it
make -f ./Makefile.Steamlink

# Add to output folder
cp "./ccleste" "./output/ccleste-steamlink/ccleste"
cp "./ccleste" "./output/ccleste"

echo "Packaging it for Steam Link...."
export DESTDIR="${PWD}/output/ccleste-steamlink"
cd output

# Pack it up for the Steam Link
name=$(basename ${DESTDIR})
tar zcvf $name.tgz $name || exit 3

# Clean up
rm "./ccleste"
rm "./ccleste.o"

echo "Build Complete! Check in /output/ directory."


