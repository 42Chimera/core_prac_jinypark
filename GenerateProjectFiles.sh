#!/bin/bash

if [ ! -f "$PWD/Engine/CMakeLists.txt" ]; then
    echo "GenerateProjectFiles ERROR: The batch file does not appear to be located in the root Chimera directory. This script must be run from within that directory."
    read -p "Press any key to continue..." -n 1 -r
    exit 1
fi

cmake -S "$PWD/Engine" -B "$PWD/Engine/Intermediate" -DBUILD_SHARED_LIBS=ON -DCMAKE_VERBOSE_MAKEFILE=TRUE
cmake --build "$PWD/Engine/Intermediate"
# make -C "$PWD/Engine/Intermediate" clean
mkdir -p "$PWD/Engine/Config"
echo "CHIMERA_ROOT=$PWD/Engine" > "$PWD/Engine/Config/DefaultEngine.ini"
echo "CHIMERA_PLUGINS=$PWD/Engine/Plugins" >> "$PWD/Engine/Config/DefaultEngine.ini"
exit $?