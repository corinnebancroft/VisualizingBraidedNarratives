# How to build a Time Graph page

Martin Holmes, August 2025

This document describes the work done to make it possible to generate an interactive HTML version of the time graph based on two input CSV files, using Python Matplotlib and XSLT. Java, Ant, and Python will need to be installed; the Python script uses pandas, matplotlib, math, re, argparse, datetime, and pathlib.

For simplicity, it's best to put the CSV files in this folder (time_graph2) to run the process.

The process goes as follows (in the time_graph2 folder):

1. Invoke Ant, passing two parameters: the CSV containing the narrative info, and a second CSV containing the colour mapping, which associates each narrator and character name with a colour to be used in the graph:

ant -DinputData=TSATFTimeGraphAug26.csv -DinputColors=TSATFColorCodeAug26.csv

2. Ant will first run the python script make_svg.py, which will generate an SVG file of the graph.

3. Next, Ant will run an XSLT transformation using the Saxon transformer in the lib folder, to generate an HTML page which has the same name as the data CSV file, but with the HTML extension.

The HTML links to two other files, time_graph.js and time_graph.css, also in this folder; when you move the HTML file somewhere else, these files will need to travel with it.
