#!/bin/bash

# make clean:
/bin/rm -f *.png *.aux *.dvi *.ps *.eps *.log

for f in phys-ing*.tex ; do
  echo "***** processing file ${f} ...";
  name=`basename ${f} .tex`;
  echo "filename is ${f}"
  echo "name is ${name}"
  # create dvi from tex:
  latex --shell-escape ${f};
  # create svg from dvi:
  dvisvgm --no-fonts ${name}.dvi -o ${name}.svg;
  # create various png files from the svg file:
  inkscape -z -e ${name}-10x30px.png -h 10 -w 30 ${name}.svg;
  inkscape -z -e ${name}-16x16px.png -h 16 -w 16 ${name}.svg;
  inkscape -z -e ${name}-20x60px.png -h 20 -w 60 ${name}.svg;
  inkscape -z -e ${name}-30x90px.png -h 30 -w 90 ${name}.svg;
  inkscape -z -e ${name}-32x32px.png -h 32 -w 32 ${name}.svg;
  inkscape -z -e ${name}-48x48px.png -h 48 -w 48 ${name}.svg;
  inkscape -z -e ${name}-50x150px.png -h 50 -w 150 ${name}.svg;
  inkscape -z -e ${name}-100x100px.png -h 100 -w 100 ${name}.svg;
  inkscape -z -e ${name}-100x300px.png -h 100 -w 300 ${name}.svg;
  inkscape -z -e ${name}-200x600px.png -h 200 -w 600 ${name}.svg;
  inkscape -z -e ${name}-300x900px.png -h 300 -w 900 ${name}.svg;
  inkscape -z -e ${name}-500x1500px.png -h 500 -w 1500 ${name}.svg;
done;

