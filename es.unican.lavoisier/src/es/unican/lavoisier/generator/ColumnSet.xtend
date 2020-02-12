package es.unican.lavoisier.generator

import java.util.ArrayList
import java.util.HashMap
import java.util.List
import java.util.Map
import org.eclipse.emf.ecore.EObject

class ColumnSet {

  List<String> columnNames
  Map<EObject, List<ValueWrapper>> rows

  new() {
    columnNames = new ArrayList<String>
    rows = new HashMap<EObject, List<ValueWrapper>>
  }

  def getColumnNames() {
    return columnNames
  }

  def getRows() {
    return rows
  }

  def addColumnNames(List<String> names) {
    columnNames.addAll(names)
  }

  def addColumnValues(EObject instance, List<ValueWrapper> values) {
    if (rows.get(instance) == null) {
      rows.put(instance, new ArrayList<ValueWrapper>(values))
    } else {
      rows.get(instance).addAll(values)
    }
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
