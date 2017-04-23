# Lavoisier

Lavoisier is a language which allows the selection of entities from a domain model and transforms the selected entities instances into tabular-formatted data.

You can find data selection examples in the lavoisier-example project.

## Requirements
Xtext 2.8.4.

## Usage instructions

- Import "es.unican.lavoisier..." projects into an eclipse workspace.
- Generate model code for all genmodels present in es.unican.lavoisier.domainModels/models/
- Right-click "es.unican.lavoisier/src/es.unican.lavoisier/Lavoisier.xtext" and run "Generate Xtext artifacts".
- Right-click "es.unican.lavoisier" project and select "Run Eclipse Application".
- In the newly opened eclipse instance, import "lavoisier-example" project.
- The file "getDatasets.lv" contains dataset generation examples over a domain model. CSV files get generated at src-gen folder.
