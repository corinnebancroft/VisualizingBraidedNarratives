# Gephi Toolkit Pipeline

This module provides a headless Java pipeline using the Gephi Toolkit
to reproduce network analysis and layout steps programmatically.

## Requirements
- Java 11
- Apache Maven

## Usage
From this directory:

```bash
mvn compile
mvn exec:java

mvn compile
mvn exec:java -Dexec.mainClass=edu.youruniversity.vbn.App
