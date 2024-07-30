# Lavoisier

**Note**: A subsequent language that follows similar principles and objectives to those of Lavoisier, named Pinset (pincer/Pinsir of datasets), has been implemented on top of the Epsilon platform.
Pinset is integrated and actively maintained as part of Epsilon, and its official documentation can be found [here](https://www.eclipse.org/epsilon/doc/pinset/).

---

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

## How to cite

```bibtex
@article{lavoisier2020,
  author    = {Alfonso de la Vega and
               Diego Garc{\'{\i}}a{-}Saiz and
               Marta E. Zorrilla and
               Pablo S{\'{a}}nchez},
  title     = {Lavoisier: {A} {DSL} for increasing the level of abstraction of data
               selection and formatting in data mining},
  journal   = {J. Comput. Lang.},
  volume    = {60},
  pages     = {100987},
  year      = {2020},
  url       = {https://doi.org/10.1016/j.cola.2020.100987},
  doi       = {10.1016/j.cola.2020.100987}
}
```
