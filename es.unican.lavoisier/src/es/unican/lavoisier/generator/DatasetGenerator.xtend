package es.unican.lavoisier.generator

import java.util.ArrayList
import java.util.List

class DatasetGenerator {

  List<String> columnNames
  List<List<ValueWrapper>> rows

  new() {
    columnNames = new ArrayList<String>
    rows = new ArrayList<List<ValueWrapper>>
  }

  override String toString() {
    val s = new StringBuilder
    s.append(columnNames.join(",")).append("\n")
    for (row : rows) {
      s.append(row.map[value | value.toString()].join(",")).append("\n")
    }
    return s.toString
  }

  def addColumnNames(List<String> names) {
    columnNames.addAll(names)
  }

}
