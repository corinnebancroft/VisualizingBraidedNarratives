# How to build a Time Graph page

Martin Holmes, August 2025 updated by Corinne Bancroft, June 2026

This document describes the work done to make it possible to generate an interactive HTML version of the time graph based on two input CSV files, using Python Matplotlib and XSLT. Java, Ant, and Python will need to be installed; the Python script uses pandas, matplotlib, math, re, argparse, datetime, and pathlib.

For simplicity, it's best to put the CSV files in this folder (time_graph) to run the process.

## Building a graph page

The process goes as follows (in the time_graph folder):

1. Invoke Ant

2. Ant will first run the python script make_svg.py, which will generate an SVG file of the graph.

3. Next, Ant will run an XSLT transformation using the Saxon transformer in the lib folder, to generate an HTML page which has the same name as the data CSV file, but with the HTML extension.

The HTML links to two other files, time_graph.js and time_graph.css, also in this folder; when you move the HTML file somewhere else, these files will need to travel with it.

## How the process actually works

 - The Python code uses Matplotlib to generate an SVG diagram with a legend which is also rendered in SVG alongside the graph. This process ensures that each component of the graph is labelled with a meaningful id based on its relationship to the data -- narrator, character, telling time, etc. -- and its row number in the CSV. The graph created is perfectly good SVG but it is not interactive, and the position of the legends means that the graph dimensions are constrained. 

 - The Python code also creates a JSON version of the CSV data; this will be used by the XSLT to create popups in the web page.

 - The XSLT processes the SVG to wrap it in an HTML page. The legends are removed from the SVG and the remaining graph is widened to make use of that space; then the legend data from the SVG is used to create new controls in HTML, sitting below the graph, along with an additional Telling Time control. The controls are in the form of checkboxes, all checked by default.
 - The XSLT also loads the JSON file generated in the previous step, and uses that data to create an appendix in the HTML file, consisting of a list, with one item for each row in the spreadsheet, containing the event data (hidden by default).

 - When the resulting web page is loaded in a browser, the linked JavaScript in time_graph.js parses the controls and the SVG, and adds events which cause parts of the graph to be made visible or invisible when the checkboxes are toggled. It also turns most of the graph components into links which, when clicked, show a popup dialog box which is populated by the contents of one of the invisible event items.
 
## What the input files should look like

The main input is a csv file with the following headers: Relative Order,Event Name,Start Date,End Date,Is Approximate?,Narrator,Start Page,End Page,Start Date TT,End Date TT,Start Page TT,End Page TT,Is Approximate TT?,Evidence,Participating Characters,+ one column for each participating Character

The color.csv should have the followign headers: Name,Color,HEX Code

## Other helpful folders
In TimeGraphCSV, you will find a python script that will help ensure the input.csv is formatted correctly.
In colorcodes, you will find a python script that will generate the names and characters you will need to find colors for. Then you can fill in the colors and run another script to populate the csv with the matching HEX codes.

## What remains to be done

Among the things we haven't had time to finish as of 2025-08-29 are:

1. Mechanisms for integrating these generated HTML pages into the main site build. That will require:

 - Moving the required site build components from HCMC's svn into the GitHub repository.
 
 
 
 