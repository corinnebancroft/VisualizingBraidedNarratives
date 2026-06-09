## Overview
This repository contains all the scripts and files used in the development of the Visualizing Braided Narratives Project

## Character Networks
This repository holds the files and scripts necessary to create social networks. 

First, we collected information from novels using online databases hosted by UVic’s HCMC. There is a script in the folder that backs up the databases to the repo and saves them as .csv files. Then, there is a python script that reads those csv files and reformats them and applies some additional rules so they are gephi ready.

The gephi_toolkit folder holds a java script that will run gephi from the command line according to the method we developed using the gephi app. This script will prompt users for the acronym of a novel, which will direct the script to the .csv files produced above. 

## Time Graphs
This directory holds the scripts necessary to make time graphs. We prepared .csv files manually and put them in this folder. To run the time graph, you need an input.csv and a color.csv prefaced by the novel acronym. Running ant when in this directory will first run a python script that generates an svg graph and then an XSLT script that converts it to HTML. The CSS and JS files help make the HTML interactive. 

## Legacy Scripts
This directory contains all the scripts and files we used in the process of developing the scripts that worked. The scripts in this file may work, but they don’t work as well as the scripts in the other directories. 