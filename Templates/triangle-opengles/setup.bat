@echo off

cmake -E remove_directory Build
cmake -B Build -DBUILD_SHARED_LIBS=ON
cmake --build Build