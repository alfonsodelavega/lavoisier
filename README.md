# Lavoisier

Lavoisier is a language which allows the selection of entities from a domain model and transforms the selected entities instances into tabular-formatted data, which can be used as input of data mining algorithms for an analysis.

You can find data selection examples in the [lavoisier-example](https://github.com/alfonsodelavega/lavoisier/tree/master/lavoisier-example) Eclipse project of this repository, or in the [lavoisier-evaluation](https://github.com/alfonsodelavega/lavoisier-evaluation) external repository where a comparison between Lavoisier and state-of-the-art technologies for data selection and formating is shown.

## Requirements
Xtext 2.8.4.

## Usage instructions

- Import "es.unican.lavoisier..." projects into an eclipse workspace.
- Generate model code for all genmodels present in es.unican.lavoisier.domainModels/models/
- Right-click "es.unican.lavoisier/src/es.unican.lavoisier/Lavoisier.xtext" and run "Generate Xtext artifacts".
- Right-click "es.unican.lavoisier" project and select "Run Eclipse Application".
- In the newly opened eclipse instance, import "lavoisier-example" project.
- The file "extractions/dummy.lv" inside that project is a simple example of dataset specifications over a domain model. CSV files are generated at src-gen folder.
