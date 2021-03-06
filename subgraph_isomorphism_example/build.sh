#!/bin/bash
set -e
clang-format -style=file main.cpp -i
make
./main
for f in `ls *.dot`
do
  name=$(basename $f)
  filename="${name%.*}"
  neato $f -Tsvg -o $filename.svg
  neato $f -Tpng -o $filename.png
done
open -a /Applications/Firefox.app *.svg
