package es.unican.lavoisier.generator

import java.util.ArrayList
import java.util.HashMap
import java.util.List
import java.util.Map
import org.eclipse.emf.ecore.EObject

class DatasetGenerator {

  List<EObject> instances
  List<String> columnNames
  Map<EObject, List<ValueWrapper>> rows

  new(List<EObject> instances) {
    this.instances = instances
    columnNames = new ArrayList<String>
    rows = new HashMap<EObject,List<ValueWrapper>>
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

  def addColumnSet(ColumnSet columnSet) {
    columnNames.addAll(columnSet.getColumnNames())
    val columnSetRows = columnSet.rows
    for (instance : columnSetRows.keySet) {
      if (rows.get(instance) == null) {
        rows.put(instance,
                 new ArrayList<ValueWrapper>(columnSetRows.get(instance)))
      } else {
        rows.get(instance).addAll(columnSetRows.get(instance))
      }
    }
  }

}
