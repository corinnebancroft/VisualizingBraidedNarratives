# Gephi Toolkit 

This module provides a headless Java pipeline using the Gephi Toolkit
to reproduce network analysis and layout steps programmatically.

The app.java script will look for .csv files in character_networks/UVic_database/data. All of the novels we read for the project are there. If you want to do other novels in the future you will need to add a directory with that novel's acronym and a subdirectory titled GephiReadyExports prefaced by a date. For example: character_networks/UVic_database/data/be/June1GephiReadyExports. 

To add colors manually, you will have to run the script once and then modify the community_leader .csv files and then run the script again. There is a screenshot of the color options.

## Requirements
- Java 11
- Apache Maven

## How to use
Navigate to gephi_toolkit/gephi-toolkit and run:

```bash

mvn compile
mvn exec:java -Dexec.mainClass=edu.youruniversity.vbn.App

mvn clean compile
mvn exec:java -Dexec.mainClass=edu.youruniversity.vbn.App

## Notes

mvn compile makes sure it works; mvn clean makes sure there is nothing old in memory 
if you're sure everything is good you can just run mvn exec:java -Dexec.mainClass=edu.youruniversity.vbn.App
