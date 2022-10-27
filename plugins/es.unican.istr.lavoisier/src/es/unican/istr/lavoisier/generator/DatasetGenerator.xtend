package es.unican.istr.lavoisier.generator

import java.util.List
import org.eclipse.emf.ecore.EObject

class DatasetGenerator extends ColumnSet {

  List<EObject> instances

  new(List<EObject> instances) {
    super()
    this.instances = instances
  }

  override String toString() {
    rows.keySet
    val s = new StringBuilder
    s.append(columnNames.join(",")).append("\n")
    for (instance : instances) {
      s.append(rows.get(instance).map[value |
                                      value.toString()].join(",")).append("\n")
    }
    return s.toString
  }
}
