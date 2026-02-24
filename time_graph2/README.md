# How to build a Time Graph page

Martin Holmes, August 2025

This document describes the work done to make it possible to generate an interactive HTML version of the time graph based on two input CSV files, using Python Matplotlib and XSLT. Java, Ant, and Python will need to be installed; the Python script uses pandas, matplotlib, math, re, argparse, datetime, and pathlib.

For simplicity, it's best to put the CSV files in this folder (time_graph2) to run the process.

## Building a graph page

The process goes as follows (in the time_graph2 folder):

1. Invoke Ant, passing two parameters: the CSV containing the narrative info, and a second CSV containing the colour mapping, which associates each narrator and character name with a colour to be used in the graph:

ant -DinputData=TSATFTimeGraphAug26CleanClean.csv -DinputColors=TSATFColorCodeAug26.csv

2. Ant will first run the python script make_svg.py, which will generate an SVG file of the graph.

3. Next, Ant will run an XSLT transformation using the Saxon transformer in the lib folder, to generate an HTML page which has the same name as the data CSV file, but with the HTML extension.

The HTML links to two other files, time_graph.js and time_graph.css, also in this folder; when you move the HTML file somewhere else, these files will need to travel with it.

## How the process actually works

 - The Python code uses Matplotlib to generate an SVG diagram with a legend which is also rendered in SVG alongside the graph. This process ensures that each component of the graph is labelled with a meaningful id based on its relationship to the data -- narrator, character, telling time, etc. -- and its row number in the CSV. The graph created is perfectly good SVG but it is not interactive, and the position of the legends means that the graph dimensions are constrained. 

 - The Python code also creates a JSON version of the CSV data; this will be used by the XSLT to create popups in the web page.

 - The XSLT processes the SVG to wrap it in an HTML page. The legends are removed from the SVG and the remaining graph is widened to make use of that space; then the legend data from the SVG is used to create new controls in HTML, sitting below the graph, along with an additional Telling Time control. The controls are in the form of checkboxes, all checked by default.
 - The XSLT also loads the JSON file generated in the previous step, and uses that data to create an appendix in the HTML file, consisting of a list, with one item for each row in the spreadsheet, containing the event data (hidden by default).

 - When the resulting web page is loaded in a browser, the linked JavaScript in time_graph.js parses the controls and the SVG, and adds events which cause parts of the graph to be made visible or invisible when the checkboxes are toggled. It also turns most of the graph components into links which, when clicked, show a popup dialog box which is populated by the contents of one of the invisible event items.
 
## What remains to be done

Among the things we haven't had time to finish as of 2025-08-29 are:

1. Different components of the graph, representing event points, character points, and telling time lines, should display different information. At the moment they all display just the Event Name and Evidence columns from the spreadsheet. This would require more sophisticated XSLT processing of the JSON version of the spreadsheet, to create separate versions of each row for each component; and then the JavaScript would have to be updated so that it links the appropriate version of row data to each graph component.

2. Mechanisms for integrating these generated HTML pages into the main site build. That will require:

 - Moving the required site build components from HCMC's svn into the GitHub repository.
 - Adding some special processing for HTML pages in (for example) a particular folder, causing them to be integrated into the site in a different way from the existing SVGs.
 
 
 
 