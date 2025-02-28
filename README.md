Story space edges:

This script reads three CSV files, which correspond to the `characters`, `narrContainers`, and `menExs` tables from the DB. It outputs three files:


1. A human-readable CSV for proofreading (with LOTS of columns);
2. An "intermediate" file between a human-readable file and a Gephi-style file that feeds into the next step, which is the final postprocessing script for story edges (with some additional columns, such as character names);
3. And, a Gephi-ready file with only the bare bones columns ('source', 'target', 'type', 'weight', 'startPage', 'category'). 

Final postprocessing:

This file consumes the intermediate result from the story space edges and outputs a twice post-processed file, where we get rid of the "overlapping" relationships between 
between characters. This means that if two characters have more than one of "Exchange", "Knows", and "Knows of", the highest-specificity relationship is kept.

Text space edges:

This script takes in the final-postprocessing results, which are by now *twice* processed, and produces a human-readable output for proofreading, and a Gephi-ready output. 